
PImage watercan;
float watercenterX;
float watercenterY;
float waterX,waterY;
float angle=0.0;

void setup(){
  size(600,600);
  background(96,212,86);
  smooth();
  watercan = loadImage("watercan.png");
  frameRate(30);
}

void draw(){
  float yspeed=5;
  float ypos=450;
  colorMode(RGB,255);
  //background
  for (int b=0;b<height;b+=25){
    int n=b/25;
    fill(167+(n*3.5),219+(n*1.5),158-n*.5);
    noStroke();
    rect(0,b,width,50);
  }
  
  //purple flowers
  for (int w=0;w<=width;w+=100){
    if ((w==100) || (w==300) || (w==500)){
      fill(80,82,23);
      noStroke();
      rect(w-2.5,400,5,height-400);
      pushMatrix();
      scale(.5);
      bigflower(1,0,w*2,400*2,112,121,181,100);
      smallflower(1,0,w*2,400*2,102,94,135,125);
      smallerflower(1,0,w*2,400*2,82,76,97,150);
      popMatrix();
    }else if (w==400){
    }else{
      fill(80,82,23);
      noStroke();
      rect(w-2.5,350,5,height-350);
      pushMatrix();
      scale(.5);
      bigflower(1,0,w*2,350*2,112,121,181,100);
      smallflower(1,0,w*2,350*2,102,94,135,125);
      smallerflower(1,0,w*2,350*2,82,76,97,150);
      popMatrix();
    }
  }  
    
  //stem
  float stemHeight=250;
  colorMode(RGB,255);
  fill(80,82,23);
  noStroke();
  rect(400-5,stemHeight,10,height-stemHeight);
 
 //flower power 
  if (mousePressed){
    stemHeight-=50;
    colorMode(RGB,255);
    fill(80,82,23);
    noStroke();
    rect(400-7,stemHeight,14,height-stemHeight);
    pushMatrix();
    scale(1.5);
    translate(-134,-134);
    bigflower(1,.005,400,250,255,145,145,100);
    smallflower(1,.005,400,250,204,83,59,125);
    smallerflower(1,.005,400,250,191,62,33,150);
    popMatrix();
  }else{
    colorMode(HSB,255);
    bigflower(1,.005,400,250,255,145,145,100);
    smallflower(1,.005,400,250,204,83,59,125);
    smallerflower(1,.005,400,250,191,62,33,150);
  }
      

  //watering can
  watercenterX=mouseX-watercan.width/2;
  watercenterY=mouseY-watercan.height/2;
  waterX=mouseX+watercan.width/2;
  waterY=mouseY+watercan.height+50;
  if (mousePressed){
    image(watercan,watercenterX,watercenterY);
    noFill();
    strokeWeight(1);
    colorMode(RGB,255);
    stroke(76,153,150);
    arc(waterX,waterY,175,175,PI+HALF_PI,TWO_PI);
    arc(waterX,waterY,150,175,PI+HALF_PI,TWO_PI);
    arc(waterX,waterY,125,175,PI+HALF_PI,TWO_PI);
    arc(waterX,waterY,100,175,PI+HALF_PI,TWO_PI);      
  }
  
  //grass
  for (int i=height-70; i<height+20;i+=5){  
    for (int g=-5;g<width;g+=7){
      float h = i;
      colorMode(HSB,255);
      noStroke();
      fill(90,100,random(40,55));
      triangle(g,h,g+5,h-19.36,g+10,h);
    }
  }
  
  /*//new flowers
  float currentTime=millis();
  for (float t=5000;t<=40000;t+=5000){
    if (currentTime>=t){
      pushMatrix();
      scale(.25);
      float x=(t-5000)/15;
      int y=2100;
      bigflower(1,-.003,x,y,82,76,97,255);
      smallflower(1,-.003,x,y,102,94,135,150);
      smallerflower(1,-.003,x,y,112,121,181,100);
      popMatrix();
    }
  }
  for (float t=45000;t<=75000;t+=5000){
    if (currentTime>=t){
      pushMatrix();
      scale(.25);
      float x=(t-42500)/15;
      int y=2250;
      bigflower(1,.005,x,y,191,62,33,150);
      smallflower(1,.005,x,y,204,83,59,150);
      smallerflower(1,.005,x,y,255,145,145,150);
      popMatrix();
    }
  }
   for (float t=80000;t<=115000;t+=5000){
    if (currentTime>=t){
      pushMatrix();
      scale(.25);
      float x=(t-80000)/15;
      int y=2400;
      bigflower(1,-.003,x,y,102,94,135,255);
      smallflower(1,-.003,x,y,82,76,97,125);
      smallerflower(1,-.003,x,y,40,29,55,100);
      popMatrix();
    }
  }*/
}


//FUNCTIONS

//petals
void petal(float angle, float x,int r, int g, int b, int trans){
  pushMatrix();
  rotate(angle+x);
  colorMode(RGB,255);
  //fill(255,145,145,100);
  fill(r,g,b,trans);
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(60,-15);
  curveVertex(100,0);
  curveVertex(60,15);
  curveVertex(0,0);
  curveVertex(0,0);
  endShape();
  popMatrix();
}

void smallpetal(float angle,float x,int r,int g,int b,int trans){
  pushMatrix();
  rotate(angle+x);
  colorMode(RGB,255);
  //fill(204,83,59,125);
  fill(r,g,b,trans);
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(45,-10);
  curveVertex(75,0);
  curveVertex(45,10);
  curveVertex(0,0);
  curveVertex(0,0);
  endShape();
  popMatrix();
}

