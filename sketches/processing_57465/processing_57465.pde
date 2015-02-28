
class Bott {
 
  float cx;
  float cy;
  
  Bott(float tempCX, float tempCY) {
    cx = tempCX;
    cy = tempCY;
  }
  
  void move() {
  cx = mouseX;
  cy = mouseY;
  }

  void display() {
    //ORBIT
    fill(255,224,0);
    arc(cx,cy+70,80,80,0,PI);
  
    //TOP HEAD 
    fill(255,224,0);
    ellipse(cx,cy-160,40,40);
  
    //RIGHT EAR
    fill(255,224,0);
    ellipse(cx+40,cy-110,60,60);
    
    //LEFT EAR
    fill(255,224,0);
    ellipse(cx-40,cy-110,60,60);
  
    //BODY
    fill(205);
    ellipse(cx,cy,160,160);
  
    //HEAD
    ellipse(cx,cy-110,100,100);
  
    //TUMMY
    fill(205);
    stroke(255,224,0);
    strokeWeight(4);
    ellipse(cx,cy+12,120,120);
    fill(205);
    ellipse(cx,cy+3,90,90);
    //fill(255,224,0);
    ellipse(cx,cy,70,70);
  
    //ANNTENAE
    fill(255,224,0);
    stroke(0);
    strokeWeight(1);
    line(cx,cy-180,cx,cy-190);
    line(cx,cy-190,cx+10,cy-200);
    line(cx+10,cy-200,cx,cy-210);
    line(cx,cy-210,cx,cy-230);
    ellipse(cx,cy-230,15,15);
  
    //MOUTH
    line(cx-48,cy-100,cx-30,cy-100);
    line(cx-30,cy-100,cx-20,cy-90);
    line(cx-20,cy-90,cx-10,cy-100);
    line(cx-10,cy-100,cx+10,cy-100);
    line(cx+10,cy-100,cx+20,cy-110);
    line(cx+20,cy-110,cx+30,cy-100);
    line(cx+30,cy-100,cx+48,cy-100);
  
    if(mousePressed) {
     //EYE 
    fill(155,0,255);
    ellipse(cx-20,cy-130,20,20);
    fill(255);
    ellipse(cx-20,cy-130,10,10);
    fill(155,0,255);
    ellipse(cx+20,cy-130,30,30);
    fill(255);
    ellipse(cx+20,cy-130,20,20);
  
    }else{
  
    //EYE
    fill(255);
    ellipse(cx-20,cy-130,30,30);
    fill(155,0,255);
    ellipse(cx-20,cy-130,20,20);
    fill(255);
    ellipse(cx+20,cy-130,20,20);
    fill(155,0,255);
    ellipse(cx+20,cy-130,10,10);
    }
  }
  
  
}

