<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per name           -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:name">
      <xsl:value-of select="$id/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:use/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:text/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:family/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:given/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:prefix/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:suffix/@value"/><xsl:text>&#xa;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
