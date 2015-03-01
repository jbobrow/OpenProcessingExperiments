
PFont myFont; 
PShape luv;
PImage luvbg;
float diameter; 
float angle = 0;

void setup() {
  size(640, 480);
  diameter = height - 80;
  fill(255, 0, 0);
  
  myFont = createFont ("Arial Black", 32);
  luv = loadShape("Love_Heart_SVG.svg"); 
  luvbg = loadImage("bg.gif");
}

void draw() { 
  //load background image
  image(luvbg,0,0, width, height);
  
  float dia = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  
  //the text is the second layer appearing
  fill(0);
  textAlign(CENTER);
  textFont(myFont);
  text("I LOVE YOU <3", width/2, dia/2);
  
  //the heart shape is what you see first
  shapeMode(CENTER);
  shape(luv, width/2, height/2, dia, dia);
  
  angle += 0.04;
 
}



