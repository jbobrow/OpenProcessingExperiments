
//Kang-Yu,Liu,suling11@ms55.hinet.net
//flowering flowers
//20131106
float strokeCol = 255;
float strokeChange = -1;
float xnoise = 0;
float ynoise = 0;
float ang = 0;

int counter = 0;//flower counter


void setup() {
  size(500, 500);
  background(209, 137, 111);
  frameRate(2);
  
}


void draw() {
  lightcircle();
  lightcircle1();
  backgroundline();

  if(frameCount>=10){
    strokeWeight(noise(15,58));
  }
  
   drop();
  
   flower();
   
   
  //refresh the screen if more than 100 flowers drawn
  if (counter >50) {
    clearBackground();
    counter = 0;
  }
  
}


void lightcircle() {
  noStroke();
  for (int i=500; i>=0; i-=10) {
    fill(208, 158, 143, 0+(i/100));
    ellipse(250, 250, i, i);
  }
}
void lightcircle1() {
  noStroke();
  for (int i=400; i>=0; i-=10) {
    fill(208, 158, 143, 0+(i/80));
    ellipse(250, 250, i, i);
  }
}


void backgroundline() {
  strokeWeight(0.5);
  float radius = 250;
  float centX = 250;
  float centY =250;
  float x, y, x2, y2;
  float angChange = +5;
  ang += angChange;
  if (ang>360) {
    angChange =-5;
  }
  if (ang < 0) {
    angChange =-5;
  }
  float ang = -10;
  strokeCol += strokeChange;

  if (strokeCol>255) {
    strokeChange =-1;
  }
  if (strokeCol<0) {
    strokeChange = 1;
  }

  stroke(strokeCol);

  float deltaR = random(100)-10;
  radius +=deltaR;

  float deltaA = random(270) -25;
  ang += deltaA;

  xnoise += 0.1;
  ynoise +=0.3;
  centX = width/2 +(noise(xnoise)*100)-50;
  centY = height/2 +(noise(ynoise)*100)-50;

  float rad = radians (ang);
  x = centX +(radius*cos(rad));
  y = centY +(radius *sin(rad));

  float opprad = rad+PI;
  x2 = centX +(radius *cos(opprad));
  y2 = centY +(radius*sin(opprad));
  line (x, y, x2, y2);
}



void drop(){
 float radius = 10;
    int centX = int(random(width));
    int centY = int(random(height));
    //stroke(random(100, 220), 50, 70); 
    radius += 0.5;
    float x, y; 
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(2);
    
    int startangle = int (3);
    int endangle = 720 + int(random(1080));
    int anglestep = 2 + int(random(3)-1);
   
    for (float ang=startangle; ang<=endangle; ang+=anglestep) {
      radiusNoise +=1.5;    
      radius +=0.5;

      float thisRadius = radius + (noise(radiusNoise)*2)-5;
      float rad = radians(ang);                                   
      x = centX + (thisRadius * cos(rad)); 
      y = centY + (thisRadius * sin(rad)); 
     

      if (lastx >-999) {
       stroke(random(0,255), random(30,80));
        strokeWeight(random(0.5,2));
        line(x, y, lastx, lasty+1);
      }
      lastx = x;
      lasty = y;
    }
}

void flower(){
  
  float radius = random(25,55);
  float centX1 = random(10,490);
  float centY1 = random(250,500);
  //flower(float centX1,float centY1,float radius){}
  
float x1, y1;
float noiseval = random(10);
float radVariance, thisRadius, rad;
float red = 180;
float green =random(183,186);
float blue = random(73,121);
float posx = centX1-radius*0.5;
float posy = centY1-radius*0.5;

pushMatrix();

beginShape();
for (float ang=0;ang<=360;ang+=0.5){
  noStroke();
fill(red,green,blue,random(100,144));

noiseval += 0.1;

//radVariance= 10* customNoise(noiseval);
thisRadius = radius+random(1,5);
rad = radians(ang);
x1 = centX1 + (thisRadius * cos(rad)/3);
y1 = centY1 + (thisRadius * sin(rad)/3);
curveVertex(x1,y1);
}

endShape(CLOSE);
ang +=0.1;
popMatrix();
}


 void clearBackground() {
    background(209, 137, 111);
    lightcircle();
  lightcircle1();
  }


