
void setup(){
  size(250,250);
  background(255);
  smooth(); 
  noLoop(); //by default does not move
  frameRate(20); //slightly slower frame rate so moves slower
}

float x = 0;

void draw(){
  noFill();                    //beziers in background
  stroke(103,196,189,100);
  strokeWeight(8);
  bezier(0,68,69,177,98,35,259,71);
  
  noFill();
  stroke(103,456,196,100);
  strokeWeight(8);
  bezier(0,68,70,187,70,95,259,71);
  
  noFill();
  stroke(109,103,196,100);
  strokeWeight(8);
  bezier(0,68,55,127,110,55,259,71);
  
  noFill();
  stroke(149,103,196,100);
  strokeWeight(8);
  bezier(0,68,99,177,68,65,259,71);
  
  noFill();
  stroke(196,103,168,100);
  strokeWeight(6);
  bezier(0,68,45,177,64,35,259,71);
  
  noFill();
  stroke(103,196,131,100);
  strokeWeight(6);
  bezier(0,68,69,127,98,25,259,71);
  
  noFill();
  stroke(234,219,43,100);
  strokeWeight(6);
  bezier(0,68,90,147,119,55,259,71);
  
  noFill();
  stroke(43,182,234,100);
  strokeWeight(6);
  bezier(0,68,50,197,68,85,259,71);
  
  x = x + 5;     //moves across by 5
  if (x > width) { //returns to start when line goes off screen
    x = 0;
  }
  stroke(255);
  strokeWeight(2);
  line(x, 0, x, height); //line vertical across whole screen
}

void mousePressed() {  //moves if mouse pressed
  loop();
}

void mouseReleased() { //stops moving if mouse released
  noLoop();
}

