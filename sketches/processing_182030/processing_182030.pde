
color theColor=color(255,0,0,100);
float ellipseSize=3;
//also int, String


void setup(){
   size(500,500);
   smooth();
   noStroke();
   background(255);
  
}

void draw(){
  fill(theColor);
  if (mousePressed){
    ellipse(mouseX,mouseY,ellipseSize,ellipseSize);
  }
  
  
}

void keyPressed() {
  switch(key) {
  case 'r': 
    theColor=color(255,0,0);  // red
    break;
  case 'g': 
    theColor=color(0,255,0);  // green
    break;
  case 'b': 
   theColor=color(0,0,255);  // blue
    break;
  case ' ': 
    background(255);  // clears screen
}


  if(key >= 49 && key <= 57) {
  //if(key >= '1' && key <= '9') {
    println(key);
    ellipseSize=(key-48)*5;
    // http://ascii.cl/ 
  }
}
  



