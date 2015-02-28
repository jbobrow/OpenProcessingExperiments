
void setup() {
  size(400,400);
  background(200);
  strokeWeight(8);
}



void draw() {
  if (mousePressed == true) {
   stroke(185, 32, 32);
  line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
  if( keyPressed == true) {
    if( key == '1') {
        noStroke();
        fill(0);
       ellipse(mouseX+15, mouseY-20, 30, 30);
        ellipse(mouseX-15, mouseY-20, 30, 30);
        fill(255);
    ellipse(mouseX, mouseY, 50, 50);
    fill(0);
    ellipse(mouseX, mouseY, 10, 10);
    }
  }
  
  if(keyPressed == true) {
    if( key == '2') {
      stroke(23, 255, 36);
      fill(119, 240, 250);
      for(int i = -50; i <= 50; i += 10) {
        ellipse(mouseX+i, mouseY+i, i, i);
      }
    }
  }
    
    if ( keyPressed == true) {
      if( key == '3') {
        strokeWeight(3);
        stroke(random(255), 100, 100);
        for ( int i = 0; i< 100; i += 10) {
          point(mouseX, mouseY+i);
        }
      }
    }
}




