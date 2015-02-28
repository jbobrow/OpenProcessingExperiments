
void setup () {
  size(600, 600);
  background(154,201,250); 
  textSize(32);
  textAlign(CENTER);
  
}
void draw (){
  
  if (mousePressed) {
      fill(0,185,255);
      rectMode(CENTER);
      rect( mouseX, mouseY, 600-mouseX, 600-mouseX,30);
  } 
  else {
      fill(13,250,204);
      rectMode(CENTER);
      rect( mouseX, mouseY, mouseX, mouseX);
  }
  //premi spazio per pulire lo schermo
  if (keyPressed && key== ' ') {
      background(154,201,250);
  }   
  
  fill(0);
  text("Press spacebar to clear the screen!",300,500);
}


