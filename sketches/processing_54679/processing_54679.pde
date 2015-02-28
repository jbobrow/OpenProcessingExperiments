
PFont p;
 
void setup(){
  size(313,400);
  
    size(313,400);
  PImage handywoman = loadImage("handywoman.jpg");
  background(handywoman);

 
  p = loadFont("LiGothicMed-170.vlw");
}

void draw () {

}


void mousePressed(){
  
    fill(random(255),0,0);
  textFont(p);
  textSize(50);
  text("HANDYWOMAN", mouseX, mouseY);

}

