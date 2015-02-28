
int dir = 1;
float tailWag = 0;
float tailWagDir = 0.5;

float lightR = 127;
float lightG = 127;
float lightB = 127;
float darkR = 127;
float darkG = 127;
float darkB = 127;
float backR;
float backG;
float backB;
int loopCount = 0;

void setup(){
  size(1500,380);
  smooth();
  textFont(loadFont("TempusSansITC-24.vlw"),32);
  smooth();
  float backR = 0;
  float backG = 0;
  float backB = 0;
}

//cat's body
void roundRect(float x, float y, float w, float h)
{

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

void draw(){

  int dir = 1; //controls cat's direction  
  float headX = mouseX;
  float headY = 95; 
  int floor = 310; 
  int ballSize = 30;

  background(backR,backG,backB);
  stroke(255);
  line(0,floor,width,floor);
   
  //direction cat faces and moves is controlled by direction mouse moves
  if (mouseX < pmouseX){
    dir = dir * -1;
  }
     
      //ball
      noStroke();
      ellipseMode(CENTER);
      fill(255,0,0);
      ellipse(mouseX + 25*dir,floor-ballSize/2,ballSize,ballSize);

      //dark orange stuff
        //head and body
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
        
        darkR = constrain(darkR + random(-5,5),0,255);
        darkG = constrain(darkG + random (-5,5),0,255);
        darkB = constrain(darkB + random (-5,5),0,255);
        
        lightR = constrain(lightR + random(-5,5),0,255);
        lightG = constrain(lightG + random (-5,5),0,255);
        lightB = constrain(lightB + random (-5,5),0,255);
        
      //instructions
      fill(255);
      int textX = 900;
      int textH = 350;

      text("If u rol da bal with ur maus, i'l chase id.",50,textH);

      if (loopCount < 400) {
         text("Klik da maus tuh chanj da bakgrund", textX,textH);
      } else if (loopCount >= 400 && loopCount < 750) {
         text("Didunt yu heer me ??", textX,textH);
      } else if (loopCount >= 750 && loopCount < 900) {
         text("I sed 'klik da maus tuh chanj da bakgrund'", textX,textH);        
      } else {
         text("stuped humanz", textX,textH);       
      }
       loopCount = loopCount + 1;     
}

//to toggle between black and random coloured background
void mousePressed() {
    if (backR == 0) {  
       backR = random(1,255);
       backG = random(1,255);
       backB = random(1,255);
       float ellipseSize = random(50,200);
       
       for (int i = 0; i < 50; i ++) {
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




