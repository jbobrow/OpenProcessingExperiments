
void setup() {
  size (500, 500);
  background (255);
  textSize (15);
  fill (0);
  text ("press 'C' to delete", 300, 460);
  
 
}


void draw () {
 
  
  float weight =dist (pmouseX, pmouseY, mouseX, mouseY);
  strokeWeight (weight);
  stroke(100, 10, pmouseX);
 
 
 if (keyPressed){
   if ( key == 'c');
  fill (255);
  noStroke ();
  rect (0,0, width, height);
  }
  
  if (pmouseX > 0 && mousePressed){
  line (pmouseX, pmouseY, mouseX, mouseY);
  }
  





  }



