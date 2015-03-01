
int lastPressed = 0;

void setup() {
  size(600, 600);
} 

void draw() {
 
  fill(255); 
  rect(0, 0, width/2, height/2); 
  rect(width/2, 0, width/2, height/2); 
  rect(0, height/2, width/2, height/2); 
  rect(width/2, height/2, width/2, height/2);  
  fill(255);
  
  
  if ( lastPressed == 1 ) {
    fill( 100, 255, 255);
    rect(0, 0, width/2, height/2); 
  } 
  else if ( lastPressed == 2 ) {
    fill( 255, 100, 100);
    rect(width/2, 0, width/2, height/2); 
  } 
  else if ( lastPressed == 3 ) {
    fill( 100, 200, 180);
    rect(0, height/2, width/2, height/2); 
  } 
  else if ( lastPressed == 4 ) {
    fill( 255, 200, 180);
    rect(width/2, height/2, width/2, height/2); 
   
  }
  
  fill(0); 
  textSize(48); 
  textAlign(CENTER,CENTER);
  text(lastPressed, width/2, height/2); 
}

void mousePressed() {
  if ( mouseX > 0 && mouseX < width/2 && mouseY > 0 && mouseY < height/2) { 
    lastPressed = 1;
  }
  else if ( mouseX > width/2 && mouseX < width && mouseY > 0 && mouseY < height/2) { 
    lastPressed = 2;
  }
  else if ( mouseX > 0 && mouseX < width/2 && mouseY > height/2 && mouseY < height) { 
    lastPressed = 3;
  }
  else if ( mouseX > width/2 && mouseX < width && mouseY > width/2 && mouseY < height) { 
    lastPressed = 4;
  }
} 



