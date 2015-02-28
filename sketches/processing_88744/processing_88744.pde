

float x;
float y;
float easing = 0.005;

void setup() {
  size (640, 480);
  background(100);
  smooth();
  noCursor();
}


void draw() 
{ 
  background(50);
  fill(0);
  rect(175, 150, 100, 100);
  rect(275, 200, 30, 10);
  
  rect(300, 150, 100, 100);
  fill(255);
  rect(185, 165, 80, 75);
  rect(310, 165, 80, 75);

  float mx = constrain(mouseX, 195, 255);
  float my = constrain(mouseY, 175, 230);



  fill(0);

  ellipse(mx, my, 30, 30);
  ellipse(mx+125, my, 30, 30);
}


void mousePressed(){
  fill(0);
  rect(175, 150, 100, 100);
   rect(300, 150, 100, 100);
}
  


