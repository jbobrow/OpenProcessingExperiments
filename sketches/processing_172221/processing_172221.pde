
float x1;
float y1;
float x2;
float y2;
float gray = 128;
float widt = 1000;
boolean phase = true;
float lGreen = 140;
float rGreen = 160;
float yellow = 240;
float maskGreen = 250;

void setup(){
  size(1000,1000);
  setTargets();
}

void draw(){
  background(gray);
  if(phase){
    DrawSpot(x2,y2,50,100,color(128,maskGreen,128));
    DrawSpot(x2-x1+500,y2-y1+500,50,100,color(128,maskGreen,128));
    noStroke();
    fill(255);
    ellipse(500,500,3,3);
  }else{
    DrawSpot(x1,y1,50,100,color(128,lGreen,128));
    DrawSpot(x2,y2,50,100,color(128,rGreen,128));
  }
}

void DrawSpot(float x, float y, float rad, float blur, color col){
  float dRed = (red(col)-gray)/blur;
  float dGreen = (green(col)-gray)/blur;
  float dBlue = (blue(col)-gray)/blur;
  for(int i=0;i<blur;i++){
    color curCol = color(gray+i*dRed,gray+i*dGreen,gray+i*dBlue);
    fill(curCol);
    strokeWeight(2);
    stroke(curCol);
    ellipse(x,y,rad+blur-i,rad+blur-i);
  }
}

void Mask(){
  for(int i=0;i<200;i++){
    noStroke();
    fill(random(255));
    float rad = 100;
    ellipse(random(widt),random(widt),random(rad)+rad,random(rad)+rad);
  }
}

void setTargets(){
  x1 = randLoc();
  y1 = randLoc();
  x2 = randLoc();
  y2 = randLoc();
  print(x2);
  print(" ");
  float dx = x2-x1;
  float dy = y2-y1;
  float dist = sqrt(sq(dx)+sq(dy));
  while(dist<300){
    x2 = randLoc();
    y2 = randLoc();
    dx = x2-x1;
    dy = y2-y1;
    dist = sqrt(sq(dx)+sq(dy));
  }
}

float randLoc(){
  return random(widt-500)+250;
}

void mousePressed(){
  phase = !phase;
  Mask();
  if(phase){
    setTargets();
  }
}


