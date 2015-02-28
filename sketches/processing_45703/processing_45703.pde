
PImage water; //or this could be something more visual
float rot; //may use rotation at some point
// PImage maskImg; AT SOME POINT

//this is for locations
String message = "Croton, Gilgo, GSB, Plumb Beach";
PFont f;
float r = 200;

//can I make the locations rotate?
int wordAngle = 0;
int wordChange = 5;
final int ANGLE_LIMIT = 135;
  
  //reading weather
  String myString;
  String windspeedString;
   int windspeedNum;
XMLElement xml;

//and need to add humidity

//this will be useful for the Click on various locations
boolean button = false; 

void setup() {
  size (500, 500);
  water = loadImage ("water.jpg");
  //maskImg = loadImage ("mask.jpg"); AT SOME POINT
  
  //this is for writing the names of locations
  f = createFont ("Garamond", 20, true);
  textFont (f);
  textAlign (CENTER);
  smooth();
}

void draw () {
  background (255);
  
  //drawing sections for locations and weather types
  stroke (0);
  line (0, height/2, width, height/2); 
  line (width/2, 0, width/2, height);  
  
  //this is for the circle drawing part
  translate (width/2, height/2);
  noFill();
  stroke(0);
  ellipse (0,0,r*2, r*2);
  ellipse (0, 0, r*1.5, r*1.5);
  float arclength = 0;
  
  for (int i = 0; i<message.length(); i++) {
    char currentChar = message.charAt (i);
    float w = textWidth (currentChar);
    arclength += w/2;
    float theta = PI + arclength/r; //not sure I really understand this
    
    pushMatrix ();
    
    //can I make the words rotate around? maybe with interactive rotation (transform 2d)
    /*
    wordAngle += wordChange;
    if wordAngle  > ANGLE_LIMIT || wordAngle < 0) 
    {
      wordChange = -wordChange;
      wordAngle += wordChange;
    }
    */
    
    translate (r*cos (theta), r*sin(theta));
    rotate (theta+PI/2);
    fill(0);
    text(currentChar, 0, 0);
    popMatrix();
    arclength += w/2;
  }
  
//drawing circular interface like a window OR WILL THIS BE TAKEN CARE OF ABOVE 
  /*
  pushMatrix ();
  translate (width/2, height/2);
  ellipseMode (CENTER);
  ellipse (0, 0, 475, 475);
  ellipse (0, 0, 375, 375);
  popMatrix ();
  */ 
  
//if you click on LOCATION section... should display next layer of interface (to skip ahead, would be wind in Croton and photo of Croton)
  if (mouseX < width/2 && mouseY < height/2 && mousePressed){
    button = true;
  } else {
    button = false;
  }
  
  if (button) {
      
    String WhitePlainsAirport = "http://www.weather.gov/xml/current_obs/KHPN.xml";
      xml = new XMLElement(this, WhitePlainsAirport);
        println(xml);
      XMLElement windspeedXML = xml.getChild("wind_mph");
        String windspeedString = windspeedXML.getContent();
         windspeedNum = int(windspeedString);
             println(windspeedNum);
  text (windspeedNum, width/2, height/2); //THE GOAL! TO DISPLAY THE WINDSPEED in the center IF THE USER CLICKS THE KAHULUI SECTION (?!)
    
    //img.mask (maskImg);
      image (water, -width/4, -height/4);
   /*
    pushMatrix();
    scale(2.0);
      image (water, -width/4, -height/4);
    popMatrix();
*/
  } else { //do nothing
  }
  

}


