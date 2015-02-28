
PFont Font;

int rSize = 10;
int hNum = 150;
int mFlag = 0;
int eCenter;
int rad = 80;
int count;
float angle = 0;

float dx,dy, distance;
float speed = 15;

float an = 0.;
float xrad, yrad;


float[] xPos1 = new float[hNum];
float[] yPos1 = new float[hNum];
float[] xPos2 = new float[hNum];
float[] yPos2 = new float[hNum];

void setup(){
  
  size(500, 500);
  background(255);
  frameRate(12);
  noStroke();
  colorMode(RGB, 255, 255, 255, 100);
  smooth();
  
  Font = loadFont("HelveticaNeue-UltraLight-24.vlw");
  textFont(Font,24);
  textAlign(CENTER);  
  count =0;
  
  eCenter = width/2;
  

  for(int i=0; i<hNum; i++){
    xPos1[i] = eCenter;
    yPos1[i] = eCenter;
    xPos2[i] = cos(angle)*rad + eCenter;
    yPos2[i] = sin(angle)*rad + eCenter;
    angle += 0.1;
  }
}

void draw(){
  background(255);
  for(int i=0; i<hNum; i++){
    fill(0, random(255), 0, 50);
    text(count, xPos1[i], yPos1[i]);
  }

  
  for(int i=0; i<hNum; i++){
    dx = (xPos2[i]-xPos1[i]);
    dy = (yPos2[i]-yPos1[i]);
    distance = sqrt(sq(dx)+sq(dy));
    if(distance>0){
      xPos1[i] += dx/speed;
      yPos1[i] += dy/speed;
    }
    if(distance<1){
      mFlag = 1;
      xrad = sin(angle)*300;
      yrad = cos(angle)*300;
    }
  }


  if(mFlag==1){
    for(int i=0; i<hNum; i++){
      xPos2[i] = cos(angle)*xrad + eCenter;
      yPos2[i] = sin(angle)*yrad + eCenter;
      angle += sin(an);
      an += 0.03;
    }
          count++;

    mFlag = 0;
  }
  

}

