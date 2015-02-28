
String mytext;
PFont yayfont;
PImage coral;
PImage agate;
PImage scallop;

int opacity = 5;
int opacityspeed = 2;

void setup() {
  size(400,400);
  mytext = "yay microscopes!";
  yayfont = loadFont("Brandywine-48.vlw");
  coral = loadImage("coral2.jpg");
  agate = loadImage("agate.jpg");
  scallop = loadImage("scallop.jpg");
  
}

void draw() {
  background(0);
  
  opacity = opacity + opacityspeed;
  
  image(coral, 0, 0);
  
  textFont(yayfont);
  fill(255,255,255,opacity);
  text(mytext, 100, 200);
  textSize(30);
  
  
  if (opacity > 85) {
    image(agate, 0, 0);
      textFont(yayfont);
  fill(255,255,255,opacity);
  text(mytext, 100, 200);
  textSize(30);
  }
  
  if(opacity > 170) {
      image(scallop, 0, 0);
  textFont(yayfont);
  fill(255,255,255,opacity);
  text(mytext, 100, 200);
  textSize(30);
  }
  
  if (opacity > 255) {
    opacityspeed = -2;
  }
  
  if (opacity < 0) {
    opacityspeed = 2;
  }
}




