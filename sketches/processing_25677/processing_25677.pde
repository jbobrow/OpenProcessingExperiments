

XMLElement xml;
String descriptions[];
int numSites;

void setup() {
  size(1100, 800);

  xml = new XMLElement(this, "Red.xml");      // loads XML tree
  numSites = xml.getChildCount();

  XMLElement[] reds = xml.getChildren();  // put all trains into an array

  println (reds.length);  // how many trains?

  descriptions = new String[reds.length];  

  // for all the trains in the array
  for (int i=0; i < reds.length; i++) {
    XMLElement theTrip = reds[i].getChild(0);        
    String trip = theTrip.getContent();              
    XMLElement theplatform = reds[i].getChild(1);       
    String platform = theplatform.getContent();
    descriptions[i] = (trip + " and " + platform);      
  }

  println(descriptions);
  smooth();
}

void draw() {
  background(150);
  noStroke();
  int xcounter = 30;
  int ycounter = 30;

  for (int i=0; i < numSites; i++) {
    ellipse(xcounter, ycounter, 7, 7);
    text(descriptions[i], xcounter+10, ycounter);
    ycounter += 10;
     if(ycounter > height) {              
   ycounter = 30;                     
   xcounter += 150;                   
     } else {                        
    ycounter += 30;                    
     }
   }
   
}


