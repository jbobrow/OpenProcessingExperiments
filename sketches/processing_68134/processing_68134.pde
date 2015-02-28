
float AX = random(0,0);
float AY = random(0,0);
float backgroundColor = 255;
float eyeR;
float eyeG;
float eyeB;
float backB;
float backR;
float backG;
int speed = 5;
int speed2 = 4;

void setup() {
  size (700,700);
}

void draw() {
  backB= random(1,255);
  backG= random(1,255);
  backR= random(1,255);
  background(255);
  AX = AX + speed;
  AY = AY + speed2;
  if (AX > 570 || AX < 0)
    speed = speed * -1;
  if (AY > 540 || AY < 0)
    speed2 = speed2 * -1;
 
  stroke(0, 0, 255);
  fill(0, 0, 255);
  rect(AX + 80, AY + 50, 20, 80);
  fill (0, 255, 0);
  ellipse(AX + 90, AY + 40, 45, 45);
  line(AX + 80, AY + 130, AX + 60, AY + 160);
  line(AX + 100, AY + 130, AX + 120, AY + 160);
  eyeB = random(1, 255);
  eyeR = random(1,255);
  eyeG = random(1,255);
  fill(eyeR,eyeG,eyeB);
  ellipse(AX + 80, AY + 41, 10, 21);
  ellipse(AX + 100, AY + 41, 10, 21);
  
  
  AX = AX + speed;
  AY = AY + speed2;

}




