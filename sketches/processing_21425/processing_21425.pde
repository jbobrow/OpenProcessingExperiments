
//Gaelan Baird Homework

void setup(){
frameRate(9);
  size(500,500);
  smooth();
  strokeWeight(.5);
}
void draw(){
  
  background(random(200,255));
  translate(width/2, height/2);
  for(int i = 0; i < 360; i++){
    rotate(radians(155));
    noStroke();
    fill(222, random(100), random(200));
    triangle(i, 0, 100, 0, 200, 100);
    noFill();
  
  }
}

