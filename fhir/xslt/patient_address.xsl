<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per address        -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:address">
      
      <xsl:value-of select="$id/@value"/><xsl:text>;</xsl:text>
      
      <!-- FHIR data type: Address -->
      <xsl:value-of select="fhir:use/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:text/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:line/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:city/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:district/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:state/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:postalCode/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:country/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:period/fhir:start/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:period/fhir:end/@value"/><xsl:text>&#xa;</xsl:text>
      
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
