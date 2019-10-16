<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per identifier     -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:identifier">
      
      <xsl:value-of select="$id/@value"/><xsl:text>;</xsl:text>
      
      <xsl:value-of select="fhir:use/@value"/><xsl:text>;</xsl:text>
      
      <!-- FHIR data type: Identifier -->
      <!-- FHIR data type: CodeableConcept -->
      <xsl:value-of select="fhir:type/fhir:coding/fhir:system/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:version/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:code/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:display/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:userSelected/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:type/fhir:text/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:system/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:value/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:period/fhir:start/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:period/fhir:end/@value"/><xsl:text>&#xa;</xsl:text>
      
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
