
/* eyes blink every 3 seconds*/
/* keep mouse pressed will keep eyes open*/
/* "I am hungry" shows at 3pm*/


Eye theEye;
PFont myFont;
int vv=0;
float mx;
float my;
float mmy;
float mmmy;
float mxr;
int xx=0;
void setup() {
  size(640,480);
  noStroke();
  smooth();

  theEye= new Eye();
  frameRate(30);
}


void draw() {
  theEye.eyeOpen();
  xx+=1; 

  if( xx>100) {

    theEye.eyeClose();
  }
  if(xx>130) {
    xx=0;
  }
  if(mousePressed) {
    theEye.vein();
    xx=0;
  }
}


class Eye {

  int eyeFCenterX=175;
  int ReyeFCenterX=455;
  int eyeFCenterY=240;
  int eyeBCenterX=30;
  int ReyeBCenterX=100;
  int eyeBCenterY=30;
  int diffX=100;
  int diffY=60;

  float eyelashCenterX=eyeFCenterX-diffX;
  float ReyelashCenterX=407;
  float eyelashCenterY=eyeFCenterY-diffY;
  float ReyelashCenterY=129;

  float RCeyelashCenterY=350;
  int closeEyeCenterX=eyeFCenterX-100;
  int RcloseEyeCenterX=400;
  int RcloseEyeCenterY=352;
  int closeEyeCenterY=eyeFCenterY+60;

  void eyeOpen() {
   
    /////normal eye//////
    noStroke();
    background(200,150,0);
    fill(37,62,104);
    ellipse(eyeFCenterX,eyeFCenterY-15,220,220);// eyelid
    fill(170);
    ellipse(eyeFCenterX,eyeFCenterY,210,210); //eye big grey

    fill(255);
    ellipse(eyeFCenterX,eyeFCenterY,184,184); //eye white

    //////////

    if (abs(mouseX - mx) > 0.1) {
      mx = mx + (mouseX - mx) * 0.05;
    }

    if (abs(mouseY - my) > 0.1) {
      my = my + (mouseY - my) * 0.05;
    }
    mx =constrain(mx,(eyeFCenterX-eyeBCenterX)-6,(eyeFCenterX-eyeBCenterX)+60);
    my =constrain(my,(eyeFCenterY-eyeBCenterY)-6,(eyeFCenterY-eyeBCenterY)+60);
    fill(200);
    ellipse(mx,my,110,110); //eye grey
    fill(154,113,42);
    ellipse(mx,my,102,102); //eye brown
    fill(0);
    ellipse(mx,my,85,85); //eye black
    fill(255);
    ellipse(mx+30,my-25,25,22); //eye shine

    if (abs(mouseY - mmy) > 0.1) {
      mmy = mmy + (mouseY- mmy) * 0.05;
    }
    mmy = constrain(mmy, 100,180);
    eyelashCenterY=mmy;
    ///eyelashes//
    beginShape();

    fill(0);
    vertex(eyelashCenterX,mmy);
    vertex(eyelashCenterX+150,eyelashCenterY-50);
    vertex(eyelashCenterX+155,eyelashCenterY-85); 
    vertex(eyelashCenterX+130,eyelashCenterY-61);
    vertex(eyelashCenterX+125,eyelashCenterY-88);
    vertex(eyelashCenterX+96,eyelashCenterY-60);
    vertex(eyelashCenterX+85,eyelashCenterY-92);
    vertex(eyelashCenterX+73,eyelashCenterY-56);
    vertex(eyelashCenterX+38,eyelashCenterY-78);
    vertex(eyelashCenterX+39,eyelashCenterY-46);
    vertex(eyelashCenterX+5,eyelashCenterY-55);
    vertex(eyelashCenterX+14,eyelashCenterY-20);
    vertex(eyelashCenterX-24,eyelashCenterY-27);
    endShape(CLOSE);
    /////eyelash End///////

    //////opened right eye/////
    fill(37,62,104);
    ellipse(ReyeFCenterX,eyeFCenterY-15,220,220);// eyelid
    fill(170);
    ellipse(ReyeFCenterX,eyeFCenterY,210,210); //eye big grey

    fill(255);
    ellipse(ReyeFCenterX,eyeFCenterY,184,184); //eye white

    //////////

    if (abs(mouseX - mxr) > 0.1) {
      mxr = mxr + (mouseX - mxr) * 0.05;
    }
    mxr =constrain(mxr,(ReyeFCenterX-ReyeBCenterX)+70,(ReyeFCenterX-ReyeBCenterX)+130);

    fill(200);
    ellipse(mx+280,my,110,110); //eye grey
    fill(154,113,42);
    ellipse(mx+280,my,102,102); //eye brown
    fill(0);
    ellipse(mx+280,my,85,85); //eye black
    fill(255);
    ellipse(mx+310,my-25,25,22); //eye shine
    ///eyelashes//
    if (abs(mouseY - mmmy) > 0.1) {
      mmmy = mmmy + (mouseY- mmmy) * 0.05;
    }
    mmmy = constrain(mmy, 60,140);
    ReyelashCenterY=mmmy;

    beginShape();
    fill(0);
    vertex(ReyelashCenterX,mmmy);
    vertex(ReyelashCenterX-4,ReyelashCenterY-34);
    vertex(ReyelashCenterX+18,ReyelashCenterY-11); 
    vertex(ReyelashCenterX+26,ReyelashCenterY-38);
    vertex(ReyelashCenterX+54,ReyelashCenterY-12);
    vertex(ReyelashCenterX+66,ReyelashCenterY-41);
    vertex(ReyelashCenterX+80,ReyelashCenterY-7);
    vertex(ReyelashCenterX+113,ReyelashCenterY-26);
    vertex(ReyelashCenterX+112,ReyelashCenterY+6);
    vertex(ReyelashCenterX+147,ReyelashCenterY+3);
    vertex(ReyelashCenterX+137,ReyelashCenterY+31);
    vertex(ReyelashCenterX+174,ReyelashCenterY+24);
    vertex(ReyelashCenterX+151,ReyelashCenterY+51);
    endShape(CLOSE);
    
     int h=hour();
    if (h==15) {
      myFont = createFont("FFScala", 32);
      textFont(myFont);
      text("I am hungry...", 220, 420);
    }
  }

