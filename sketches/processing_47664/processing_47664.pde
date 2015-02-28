
void setup(){
size (640, 480);
background (#ffbca9);
smooth ();
 
 
//type
PFont font;
font = loadFont ("CenturyGothic-48.vlw");
textFont (font, 160);
}

void draw(){
//top 
fill(#ffffff, 90);
background(#ffffff);
PImage img02;
  smooth();
  img02 = loadImage("blurstreets.jpg");
  image(img02, 0, 0);


text("BUS", random(-7), 220);

fill(#000000,50);
strokeWeight(4);
noStroke();
ellipse(125,235,425,425);

//bottom
fill( #ffffff, 90);
text("RIDE", random(-7), 380);


}


