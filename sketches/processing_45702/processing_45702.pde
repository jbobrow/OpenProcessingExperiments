
PImage b, c;


void setup() {
  size(800, 400);
  b=loadImage("eye.png");
//  c=loadImage("butterfly.png");


}

void draw(){
    background(0); 
  c=loadImage("butterfly.png");
  
  smooth();
  float mx = constrain(mouseX, 250, 305);
  float my = constrain(mouseY, 155, 200);
  float rx = constrain(mouseX, 447, 510);
  float ry = constrain(mouseY, 155, 200); 
  if (mousePressed == true) {
    stroke(0);
    strokeWeight(15);
    cursor(c, 15, 15);
  } else {
    noStroke();
    cursor(HAND);
  }


  smooth();
  image(b, 200, 100, 150, 150);
  image(b, 400, 100, 150, 150);
  fill(0);
  ellipse(mx, my, 40, 40);
  ellipse(rx, ry, 40, 40);
  
  if (mousePressed == true) { 
  stroke(250);
  strokeWeight(5);
  line(200, 75, 275, 25);
  line(475, 25, 550, 75);
 
  } 
  else {
    
  stroke(250);
  strokeWeight(5);
    line(200, 50, 325, 100);
    line(425, 100, 550, 50);
  }



  

  
  
}

