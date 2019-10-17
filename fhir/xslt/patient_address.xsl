<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- Set separator and new line characters -->
<xsl:variable name="customSeparator" select="';'"/>
<xsl:variable name="customNewLine" select="'&#xa;'"/>

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per address        -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:address">
      
      <!-- id -->
      <xsl:value-of select="$id/@value"/><xsl:value-of select="$customSeparator"/>
      
      <!-- Patient/Address has FHIR data type: Address -->
      <xsl:value-of select="fhir:use/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:text/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:line/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:city/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:district/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:state/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:postalCode/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:country/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:period/fhir:start/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:period/fhir:end/@value"/><xsl:value-of select="$customNewLine"/>
      
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
