

PFont font;// declare

void setup(){//setup details bkg, colour etc.
size(250, 250);
background(0);
smooth();
font= loadFont ("Garamond-48.vlw");
textFont(font);
background(255);
textAlign(CENTER);
textSize(30);
}
 
 float x = .5; //declare variable and value
void draw (){ 
  fill (abs(x)); //increase by increments of .5
  x++; 
  text ("L5V2M2",mouseX, mouseY, abs(x), abs(x)); 
  //will move with mouse and increase sideways at .5 in white-black gradient
  ////////////
  if(x > 125) { //set boundaries
    x = -125;
  }
   
}



