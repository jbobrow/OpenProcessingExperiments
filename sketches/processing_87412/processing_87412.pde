
float mode = 1;
float timer = 0;
 
void setup() {
  size(800,800);
}
 
void draw(){
  float FR = 60;
  frameRate(FR);
  float ROne = 51 + random(153);
  float GOne = 51 + random(153);
  float BOne = 51 + random(153);
  float RTwo = ROne - random(153);
  float GTwo = GOne - random(153);
  float BTwo = BOne - random(153);
  fill(RTwo,GTwo,BTwo,1);
  rect(0,0,800,800);
  noStroke();
  fill(ROne,GOne,BOne);
  if (mode == 1) {
    for(int i = 0; i < 200; i++) {
      float xOne = mouseX + random(800) - random(800);
      float yOne = mouseY + random(800) - random(800);
      float xTwo = xOne + sin(i)*100 + random(100) - random(100);
      float yTwo = yOne + cos(i)*100 + random(100) - random(100);
      quad(xOne,yOne,xOne + 100,yOne + 100,xTwo,yTwo,xTwo + 100,yTwo + 100);
      float xOne = mouseX + random(200) - random (200);
      float yOne = mouseY + random(200) - random (200);
      float xTwo = xOne + sin(timer)*500;
      float yTwo = yOne + cos(timer)*500;
      triangle(xOne,yOne,xTwo,yTwo,xTwo + 50,yTwo + 50);
      float xOne = mouseX;
      float yOne = mouseY;
      float xTwo = xOne + sin(timer)*500;
      float yTwo = yOne + cos(timer)*500;
      triangle(xOne,yOne,xTwo,yTwo,xTwo + 50,yTwo + 50);
      timer += 1/FR + random(.5);
      float xOne = mouseX + random(600) - random (600);
      float yOne = mouseY + random(600) - random (600);
      float W = 100 + random(200);
      float H = W + random(200) - random(200);
      float R = random(1/sin(H/W));
      pushMatrix();
      translate(xOne,yOne);
      rotate(R);
      ellipse(0,0,W,H);
      popMatrix();
    }
  }
  if (mode == 2) {
    for (int i = 0; i < 2; i++) {
      float xOne = mouseX + random(200) - random (200);
      float yOne = mouseY + random(200) - random (200);
      float xTwo = xOne + sin(timer)*500;
      float yTwo = yOne + cos(timer)*500;
      triangle(xOne,yOne,xTwo,yTwo,xTwo + 50,yTwo + 50);
      float xOne = mouseX;
      float yOne = mouseY;
      float xTwo = xOne + sin(timer)*500;
      float yTwo = yOne + cos(timer)*500;
      triangle(xOne,yOne,xTwo,yTwo,xTwo + 50,yTwo + 50);
      timer += 1/FR + random(.5);
      float xOne = mouseX + random(600) - random (600);
      float yOne = mouseY + random(600) - random (600);
      float W = 100 + random(200);
      float H = W + random(200) - random(200);
      float R = random(1/sin(H/W));
      pushMatrix();
      translate(xOne,yOne);
      rotate(R);
      ellipse(0,0,W,H);
      popMatrix();
    }
  }
  if (mode == 3) {
    for (int i = 0; i < 10; i++) {
      float xOne = mouseX + random(600) - random (600);
      float yOne = mouseY + random(600) - random (600);
      float W = 100 + random(200);
      float H = W + random(200) - random(200);
      float R = random(1/sin(H/W));
      pushMatrix();
      translate(xOne,yOne);
      rotate(R);
      ellipse(0,0,W,H);
      popMatrix();
    }
  }
   if (mode == 4) {
    for (int i = 0; i < 10; i++) {
      float xOne = mouseX + random(600) - random (600);
      float yOne = mouseY + random(600) - random (600);
      float W = 100 + random(100);
      float H = W + random(100) - random(200);
      float R = random(1/sin(H/W));
      pushMatrix();
      translate(xOne,yOne);
      rotate(R);
      triangle(0,0,W,H);
      popMatrix();
      float xOne = mouseX + random(600) - random (600);
      float yOne = mouseY + random(600) - random (600);
      float W = 100 + random(200);
      float H = W + random(200) - random(200);
      float R = random(1/sin(H/W));
      pushMatrix();
      translate(xOne,yOne);
      rotate(R);
      ellipse(0,0,W,H);
      popMatrix();
    }
  }
}
 
void mouseClicked() {
  if (mode < 4) {
    mode +=1;
  }
  else {
    mode = 1;
  }
}
