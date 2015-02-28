
//Assignment no. 3 (arrays)
//Author: Anne Stevens
//28 September, 2011
//Objective: functions and arrays
//comments: challenge figuring out proper syntax to pass a color variable
// comments: scale factor doesn't work

//declare new array for X and Y position of cats
int cellNum = 8;
float [] catsX = new float [cellNum];
float [] catsY = new float [cellNum];
//int [] scaleFactor = new int [cellNum];
int [] darkR = new int [cellNum];
int [] darkG = new int [cellNum];
int [] darkB = new int [cellNum];
int [] lightR = new int [cellNum];
int [] lightG = new int [cellNum];
int [] lightB = new int [cellNum];

int loopCount = 0;
float tailWag = 0;
float tailWagDir = 0.5;

float backR;
float backG;
float backB;

void setup(){
  size(1000,500);
  //textFont(loadFont("TempusSansITC-48.vlw"),32);
  smooth();
  frameRate(10);
  float backR = 0;
  float backG = 0;
  float backB = 0;
  
  catLocation();
}

void draw(){
  background(backR,backG,backB);
  stroke(255);
  
  //draw the cat at N locations
  for (int i = 0; i < catsX.length; i++) {
    float headX = catsX[i];  
    float headY = catsY[i];
    float bodyX = headX -155;
    float bodyY = headY + 85;
    //float sf = scaleFactor[i]/10;
    int dkR = darkR[i];
    int dkG = darkG[i];
    int dkB = darkB[i];
    int ltR = lightR[i];
    int ltG = lightG[i];
    int ltB = lightB[i];
    color darkFur = color(dkR,dkG,dkB);
    color lightFur = color(ltR,ltG,ltB);
    drawDarkFur(headX, headY, bodyX, bodyY, darkFur);
    drawLightFur(headX, headY, bodyX, bodyY, lightFur);
  }
  
  instructions(loopCount);
  loopCount = loopCount + 1;  
}

//to change cat locations and colour (i.e to fill arrays with new values)
void mousePressed() {
  catLocation();
}

// fills the arrays with random numbers
void catLocation() {
  
  for (int i = 0; i < catsX.length; i++) {
     catsX[i] = int(random(250,width-100));
     catsY[i] = int(random(height-250));
     darkR[i] = int(random(255));
     darkG[i] = int(random(255));
     darkB[i] = int(random(255));
     lightR[i] = int(random(255));
     lightG[i] = int(random(255));
     lightB[i] = int(random(255));
  }
}

void drawLightFur(float headX,float headY, float bodyX, float bodyY, color lightFur) {
  //light orange stuff
      for (int i = 0; i < catsX.length - 1; i ++) {
        fill(lightFur);
        stroke(lightFur);
      }
      
      //stripes
      noFill();
      curve(bodyX-75,bodyY-45,bodyX-25,bodyY-45,bodyX-25,bodyY-10,bodyX-50,bodyY+5); //rear
      curve(bodyX-50,bodyY-45,bodyX,bodyY-45,bodyX,bodyY+10,bodyX-25,bodyY+5); //middle
      curve(bodyX-25,bodyY-45,bodyX+25,bodyY-45,bodyX+25,bodyY+30,bodyX,bodyY+5); //front
  
      //whiskers
      strokeWeight(3);
      line(headX-75,headY+5,headX-25,headY+15);
      line(headX-80,headY+17,headX-30,headY+20);
      line(headX-75,headY+30,headX-27,headY+25);
      line(headX+25,headY+15,headX+75,headY+15);
      line(headX+20,headY+20,headX+77,headY+24);
      line(headX+25,headY+25,headX+75,headY+35);
    
      //ears    
      //noStroke();
      fill(lightFur);
      triangle(headX-45,headY-51,headX-15,headY-38,headX-40,headY-8);
      triangle(headX+55,headY-47,headX+43,headY-5,headX+20,headY-35);
}

void drawDarkFur(float headX,float headY, float bodyX, float bodyY, color darkFur) {  
    
    for (int i = 0; i < catsX.length - 1; i ++) {
      fill(darkFur);
      stroke(darkFur);
    
      float rRectX = bodyX - 95;
      float rRectY = bodyY - 50;

    //head and body
      ellipseMode(CENTER);
      ellipse(headX,headY,90,90);
  
      //legs
      strokeWeight(20);
      //stroke(darkR,darkG,darkB);
      line(bodyX+80,bodyY+70,bodyX+105,bodyY+120);//front leg going forward
      line(bodyX+60,bodyY+100,bodyX+45,bodyY+120);// front leg backward
      line(bodyX-50,bodyY+70,bodyX-40,bodyY+120); //back leg going forward
      line(bodyX-70,bodyY+100,bodyX-95,bodyY+120); //back leg backward
    
      //tail
      strokeWeight(10);
      noFill();
      curve((bodyX+100),bodyY-170,bodyX-110,bodyY-45,(bodyX-110)+tailWag,bodyY-160+tailWag*.3,(bodyX-100)+tailWag*-2,(bodyY-150)+tailWag*3);
      tailWag = tailWag + tailWagDir;
      
      if(tailWag >= 50 || tailWag <= -30){
          tailWagDir = tailWagDir * -1;
      }
      
       //ears    
       strokeWeight(6);
       noFill();
       triangle(headX-45,headY-51,headX-15,headY-38,headX-40,headY-8);
       triangle(headX+55,headY-47,headX+43,headY-5,headX+20,headY-35);
      
        //body
        noStroke();
        fill(darkFur);
        roundRect(rRectX,rRectY,200,100,darkFur);
  }
}

//draw cat's body
void roundRect(float x, float y, float w, float h, int darkFur){
  
  fill(darkFur);
  float corner = w/10;
  float midDisp = w/20;
  
  beginShape();  
    curveVertex((x+corner),y);
    curveVertex((x+w-corner),y);
    curveVertex((x+w+midDisp),y+h/2.0f);
    curveVertex((x+w-corner),y+h);
    curveVertex((x+w/2),y+h-midDisp);
    curveVertex((x+corner),y+h);
    curveVertex((x-midDisp),y+h/2.0);
    curveVertex((x+corner),y);
    curveVertex((x+w-corner),y);
    curveVertex((x+w+midDisp),y+h/2.0);
  endShape();
}

//instructions at bottom
void instructions(int loopCount) {      
    textFont(loadFont("TempusSansITC-48.vlw"),32);
    int textX = 30;
    int textH = 480;

    if (loopCount < 40) {
      fill(255);  
      text("Click da maus tu change de kats", textX,textH);
    } else if (loopCount >= 40 && loopCount < 80) {
        fill(224,183,34); 
        text("Didunt yu heer me??  I sed 'Click da maus tu change de kats'", textX,textH);
    } else {
        fill(224,34,221); 
        text("stuped humanz.  Dey nevr lissen", textX,textH);       
    }
}


