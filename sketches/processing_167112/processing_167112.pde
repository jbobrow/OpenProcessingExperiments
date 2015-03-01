
//Declare a variable of float type
//Isolate translation using pushMatrix and popMatrix
//Create a rectangle and rotate it using the declared variable 

float angle= 0.3;

void setup(){
  size(500, 500);
  background(0);
}

void draw(){
noStroke(); 
fill(3, 250, 219);
  pushMatrix();
  translate(250, 250);
  rotate(angle);
  rect(-90, -90, 60, 60);
  angle +=0.7;
  popMatrix();
}


