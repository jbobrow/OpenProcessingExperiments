
//Tell Processing to load the XML library it needs
XML xml;

//Tell processing we plan to use a font; and give it a name. 
PFont labels;

void setup() {
  //Make the sketch 1000 x 1000. Use 2D.  
  size(2000,900,P2D);
  background(181,210,254);
  //Anti-alias the shapes drawn
  smooth(8);
  //Tell processing to run draw once, not forever. 
  noLoop();
  //Tell processing to use 8px Helvetica (anti-aliased) for labels
  labels = createFont("Helvetica", 8, true);
  //Load the XML file with the data
  xml = loadXML("dots.xml");
}

void draw() {
  //run the plot function (defined below)
    plot();
}

// Plot does all the mapping work– but only after it is told to. It runs once; inside draw. 
void plot() {
  //Get the children named "city" <city></city>
  XML[] children = xml.getChildren("city");

  //Run through the XML document, and do the following for every child
  for (int i = 0; i < children.length; i++) {
     
    String name = children[i].getContent();
    
    //Get the size and apply it to variable "size"
    int size = children[i].getInt("size");
    
    //Get the longitude. Assign it to the variable longitude. Scale value to spead out points to better display
    float longitude = (children[i].getFloat("longitude")-50)*6;
    
    //Get the latitude. Assign it to the variable latitude. Scale value to spread out points to better display
    float latitude = (children[i].getFloat("latitude")-20)*-6;
  
  
  
    //Move the origin (0,0) to the center of the sketch; This makes the coordinate system more like a map
    pushMatrix();
      translate(width/2,height/2);
      fill(40,153,247);
      noStroke();
      //Draw the ellipse at  longitude / Latitude. Make it as big as the the "Size" defined in XML
      ellipse((longitude), (latitude), size, size);
      fill(73,97,130);
      textFont(labels);
      // Offset text position to the right & center of the dot
      text(name,(longitude + 5),(latitude + 2));  
    popMatrix();
  }
}


