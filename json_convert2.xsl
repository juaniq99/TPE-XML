<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="utf-8"/>

<xsl:strip-space elements="*"/>
	
<xsl:template name="comma">
	<xsl:if test="position() != last()">
	<xsl:text>,</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template name="itemIterator">
	<xsl:param name="value"/>
	<xsl:for-each select="$value/item">
		<xsl:text>{"period": "</xsl:text> 
       		<xsl:value-of select="attribute()"/> 
		<xsl:text>",</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>}</xsl:text>
		<xsl:call-template name="comma"/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="/result">
	<xsl:choose>
		<xsl:when test="count(./serie) != 0">
			<xsl:call-template name="notEmpty"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="Empty"/>
		</xsl:otherwise>
	</xsl:choose>	
</xsl:template>

<xsl:template name="Empty">
	<xsl:text>{ "result": {</xsl:text> 
	<xsl:call-template name="error"/>
        <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template name="notEmpty">
        <xsl:text>{"result": [</xsl:text> 
	<xsl:apply-templates/>
        <xsl:text>]}</xsl:text>
</xsl:template>

<xsl:template name="error">
        <xsl:text>"error": "Series not found for the given historical years"</xsl:text> 
        <xsl:text>}</xsl:text>
</xsl:template>

<xsl:template match="//serie">
        <xsl:text>{</xsl:text> 
        <xsl:call-template name="valueElement">
	      	<xsl:with-param name="node" select="./area"/>
      	</xsl:call-template>
        <xsl:call-template name="valueElement">
	      	<xsl:with-param name="node" select="./freq"/>
      	</xsl:call-template>
        <xsl:call-template name="valueElement">
	      	<xsl:with-param name="node" select="./activity"/>
      	</xsl:call-template>
        <xsl:call-template name="printValues">
          <xsl:with-param name="values" select="./values"/>
      	</xsl:call-template>
        <xsl:text>}</xsl:text>
	<xsl:call-template name="comma"/>
</xsl:template>

<xsl:template name="printValues">
  <xsl:param name="values"/>
	<xsl:text>"</xsl:text>
	<xsl:value-of select="values/name()"/> 
	<xsl:text>": [</xsl:text>
	<xsl:call-template name="itemIterator">
		<xsl:with-param name="value" select="."/>
	</xsl:call-template>
	<xsl:text> ] </xsl:text>
</xsl:template>

<xsl:template name="valueElement">
        <xsl:param name="node"/>
        <xsl:text>"</xsl:text> 
        <xsl:value-of select="$node/name()"/> 
        <xsl:text>": "</xsl:text>
	<xsl:value-of select="$node/text()"/>
	<xsl:text>"</xsl:text> 
	<xsl:call-template name="comma"/>
</xsl:template>

</xsl:stylesheet>
