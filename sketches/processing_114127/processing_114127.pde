

PFont blender;
PImage pic;

void setup() {
  size(600, 600);
  blender = loadFont( "BlenderPro-Book-48.vlw" );
  pic = loadImage("ying_2.jpg");
  image(pic, 0, 0, 600, 600);
}



void draw() {
  
  fill(255);
  textFont(blender);
  text("We are what we repeatedly do.", 18, height/2);
  translate(mouseX, mouseY);
  rotate(random(frameCount/10,frameCount/60));
  textFont(blender,24);
  text("repeadtedly",0,0);
}



