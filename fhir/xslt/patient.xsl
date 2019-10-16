<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per Patient        -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:value-of select="fhir:id/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:active/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:gender/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:birthDate/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:deceasedBoolean/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:deceasedDateTime/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:multipleBirthBoolean/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:multipleBirthInteger/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:managingOrganization/fhir:reference/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:managingOrganization/fhir:type/@value"/><xsl:text>;</xsl:text>
    <!-- add managing organization identifier here if required -->
    <xsl:value-of select="fhir:managingOrganization/fhir:display/@value"/><xsl:text>&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
