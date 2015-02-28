
XMLElement xml;
String descriptions[];

int numSites;

 
void setup() {
  size(800, 700);
 
  xml = new XMLElement(this, "orange.xml");      
  numSites = xml.getChildCount();
 
  XMLElement[] orange = xml.getChildren(); 
 
  println (orange.length);  // how many trains?
 
  descriptions = new String[orange.length]; 
 
  // for all the trains in the array
  for (int i=0; i < orange.length; i++) {
    XMLElement theTrip = orange[i].getChild(0);       
    String trip = theTrip.getContent();             
    XMLElement theplatform = orange[i].getChild(1);      
    String platform = theplatform.getContent();
    XMLElement thetime = orange[i].getChild(4);      
    String time = thetime.getContent();
    descriptions[i] = (time + " , " + platform);     
  }
 
  println(descriptions);
  smooth();
}

void draw() {
  background(0);
  noStroke();
  int xcounter = 30;
  int ycounter = 30;
 
 
  for (int i=0; i < numSites; i++) {
  text(descriptions[i], xcounter+10, ycounter);
    ycounter += 10;
     if(ycounter > height) {             
   ycounter = 30;                    
   xcounter += 140;                  
     } else {                       
    ycounter += 20;                   
     }
   }
    
}




