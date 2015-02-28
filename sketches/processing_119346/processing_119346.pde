
//Dream of a woman : use flower=element to portray the vivd imagnative scene of a young woman 
//Chang,KuoPing department of Industrial design

void setup(){
  background(255);
  size(1000,300);
 //noLoop();
 frameRate(5);
}

void draw(){
  
 
  // draw the background
  //lightcircle();
  // draw 3 spiral
  
  drawspiral(20,780,280,8,255,255,255);
  drawspiral(8,875,0,5,255,255,255);
  drawspiral(10,620,120,6,255,255,255);
  //strokeWeight(1);
  
  

  drawlittlelower();
  

  //background(255);
  //draw womanshadow
  strokeWeight(1);
  drawwoman();
  //draweyebrow();
  // draw the left1 flower
  drawflower(280,150,350,0.05,320,0.08,250,240,240,30);
  drawflower(250,150,300,0.05,310,0.08,250,240,240,30);
  drawflower(250,150,200,0.1,250,0.1,250,200,100,20);
  drawflower(250,150,130,0.2,200,0.2,250,50,70,40); 
  drawflower(250,150,100,0.5,150,0.1,250,80,80,50);
  drawflower(250,150,90,0.4,150,0.1,250,80,80,50);
  drawflower(250,150,20,1,100,0.14,240,50,60,70);
  drawflower(250,150,18,0.8,80,0.12,235,50,40,80);
  drawflower(250,150,15,2,60,0.1,230,20,40,90);
  drawflower(250,150,8,0.8,30,0.15,150,10,20,90);
  drawflower(250,150,5,0.5,20,0.1,100,10,10,100);
  
  //draw right1 flower
  /* 
  drawflower(850,260,20,0.6,100,0.14,240,180,100,20);
  drawflower(850,260,20,0.4,90,0.12,235,190,110,40);
  drawflower(850,260,15,0.7,60,0.1,220,220,105,50);
  drawflower(850,260,5,0.7,40,0.1,190,190,10,40); 
  drawflower(850,260,5,0.6,30,0.1,155,155,10,40);
  */
  // draw butterfly
  butterfly();
 
  
}

float customNoise(float value){
    int count=int(value%12);
    float retValue=pow(sin(value),count);
    return retValue;
}

float customNoise2(float value){
    int count=int(value%12);
    float retValue=pow(sin(value),count);
    return retValue;
}

   
void drawflower(int centX,int centY,float a,float b,int c,float d,int e,int f, int g,int h){
  strokeWeight(0.5);
  stroke(0,50);
  float x,y;
  float noiseval=random(10);
  float radVariance,thisRadius,rad;
  float radius =c;
  beginShape();
  fill(e,f,g,h);
  for(float ang=0;ang<=360;ang+=1){
    noiseval+=d;
    //a parameter before customNoise
    radVariance=a*customNoise(noiseval);
    //a parameter before radVariance
    thisRadius=radius+b*radVariance;
    rad=radians(ang);
    
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    curveVertex(x,y);
   }
   endShape();
}
/*
void lightcircle(){
 noStroke();
 for(int i=2100; i>=0; i-=10){
 //fill(225-(i/10));
 fill(255,255-(i/25),255-(i/25));
 ellipse(300,150,i,i);
 }
}
*/
void drawwoman(){
 fill(255,245,245);
 stroke(220,20);
 beginShape();
 curveVertex(0,0);
 curveVertex(0,0);
 curveVertex(638,0); 
 curveVertex(638,0); 
 curveVertex(649,23);
 curveVertex(651,41);
 curveVertex(646,60);
 curveVertex(649,82);
 curveVertex(665,108);
 curveVertex(691,122);
 curveVertex(686,142);
 curveVertex(678,150);
 curveVertex(669,168);
 curveVertex(670,176);
 curveVertex(674,194);
 curveVertex(668,210);
 curveVertex(670,219);
 curveVertex(667,228);
 curveVertex(672,252);
 curveVertex(650,270);
 curveVertex(616,267);
 curveVertex(602,267);
 curveVertex(577,300);
 curveVertex(577,300);
 curveVertex(0,300);
 curveVertex(0,300);
 endShape();
}
/*
void draweyebrow(){
fill(255,40,40,15);
noStroke();
beginShape();
curveVertex(566,78);
curveVertex(572,82);
curveVertex(581,83);
curveVertex(599,85);
curveVertex(618,82);
curveVertex(615,87);
curveVertex(623,86);
curveVertex(615,91);
curveVertex(613,94);
curveVertex(608,93);
curveVertex(605,97);
curveVertex(602,95);
curveVertex(597,99);
curveVertex(595,96);
curveVertex(592,99);
curveVertex(590,96);
curveVertex(587,99);
curveVertex(584,95);
curveVertex(578,99);
curveVertex(578,93);
curveVertex(573,94);
curveVertex(572,90);
curveVertex(572,90);
endShape();
}
*/

