
int posX = 51;
int speedX = 0;
int trileft = (mouseX-10);
int triright = (mouseX+10);
;
void setup(){
  size(400,400);
  smooth();
  frameRate(30);
}

void draw() {
  background(160,180,255);
  noStroke();
  fill(80,10,30);
  triangle(mouseX,mouseY, mouseX,0,400,0);
  rect(0,0,mouseX,400);
  strokeWeight(30);
  stroke(60,8,25,(350-mouseX));
  line((mouseX/8),mouseY,(mouseX/8),-10);
  line((mouseX/8),mouseY,(mouseX/8),410);
  stroke(60,8,25,(300-mouseX));
  line((mouseX*0.35),mouseY,(mouseX*0.85),-10);
  line((mouseX*0.35),mouseY,(mouseX*0.4),410);
  stroke(60,8,25,(200-mouseX));
  line((mouseX*0.65),mouseY,(mouseX*1.5),-10);
  line((mouseX*0.65),mouseY,(mouseX*0.72),410);
  stroke(60,8,25,(160-mouseX));
  line((mouseX*0.70),mouseY,(mouseX*2.6),-10);
  line((mouseX*0.70),mouseY,(mouseX*.70),410);
  
  stroke(200,160,20);
  strokeWeight(4);
  line(0,mouseY,mouseX,mouseY);
  
}

