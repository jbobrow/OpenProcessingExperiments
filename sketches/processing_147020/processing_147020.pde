
void setup(){
 size(400,400);

 float zipcode;
 float alter;
 float hausnummer;
 float koerpergroesse;
 
 zipcode = 15344;
 alter = 21;
 hausnummer = 48;
 koerpergroesse = 1.62;

 println(zipcode / hausnummer); 
 println(koerpergroesse - alter);
}

void draw(){

String vorname = "clara";
String nachname = "tiefenthaler";
String strasse = "fontanestrasse";
 if(vorname == "clara" || nachname == "tiefenthaler"){
 println("blubb");
 }
 for(float zipcode = 10; zipcode < width; zipcode = zipcode * 1.2){
   for(float koerpergroesse = 10; koerpergroesse < 20; koerpergroesse = koerpergroesse + 0.7){
   rect(zipcode, koerpergroesse, 5, 10);
   }
 }
 
 
}
