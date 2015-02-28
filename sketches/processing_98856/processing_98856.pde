
float angulo = 0;
float ang = 0;
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  fill(random(1), 12);
  rect (0, 0, width, height);
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(200,200,5,5);
  angulo = angulo + 0.02;
  translate(200, 200);
  rotate(angulo);
  fill(255, 255, 0);
  rect(10, 10, 20, 20);
  fill(255, 0, 255);
  ellipse(-20,-20,20,20);
  
  ang = ang - 0.2;
  rotate(ang);
  fill(30 ,144 ,255);
  rect(30,30,20,20);
  rotate(angulo);
  fill(128 ,0 ,0);
  rect(30,30,20,20);
  
  //ang = ang - 0.2;
  rotate(ang);
  fill(200, 100, 255);
  rect(50,50,20,20);
  rotate(angulo);
  fill(255);
  rect(50,50,20,20);
  
  
  //ang = ang - 0.2;
  rotate(ang);
  fill(255, 0, 0);
  ellipse(50,50,20,20);
  rotate(angulo);
  fill(255);
  ellipse(50,50,20,20);
  
  ang = ang - 0.2;
  rotate(ang);
  fill(0, 255, 0);
  rect(70,70,20,20);
  rotate(angulo);
  fill(255,255,0);
  rect(70,70,20,20);
  
  ang = ang - 0.2;
  rotate(ang);
  fill(random(255),random(255),random(255));
  rect(100,100,20,20);
  rotate(angulo);
  fill(random(255),random(255),random(255));
  rect(100,100,20,20);
  
  textSize(12);
  fill(random(255),random(255),random(255));
  text("APLICACIONES MULTIMEDIA", 50,50);
}
