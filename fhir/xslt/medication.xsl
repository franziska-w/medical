<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Medication node                          -->
<!-- Description: Extract values of nodes appearing 0...1 per Medication     -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Medication">
    <xsl:value-of select="fhir:id/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:coding/fhir:system/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:coding/fhir:version/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:coding/fhir:code/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:coding/fhir:display/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:coding/fhir:userSelected/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:code/fhir:text/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:status/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:manufacturer/fhir:reference/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:manufacturer/fhir:type/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:coding/fhir:system/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:coding/fhir:version/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:coding/fhir:code/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:coding/fhir:display/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:coding/fhir:userSelected/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:form/fhir:text/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:batch/fhir:lotNumber/@value"/><xsl:text>;</xsl:text>
    <xsl:value-of select="fhir:batch/fhir:expirationDate/@value"/><xsl:text>&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
