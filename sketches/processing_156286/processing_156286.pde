
PImage mous;
PImage eye;
PFont OCRAStd72;
int mousX;
int mousY;




void setup(){
size(800,500);
mous= loadImage("12oz.gif");
eye= loadImage("eye.gif");
OCRAStd72 = loadFont("OCRAStd-72.vlw");
mousX= width/2;
mousY= width/2;
}

void draw(){
  background (255);
  image(eye,mouseX, mouseY, 100,100);
  textFont(OCRAStd72);
  text("12 OZ MOUSE",150,100);
  if (mouseX > width/2) {
    mousX++; mousY++;
  } else
  if (mouseX < width/2) {
    mousX--; mousY--;
  }
  else {
    mousY--;
  }
  image(mous, mousX, mousY, 200, 200);
  if(mousePressed); {
    fill (random(255),random(255),random(255));
}
  
}


