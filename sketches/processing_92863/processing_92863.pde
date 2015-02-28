
//import megamu.mesh.*;

PFont myFont;
String myText="A";

void setup() {
  size(775, 400);
  myFont = createFont("GenBasB.ttf", 48);
} 

void draw() {
  background(51, 51, 51);
  textFont(myFont, 160);
  fill(255, 255, 255);
  translate(width/2, height/2);
  for (int i=0; i<12; i=i+1) {
    fill(255, 255, 255);
    textAlign(CENTER); //LEFT CENTER RIGHT
    pushMatrix();
    rotate(PI*i/3);
    text(myText, 0, 0);
    popMatrix();
  }
} 

void keyPressed() {  
  if (key == CODED)
  {
    if (keyCode == LEFT) 
    {
      myText = "";
    }
  }
  else
      myText = "";
  {

    myText = myText + key;
  } 
}


