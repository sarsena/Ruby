require 'oci8'
load '../configs/stg-config.rb'
class Numeric
  def percent_of(n)
    self.to_f / n.to_f*100
  end
end

$total_array = []
$title_array = []
$ruby_array = []
$oci.exec("select s.queue_tags_friendly_name, count(q.order_id), MAX(s.sequence) smax
from cink.queue_tags q
INNER join reportingonly.sala_dashboard_q_tolerance s
on q.name = s.queue_tags_name
group by s.queue_tags_friendly_name
order by smax") do |queue|
	name = queue[0]
	qty = queue[1]
	qty.to_s
	qty = qty.to_f.floor
	total = qty
	qty = qty/4
	percentage = qty.percent_of(total).floor
	p percentage
	$title_array.push(name)
	$total_array.push(total)
end
p $title_array
p $total_array
