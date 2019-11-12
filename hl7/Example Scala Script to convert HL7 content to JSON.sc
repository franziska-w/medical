//Example Scala Script to convert HL7 content to JSON
//Author: Franziska Weng
//Comment: Test script in https://scalafiddle.io/ - add library Play JSON codecs 4.0.0 before running script.


//LOAD PACKAGES
import play.api.libs.json.{JsValue, Json}


//HL7 INPUT DATA
var message_content: String = """MSH|^~\&|GHH LAB|ELAB-3|GHH OE|BLDG4|200202150930||ORU^R01|CNTRL-3456|P|2.4
PID|||555-44-4444||EVERYWOMAN^EVE^E^^^^L|JONES|19620320|F|||153 FERNWOOD DR.^^STATESVILLE^OH^35292||(206)3345232|(206)752-121||||AC555444444||67-A4335^OH^20030520
OBR|1|845439^GHH OE|1045813^GHH LAB|15545^GLUCOSE|||200202150730|||||||||555-55-5555^PRIMARY^PATRICIA P^^^^MD^^|||||||||F||||||444-44-4444^HIPPOCRATES^HOWARD H^^^^MD
OBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F
OBX|1|SN|1554-5^GLUCOSE^POST 12H CFST:MCNC:PT:SER/PLAS:QN||^182|mg/dl|70_105|H|||F"""


//PROCESSING

//declare variables
var content_map: Map[String, String] = Map()
var component_type_counter: scala.collection.mutable.Map[String, Int] = scala.collection.mutable.Map()
var component_types: Seq[String] = Seq()

//split message into components
val message_components = message_content.split("""\n""").map(_.trim)

//count components of same type
for(message_component <- message_components){
  val component_type = message_component.split("""\|""")(0)
  component_types = component_types :+ component_type
  component_type_counter += (component_type -> 0)
}
val component_type_count = component_types.groupBy(identity).mapValues(_.size)

//create map from HL7 message content
for(message_component <- message_components){
  val component_values = message_component.split("""\|""")
  var component_type: String = component_values(0)
  
  //if the component type occurs more than once, concatenate count to type
  if(component_type_count(component_type) > 1){
    component_type_counter(component_type) += 1
    component_type = component_type + "_" + component_type_counter(component_type)
  }
  
  //write content map entries
  var i: Int = -1
  for(component_value <- component_values){
    i += 1
    if(i > 0 & component_value != ""){
      val component_attribute = component_type + "." + i
      content_map += (component_attribute -> component_value)
    }
  }
}

//convert to json
val json: JsValue = Json.toJson(content_map)

//print result
println(Json.prettyPrint(json))
