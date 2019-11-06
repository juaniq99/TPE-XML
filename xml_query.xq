<result>
{
(: declare variable $metadata as xs:external :)
for $serie in doc("data.xml")//Series
(:	where (max(./Obs/@TIME_PERIOD) - min(./Obs/@TIME_PERIOD) >= N)         ARREGLAR :)
	return
	{
	let := $metadata in doc("metadata.xml")/
	return
		<serie>
			<freq>{$metadata/cl_freqs/cl_freq[./@id == $serie/@FREQ.282]}</freq>
			<activity>{$metadata/cl_activities/cl_activity[./@id == $serie/@ACTIVITY.282]}</activity>
			<area>{$metadata/cl_areas/cl_area[./@id == $serie/@REF_AREA.282]}</area>
		</serie>
	}
}
</result>
