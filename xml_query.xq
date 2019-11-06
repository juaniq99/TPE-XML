<result>
{
let $nl := "&#10;"
let $metadata := doc("metadata.xml")/metadata
for $serie in doc("data.xml")//Series
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
				order by $serie/Obs/@TIME_PERIOD
				return
					<item TIME_PERIOD= {$serie/Obs/@TIMEPERIOD}>
		{$nl}
						<obs>{$item/OBS_VALUE}</obs>
		{$nl}
					</item>	
			}</values>
		{$nl}
		</serie>
}
</result>
