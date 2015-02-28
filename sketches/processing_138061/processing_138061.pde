

void setup() {
  size(400, 400);
  background(0,201,87);
  noStroke();
  smooth();
  frameRate(30);
}
void draw() {
  background(0,201,87);
  fill(255);
  stroke(255);
  strokeWeight(4);
  line(240, 170, 270, 200);
  line(130, 170, 100, 200);
  
  noStroke();
  rect(width/2-60, 100, 90, 50); //head
  rect(width/2-60, 155, 90, 80); //body
  rect(width/2-55, 240, 20, 20); //feet
  rect(width/2+5, 240, 20, 20); //feet
  
  stroke(0);
  strokeWeight(7);
  point(200, 125);
  point(170, 125);
 


 
  if (mousePressed==true) {
   
    background(0,201,87); //clean
    fill(0);
    noStroke();
    rect(width/2-60, 100, 90, 50); //head
    rect(width/2-60, 155, 90, 80); //body
    rect(width/2-55, 240, 20, 30); //feet
    rect(width/2+5, 240, 20, 30); //feet
  
  
    stroke(4);

    strokeWeight(4);
    stroke(0);
    line(240, 170, 270, 140);
    line(130, 170, 100, 140);
    stroke(255);
    strokeWeight(7);
    point(200, 125);
    point(170, 125);
    noStroke();
    fill(255);
    triangle(185, 130, 175, 140, 195, 140);
  }
}
