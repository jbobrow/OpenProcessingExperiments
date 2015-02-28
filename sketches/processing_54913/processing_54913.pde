
float a = 1;

void setup(){
  size (250,250);
  noStroke();
  smooth();
  background(255);
}

void draw(){
  frameRate(5);
  translate((width/2),height/2); // centers in window
  fill(random(256), random (256), random (256)); //randomizes colour
  a += 1;
  if(a > 250) {  //"a" cannot exceed the size of the window
    a=random(250);
  }
  ellipse(random(-a,a), random(-a,a),10, 10); //randomizes ellipse location
  
}
