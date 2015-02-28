
void setup () {
  size (400, 400);
  smooth ();
  }
  
  void draw () {
    frameRate (7);
    stroke (230);
    rectMode (CENTER);
    rect (10, 200, mouseX, mouseY, mouseX, mouseY, 1, 200);

  if(mousePressed){
    fill (random(mouseY));
    noStroke();
    frameRate (50);
    rect (200, 200, mouseX, mouseY, mouseX, mouseY, 1, 200);
   }else{
   }
 }