void smallerpetal(float angle, float x,int r,int g,int b,int trans){
  pushMatrix();
  rotate(angle+x);
  colorMode(RGB,255);
  //fill(191,62,33,150);
  fill(r,g,b,trans);
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(27,-5);
  curveVertex(45,0);
  curveVertex(27,5);
  curveVertex(0,0);
  curveVertex(0,0);
  endShape();
  popMatrix();
}


//complete flowers
void bigflower(float angleDirection, float speed, float centerX, float centerY,int r,int g,int b,int trans){
  ellipseMode(RADIUS);
  pushMatrix();
  translate (centerX,centerY);
  float i=1;
  //for(int i=0;i<120;i+=60){
    rotate(angle+radians(i));
    petal(0,i,r,g,b,trans);
    petal(PI/12,i,r,g,b,trans);
    petal(PI/6,i,r,g,b,trans);
    petal(PI/4,i,r,g,b,trans);
    petal(PI/3,i,r,g,b,trans);
    petal(PI*5/12,i,r,g,b,trans);
    petal(HALF_PI,i,r,g,b,trans);
    petal(PI*7/12,i,r,g,b,trans);
    petal(PI*2/3,i,r,g,b,trans);
    petal(PI*3/4,i,r,g,b,trans);
    petal(PI*5/6,i,r,g,b,trans);
    petal(PI*11/12,i,r,g,b,trans);
    petal(PI,i,r,g,b,trans);
    petal(PI*13/12,i,r,g,b,trans);
    petal(PI*7/6,i,r,g,b,trans);
    petal(PI*5/4,i,r,g,b,trans);
    petal(PI*4/3,i,r,g,b,trans);
    petal(PI*17/12,i,r,g,b,trans);
    petal(PI*3/2,i,r,g,b,trans);
    petal(PI*19/12,i,r,g,b,trans);
    petal(PI*5/3,i,r,g,b,trans);
    petal(PI*7/4,i,r,g,b,trans);
    petal(PI*11/6,i,r,g,b,trans);
    petal(PI*23/12,i,r,g,b,trans);
  popMatrix();
  angle+=speed*angleDirection;
}

void smallflower(float angleDirection,float speed2,float centerX,float centerY,int r,int g,int b,int trans){
  ellipseMode(RADIUS);
  pushMatrix();
  translate (centerX,centerY);
  float i=1;
    rotate(angle+radians(i));
    smallpetal(0,i,r,g,b,trans);
    smallpetal(PI/12,i,r,g,b,trans);
    smallpetal(PI/6,i,r,g,b,trans);
    smallpetal(PI/4,i,r,g,b,trans);
    smallpetal(PI/3,i,r,g,b,trans);
    smallpetal(PI*5/12,i,r,g,b,trans);
    smallpetal(HALF_PI,i,r,g,b,trans);
    smallpetal(PI*7/12,i,r,g,b,trans);
    smallpetal(PI*2/3,i,r,g,b,trans);
    smallpetal(PI*3/4,i,r,g,b,trans);
    smallpetal(PI*5/6,i,r,g,b,trans);
    smallpetal(PI*11/12,i,r,g,b,trans);
    smallpetal(PI,i,r,g,b,trans);
    smallpetal(PI*13/12,i,r,g,b,trans);
    smallpetal(PI*7/6,i,r,g,b,trans);
    smallpetal(PI*5/4,i,r,g,b,trans);
    smallpetal(PI*4/3,i,r,g,b,trans);
    smallpetal(PI*17/12,i,r,g,b,trans);
    smallpetal(PI*3/2,i,r,g,b,trans);
    smallpetal(PI*19/12,i,r,g,b,trans);
    smallpetal(PI*5/3,i,r,g,b,trans);
    smallpetal(PI*7/4,i,r,g,b,trans);
    smallpetal(PI*11/6,i,r,g,b,trans);
    smallpetal(PI*23/12,i,r,g,b,trans);
  popMatrix();
  angle+=speed2*angleDirection;
}

void smallerflower(float angleDirection,float speed3,float centerX,float centerY,int r,int g,int b,int trans){
  ellipseMode(RADIUS);
  pushMatrix();
  translate (centerX,centerY);
  float i=1;
    rotate(angle+radians(i));
    smallerpetal(0,i,r,g,b,trans);
    smallerpetal(PI/12,i,r,g,b,trans);
    smallerpetal(PI/6,i,r,g,b,trans);
    smallerpetal(PI/4,i,r,g,b,trans);
    smallerpetal(PI/3,i,r,g,b,trans);
    smallerpetal(PI*5/12,i,r,g,b,trans);
    smallerpetal(HALF_PI,i,r,g,b,trans);
    smallerpetal(PI*7/12,i,r,g,b,trans);
    smallerpetal(PI*2/3,i,r,g,b,trans);
    smallerpetal(PI*3/4,i,r,g,b,trans);
    smallerpetal(PI*5/6,i,r,g,b,trans);
    smallerpetal(PI*11/12,i,r,g,b,trans);
    smallerpetal(PI,i,r,g,b,trans);
    smallerpetal(PI*13/12,i,r,g,b,trans);
    smallerpetal(PI*7/6,i,r,g,b,trans);
    smallerpetal(PI*5/4,i,r,g,b,trans);
    smallerpetal(PI*4/3,i,r,g,b,trans);
    smallerpetal(PI*17/12,i,r,g,b,trans);
    smallerpetal(PI*3/2,i,r,g,b,trans);
    smallerpetal(PI*19/12,i,r,g,b,trans);
    smallerpetal(PI*5/3,i,r,g,b,trans);
    smallerpetal(PI*7/4,i,r,g,b,trans);
    smallerpetal(PI*11/6,i,r,g,b,trans);
    smallerpetal(PI*23/12,i,r,g,b,trans);
  popMatrix();
  angle+=speed3*angleDirection;
    if((angle>QUARTER_PI) || (angle<0)){
    angleDirection*= .1;
  }
}

