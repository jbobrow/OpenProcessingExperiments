
PFont myFont;

void setup() {
  size(600, 600);
  background(5,28,64);
  
  myFont = createFont("Serif", 250);
  textFont(myFont, 250);
  translate(width/2,height/2);
  
  for (int i=0; i<8; i++) {
    fill(255, 255,255,220);
    textAlign(CENTER);
   
    rotate(PI*1/4);
    text("Q",0,0);

  }
}

