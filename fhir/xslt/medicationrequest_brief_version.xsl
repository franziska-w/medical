<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- Set separator and new line characters -->
<xsl:variable name="customSeparator" select="';'"/>
<xsl:variable name="customNewLine" select="'&#xa;'"/>

<!-- Header information:
     id;Med_id;Med_code_system;Med_code_code;Med_code_display;subject_reference;subject_type;subject_display -->

<!-- ======================================================================= -->
<!-- Template:    Match id node and MedicationRequest node                   -->
<!-- Description: Extract values of nodes appearing 0...1 per MedicationReq. -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:MedicationRequest">
 
    <!-- id -->
    <xsl:value-of select="fhir:id/@value"/><xsl:value-of select="$customSeparator"/>

    <!-- MedicationRequest/Medication has FHIR data type: CodeableConcept -->
    <xsl:value-of select="fhir:Medication/fhir:id/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:Medication/fhir:code/fhir:coding/fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:Medication/fhir:code/fhir:coding/fhir:code/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:Medication/fhir:code/fhir:coding/fhir:display/@value"/><xsl:value-of select="$customSeparator"/>

    <!-- MedicationRequest/subject has FHIR data type: Reference -->
    <xsl:value-of select="fhir:subject/fhir:reference/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:subject/fhir:type/@value"/><xsl:value-of select="$customSeparator"/>
    <!-- add subject identifier here if required -->
    <xsl:value-of select="fhir:subject/fhir:display/@value"/><xsl:value-of select="$customNewLine"/>

  </xsl:template>
</xsl:stylesheet>