  void eyeClose() {
    noStroke();
    background(200,150,0);

    /////eye close/////left
    fill(37,62,104);
    ellipse(eyeFCenterX,eyeFCenterY,220,235);// eyelid
    fill(170);
    ellipse(eyeFCenterX,eyeFCenterY-15,210,210);// eyelid
    beginShape();
    fill(0);
    vertex(closeEyeCenterX,closeEyeCenterY);
    vertex(closeEyeCenterX+150,closeEyeCenterY+50);
    vertex(closeEyeCenterX+155,closeEyeCenterY+85); 
    vertex(closeEyeCenterX+130,closeEyeCenterY+61);
    vertex(closeEyeCenterX+125,closeEyeCenterY+88);
    vertex(closeEyeCenterX+96,closeEyeCenterY+60);
    vertex(closeEyeCenterX+85,closeEyeCenterY+92);
    vertex(closeEyeCenterX+73,closeEyeCenterY+56);
    vertex(closeEyeCenterX+38,closeEyeCenterY+78);
    vertex(closeEyeCenterX+39,closeEyeCenterY+46);
    vertex(closeEyeCenterX+5,closeEyeCenterY+55);
    vertex(closeEyeCenterX+14,closeEyeCenterY+20);
    vertex(closeEyeCenterX-24,closeEyeCenterY+27);
    endShape(CLOSE);

    /////eye close/////right
    fill(37,62,104);
    ellipse(ReyeFCenterX,eyeFCenterY,220,235);// eyelid
    fill(170);
    ellipse(ReyeFCenterX,eyeFCenterY-15,210,210);// eyelid

    beginShape();
    fill(0);
    vertex(ReyelashCenterX,RCeyelashCenterY-3);
    vertex(ReyelashCenterX-4,RCeyelashCenterY+34);
    vertex(ReyelashCenterX+18,RCeyelashCenterY+11); 
    vertex(ReyelashCenterX+26,RCeyelashCenterY+38);
    vertex(ReyelashCenterX+54,RCeyelashCenterY+12);
    vertex(ReyelashCenterX+66,RCeyelashCenterY+41);
    vertex(ReyelashCenterX+80,RCeyelashCenterY+7);
    vertex(ReyelashCenterX+113,RCeyelashCenterY+26);
    vertex(ReyelashCenterX+112,RCeyelashCenterY-6);
    vertex(ReyelashCenterX+147,RCeyelashCenterY-3);
    vertex(ReyelashCenterX+137,RCeyelashCenterY-31);
    vertex(ReyelashCenterX+174,RCeyelashCenterY-24);
    vertex(ReyelashCenterX+151,RCeyelashCenterY-51);
    endShape(CLOSE);
    
       int h=hour();
    if (h==15) {
      myFont = createFont("FFScala", 32);
      textFont(myFont);
      text("I am hungry...", 220, 420);
    }
  }
  void vein() {
    println(vv);
    if(mousePressed) {
      if(vv<100 ) {
        vv++;
      }
      else {
        vv=100;
      }
    }

    stroke(200,0,0,vv);
    strokeWeight(3);
    //Left
    line(eyeFCenterX-76,eyeFCenterY-51,eyeFCenterX-46,eyeFCenterY-55);
    line(eyeFCenterX-46,eyeFCenterY-55,eyeFCenterX-33,eyeFCenterY-50);
    line(eyeFCenterX+30,eyeFCenterY+86,eyeFCenterX+8,eyeFCenterY+70);
    line(eyeFCenterX+8,eyeFCenterY+70,eyeFCenterX+18,eyeFCenterY+60);
    line(eyeFCenterX-60,eyeFCenterY+70,eyeFCenterX-18,eyeFCenterY+30);
    line(eyeFCenterX-70,eyeFCenterY,eyeFCenterX-50,eyeFCenterY+30);
    line(eyeFCenterX-90,eyeFCenterY+10,eyeFCenterX-70,eyeFCenterY);
    //Right
    line(ReyeFCenterX-76,eyeFCenterY-51,ReyeFCenterX-46,eyeFCenterY-55);
    line(ReyeFCenterX-46,eyeFCenterY-55,ReyeFCenterX-33,eyeFCenterY-50);
    line(ReyeFCenterX+30,eyeFCenterY+86,ReyeFCenterX+8,eyeFCenterY+70);
    line(ReyeFCenterX+8,eyeFCenterY+70,ReyeFCenterX+18,eyeFCenterY+60);
    line(ReyeFCenterX-60,eyeFCenterY+70,ReyeFCenterX-18,eyeFCenterY+30);
    line(ReyeFCenterX-70,eyeFCenterY,ReyeFCenterX-50,eyeFCenterY+30);
    line(ReyeFCenterX-90,eyeFCenterY+10,ReyeFCenterX-70,eyeFCenterY);
    
  }
  
}
void mouseClicked() {
  println(mouseX+"--"+mouseY);
}


