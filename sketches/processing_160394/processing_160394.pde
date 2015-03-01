

void setup () {
  // Pink (pale red)
fill(255,200,200);
ellipse(60,20,16,16);
// 25% opacity.
fill(255,0,0,63);
rect(0,150,200,40);
  size (400, 400);
  smooth ();
  background ( 130, 0, 150);
  background(3410); 
  rectMode (CENTER);
  }
   
  void draw () {
    //    line (pmouseX, pmouseY, mouseX, mouseY);
  }
   
  void mousePressed () {
    rect (mouseX, mouseY, 50, 50);
  }
   
  void keyPressed () {
    background (130, 0, 150);
     // 25% opacity.
fill(255,0,0,63);
rect(0,150,200,40);
  }
     


