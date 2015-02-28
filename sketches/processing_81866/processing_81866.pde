
float mx;
float my;
float easing = 0.05;
int radius = 100;
int edge = 1000;
int inner = edge + radius;

void setup () {
  size(400, 400) ;
  noStroke();
  
}

void draw() {
 
  fill(255);  
  background (26, 26, 26);
  size(400, 400);
  rectMode(CENTER);
  fill(188, 188, 188);
  rect(200, 200, 40, 150);  //Neck
  rect(200, 250, 90, 110);
  rect(177.5, 300, 30, 110);  //Left Leg
  rect(222.7, 300, 30, 110);  //Right Leg
  rect(200, 140, 120, 80);  //Head
  fill(170, 170, 170);
  rect(200, 160, 60, 10);  //Mouth
  fill(255, 255, 255);   
  ellipse(172, 130, 20, 32); //Eye Left
  ellipse(228, 130, 20, 32); //Eye Right
  fill(0);
  



}
