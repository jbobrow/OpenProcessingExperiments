
PFont font;

float x=130.0;

void setup(){
  size(250,250);
  font=loadFont("SynchroLET-20.vlw");
  background(0);
  textFont(font);
}

void draw(){
  fill(0,230);
 rect(140,140,85,85);
 //black rectangle in bottom right corner
  fill(250,40);
  text("L1C 5K5", mouseX, mouseY);
}
//text following the mouse

void mouseMoved(){
  x+=5;
  noStroke();
  if(x>250){
    x=0;}
    
      stroke(0);

      fill(random(0,250), random(0,250));
      text("L1C5K5", 150,190);
      //text flickering inside the square
}

