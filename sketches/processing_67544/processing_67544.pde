
float X = random(1,500);
float Y = random(1,500);
float backgroundColor = 255;
float eyeR;
float eyeG;
float eyeB;
float backB;
float backR;
float backG;


void setup() {
  size (600,600);
}

void draw() {
  backB= random(1,255);
  backG= random(1,255);
  backR= random(1,255);
  background(255);
  stroke(0, 0, 255);
  fill(0, 0, 255);
  rect(X + 80, Y + 50, 20, 80);
  fill (0, 255, 0);
  ellipse(X + 90, Y + 40, 45, 45);
  line(X + 80, Y + 130, X + 60, Y + 160);
  line(X + 100, Y + 130, X + 120, Y + 160);
  eyeB = random(1, 255);
  eyeR = random(1,255);
  eyeG = random(1,255);
  fill(eyeR,eyeG,eyeB);
  ellipse(X + 80, Y + 41, 10, 21);
  ellipse(X + 100, Y + 41, 10, 21);
  
  
  X = X + random(-3,3);
  Y = Y + random(-3,3);

}




