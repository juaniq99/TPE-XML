declare variable $years as xs:integer external;
if ($years < 0) then
	error()
else

<result>
{
let $nl := "&#10;"
let $metadata := doc("metadata.xml")/metadata
for $serie in doc("data.xml")//Series

	let $count := max($serie/Obs/@TIME_PERIOD) - min($serie/Obs/@TIME_PERIOD)

	where $serie/@UNIT_MEASURE.282 = "PS" and $count >= $years
	order by $serie/@REF_AREA.282
	return
		<serie>
		{$nl}
			<freq>{$metadata/cl_freqs/cl_freq[./@id = $serie/@FREQ.282]/text()}</freq>
		{$nl}
			<activity>{$metadata/cl_activities/cl_activity[./@id = $serie/@ACTIVITY.282]/text()}</activity>
		{$nl}
			<area>{$metadata/cl_areas/cl_area[./@id = $serie/@REF_AREA.282]/text()}</area>
		{$nl}
			<values>{
				for $item in $serie/Obs
				order by $item/@TIME_PERIOD
				return
					<item TIME_PERIOD= "{$item/@TIME_PERIOD}">
		{$nl}
							<obs>{data($item/@OBS_VALUE)}</obs>
		{$nl}
					</item>	
			}</values>
		{$nl}
		</serie>
}
</result>


