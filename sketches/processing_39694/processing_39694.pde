
//Assignment no. 3
//Author: Anne Stevens
//28 September, 2011
//Objective: functions and arrays
//comments: had to work out returns w/ simple generic problems in separate sketch windows
// comments: 

int dir; //controls cat's direction 
int loopCount = 0;
float tailWag = 0;
float tailWagDir = 0.5;

int lightR = 127;
int lightG = 127;
int lightB = 127;
int darkR = 127;
int darkG = 127;
int darkB = 127;
float backR;
float backG;
float backB;

int floor = 310; 
int ballSize = 30;
//float headY = 95; 

void setup(){
  size(1000,420);
  textFont(loadFont("TempusSansITC-48.vlw"),32);
  smooth();
  float backR = 0;
  float backG = 0;
  float backB = 0;
}

void draw(){
  background(backR,backG,backB);
  stroke(255);
  line(0,floor,width,floor);

  drawBall();
  drawCat();
  instructions(loopCount);
  loopCount = loopCount + 1;  
}

//draw red ball
void drawBall() {
    noStroke();
    ellipseMode(CENTER);
    fill(255,0,0);
    ellipse(mouseX + 25*dir,floor-ballSize/2,ballSize,ballSize);
}

void drawCat() {  
  //dark orange stuff      
    //head and body
    int dir = catDirection();
    darkR = newColor(darkR);
    darkG = newColor(darkG);
    darkB = newColor(darkB);
    
    float headX = mouseX;  
    float headY = 95;     
    float bodyX = headX -155*dir;
    float bodyY = headY + 85;
    float rRectX = bodyX - 95;
    float rRectY = bodyY - 50;

    noStroke();
    fill(darkR,darkG,darkB);
    roundRect(rRectX,rRectY,200,100);

    ellipseMode(CENTER);
    ellipse(headX,headY,90,90);
  
    //legs
    strokeWeight(20);
    stroke(darkR,darkG,darkB);
    line(bodyX+80*dir,bodyY+70,bodyX+105*dir,bodyY+120);//front leg going forward
    line(bodyX+60*dir,bodyY+100,bodyX+45*dir,bodyY+120);// front leg backward
    line(bodyX-50*dir,bodyY+70,bodyX-40*dir,bodyY+120); //back leg going forward
    line(bodyX-70*dir,bodyY+100,bodyX-95*dir,bodyY+120); //back leg backward
  
    //tail
    strokeWeight(10);
    noFill();
    curve((bodyX+100*dir),bodyY-170,bodyX-110*dir,bodyY-45,(bodyX-110*dir)+tailWag,bodyY-160+tailWag*.3,(bodyX-100*dir)+tailWag*-2,(bodyY-150)+tailWag*3);
    tailWag = tailWag + tailWagDir;
    if(tailWag >= 50 || tailWag <= -30){
      tailWagDir = tailWagDir * -1;
    }

  //light orange stuff
    //ears
    fill(lightR,lightG,lightB);
    strokeWeight(6);
    lightR = newColor(lightR);
    lightG = newColor(lightG);
    lightB = newColor(lightB);
    
    triangle(headX-45,headY-51,headX-15,headY-38,headX-40,headY-8);
    triangle(headX+55,headY-47,headX+43,headY-5,headX+20,headY-35);
    
    //stripes
    noFill();
    stroke(lightR,lightG,lightB);
    curve(bodyX-75*dir,bodyY-45,bodyX-25*dir,bodyY-45,bodyX-25*dir,bodyY-10,bodyX-50*dir,bodyY+5); //rear
    curve(bodyX-50*dir,bodyY-45,bodyX,bodyY-45,bodyX,bodyY+10,bodyX-25*dir,bodyY+5); //middle
    curve(bodyX-25*dir,bodyY-45,bodyX+25*dir,bodyY-45,bodyX+25*dir,bodyY+30,bodyX,bodyY+5); //front
  
    //whiskers
    strokeWeight(3);
    line(headX-75,headY+5,headX-25,headY+15);
    line(headX-80,headY+17,headX-30,headY+20);
    line(headX-75,headY+30,headX-27,headY+25);
    line(headX+25,headY+15,headX+75,headY+15);
    line(headX+20,headY+20,headX+77,headY+24);
    line(headX+25,headY+25,headX+75,headY+35);
    
}

//draw cat's body
void roundRect(float x, float y, float w, float h){
  
  fill(darkR,darkG,darkB);
  int dir = catDirection();
  println(darkR);
  float corner = w/10;
  float midDisp = w/20;
  
  beginShape();  
    curveVertex((x+corner)*dir,y);
    curveVertex((x+w-corner)*dir,y);
    curveVertex((x+w+midDisp)*dir,y+h/2.0f);
    curveVertex((x+w-corner)*dir,y+h);
    curveVertex((x+w/2)*dir,y+h-midDisp);
    curveVertex((x+corner)*dir,y+h);
    curveVertex((x-midDisp)*dir,y+h/2.0);
    curveVertex((x+corner)*dir,y);
    curveVertex((x+w-corner)*dir,y);
    curveVertex((x+w+midDisp)*dir,y+h/2.0);
  endShape();
}

//direction cat faces and moves is controlled by direction mouse moves
int catDirection() {
  int dir = 1;
  if (mouseX + 3 <= pmouseX){
    dir = -1;
  } else {
     dir = 1; 
  }
  return dir;
}

//instructions at bottom
void instructions(int loopCount) {      
    fill(255);
    int textX = 50;
    int textH = 350;

    text("If u rol da bal with ur maus, i'l chase id.",textX,textH);

    if (loopCount < 200) {
        text("Klik da maus tuh chanj da bakgrund", textX,textH + 50);
    } else if (loopCount >= 200 && loopCount < 500) {
        fill(224,183,34); 
        text("Didunt yu heer me ??", textX,textH + 50);
    } else if (loopCount >= 500 && loopCount < 750) {
        fill(58,224,34); 
        text("I sed 'klik da maus tuh chanj da bakgrund'", textX,textH + 50);        
    } else {
        fill(224,34,221); 
        text("stuped humanz", textX,textH + 50);       
    }
}

//to change light & dark cat colours
int newColor(int oldColor) {
  int newColor = (round(constrain(oldColor + random(-7,7),0,255)));
  return newColor;
} 

//to toggle between black and random coloured background
void mousePressed() {
    if (backR == 0) {  
       backR = random(1,255);
       backG = random(1,255);
       backB = random(1,255);
       float ellipseSize = random(50,200);
       
       for (int i = 0; i < 100; i ++) {
         noStroke();
         fill(random(127,255),random(127,255),random(127,255));
         ellipse(random(width),random(height),ellipseSize,ellipseSize);
       }
    } else {
       backR = 0; 
       backG = backR;
       backB = backR;
    }
}




