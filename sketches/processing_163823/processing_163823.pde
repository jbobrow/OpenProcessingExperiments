
float uX=0, tX1=300, tY1=0, tX2=300, tY2=300;
boolean goRight=true;
float score = 0;

void setup() {
  size(600,600);
  frameRate(1000);
}

void keyPressed() {
  tX1 = width/2;
  tY1 = 0;
  tX2 = random(0,width);
  tY2 = height/2;
}

void mousePressed() {
  float tVecX = tX2 - tX1;
  float tVecY = tY2 - tY1;
  
  float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);
  
  float uVecX = uX - width/2;
  float uVecY = height/2 - 0;
  
  float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);
  
  float dot = tVecX * uVecX + tVecY * uVecY;
  
  float cosine = dot / (tVecMag * uVecMag);
  
  score = cosine * 100;
}

void draw()
{
  background(255);
  
  stroke(255,0,0);
  strokeWeight(10);
  line(tX1, tY1, tX2, tY2);
  
  if (uX > width) goRight = false;
  else if (uX < 0) goRight = true;
  if (goRight) uX+=1;
  else uX-=1;
  stroke(0, 0, 0);
  line(width/2, 0, uX, height/2);
  
  textSize(30);
  fill(255,0,0);
  if (score > 99.9) text (":) Amazing", width/2, height*2/3);
  else text (":(", width/2, height*2/3);
}