void butterfly(){
//background(255);
//draw body
beginShape();
curveVertex(680,102);
curveVertex(680,102);
curveVertex(697,122);
curveVertex(711,148);
curveVertex(698,140);
curveVertex(688,128);
curveVertex(683,118);
curveVertex(678,103);
curveVertex(678,103);
endShape();

//draw line
noFill();
strokeWeight(2);
bezier(680,102,677,87,678,78,684,70);
bezier(680,102,666,93,665,85,674,83);
  
translate(691,111);
scale(random(1,1.15));
//draw wings
fill(100,10,10,100);
beginShape();
curveVertex(691-691,111-111);
curveVertex(691-691,111-111);
curveVertex(691-691,90-111);
curveVertex(705-691,64-111);
curveVertex(720-691,54-111);
curveVertex(725-691,85-111);
curveVertex(733-691,98-111);
curveVertex(726-691,106-111);
curveVertex(731-691,106-111);
curveVertex(734-691,112-111);
curveVertex(747-691,122-111);
curveVertex(750-691,133-111);
curveVertex(764-691,136-111);
curveVertex(771-691,141-111);
curveVertex(751-691,138-111);
curveVertex(742-691,144-111);
curveVertex(722-691,142-111);
curveVertex(704-691,131-111);
curveVertex(695-691,124-111);
curveVertex(691-691,111-111);
curveVertex(691-691,111-111);
endShape();
}

void drawspiral(int b, int centX,int centY,int c,int d,int e,int f){
  strokeWeight(5);
  //translate(-691,-111);
  //stroke(20,50,70);
  float x,y;
  
  float radius =b;
  
  //draw line
  float lastx=-999;
  float lasty=-999;
  
  //noisy
  float radiusNoise=random(10);
  float a=100;
  stroke(d,e,f,a);
  for(float ang=0;ang<=360*c;ang+=5){
  //radiusNoise+=0.05;  
  radius+=0.2;  
  a-=5;
  float thisRadius=radius+(noise(radiusNoise)*200)-100;
  float rad= radians(ang);
  
  x=centX+(thisRadius*cos(rad));
  y=centY+(thisRadius*sin(rad));

  //draw line
  if(lastx>-999){
    line(x,y,lastx,lasty);  
   }
   lastx=x;
   lasty=y;
  } 

}

void drawlittlelower(){
  noStroke(); 
  stroke(20,50,70,50);
  float x,y;
  int centX=mouseX;
  int centY=mouseY;
  float noiseval=random(10);
  float radVariance,thisRadius,rad;
  float radius =10;

  beginShape();
  fill(20,50,70,50);
  for(float ang=0;ang<=360;ang+=1){
    noiseval+=0.1;
    radVariance=30*customNoise2(noiseval);
    thisRadius=radius+radVariance;
    rad=radians(ang);
    
    x=centX+(thisRadius*cos(rad));
    y=centY+(thisRadius*sin(rad));
    curveVertex(x,y);
   }
   endShape(); 
}


