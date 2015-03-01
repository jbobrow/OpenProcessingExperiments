
//Ferriswheel exercise.
//Sketch by Kasper Wandahl Fogh

float z=0;

void setup() {
  size(480, 360, P3D);
}
void draw() {
  strokeWeight(2);
  noFill();
  background(255);
  translate(width/2, height/2+50);

  //Ferriswheel
  //Wheel
  ellipse(0, 0, 200, 200);

  //Frame
  triangle(0, 0, 75, 130, -75, 130);

  //Spokes in wheel  
  rotate(z);
  for (int i = 0; i<18; i++) {
    rotateZ(PI/9);
    line(0, 0, 0, 100);
  }
  
  //Carriages
  for (int j = 0; j<6; j++) {  
    rotateZ(PI/3);                  //rotate around the wheel
    translate(0, 100, 0);           //go 100 pixels down
    rotate(-z);                     //start negative rotation of carriage
    pushMatrix();                   //pushMatrix (fix for rotating all carriages correct)
    rotateZ(radians(-60*j));        //rotate for each cart -60*j (360/6).
    rotateZ(radians(-60));          //one more rotation to get in right direction
    fill(10,150,255);               //fill
    triangle(0, 0, 5, 10, -5, 10);  //triangle
    fill(255,150,10);               //fill
    rect(-5, 10, 10, 10);           //rect
    popMatrix();                    //popMatrix to get back to other layer
    rotate(z);                      //rotation to stay in "balance"
    translate(0, -100, 0);          //translate back so we can draw new carriage correct.
  }
  
  
  z=z-(PI/700); //comment if you want to control wheel.
  println("X: " + mouseX + " Y: " + mouseY);
}
//Uncomment below if you want to control wheel.
/*
void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
    z=z+(PI/100);
  } else if(keyCode == RIGHT){
    z=z-(PI/100);
  }
}
}
*/


