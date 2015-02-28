
float phaseNum;
int index = 0;
PFont f;

void setup() {
  size(500,500);
  background(0);
  noStroke();
}

void draw(){
  fill(0,random(170,200));
  rect(0,0,width,height);
  phaseNum = moonPhase(year(),month(),day()+index);
  drawMoon();
  
  if (phaseNum<4){drawShadow((width/2)-(phaseNum*35),height/2);}
  else {drawShadow(((width/2)+300)-(phaseNum*35),height/2);}
  
  fill(255);
  textAlign(CENTER);
    
  if(index == 0) {
    text(String(month())+" . "+String(day())+" . "+String(year()),width/2,(height/2)+150);
  }
  else{
    if (index == 1) {text("In "+String(index)+" night",width/2,(height/2)+150);}
    else {text("In "+String(index)+" nights",width/2,(height/2)+150);}
  }
}

//based on voidware's moon phase calculation in C#
//http://www.voidware.com/moon_phase.htm
float moonPhase(int y, int m, int d)
{
    int c;
    int e;
    float td;
    float b;

    if (m < 3) {
        y--;
        m += 12;
    }
    m++;
    c = int(365.25*y);
    e = int(30.6*m);
    td = c+e+d-694039.09;  //total days elapsed
    td /= 29.53;           // divide by the moon cycle (29.53 days)
    b = int(td);       //convert to integer
    td -= b;       //subtract integer part to leave fractional part of original total days
    b = td*8 + 0.5;     //scale fraction from 0-8 and round by adding 0.5
    return b;
}

void drawMoon(){
    for(int i=1; i<50; i++) {
      fill(245,10);
      ellipse(width/2, height/2,200-i*5,200-i*5);
      ellipse(width/2, height/2,150,150);
    }
}

void drawShadow(float x, float y) {
    for(int i=1; i<50; i++) {
      fill(0,80);
      ellipse(x, y,180-i*5,180-i*5);
    }
}

void mousePressed(){
  index++;
  print(day()+index);
}


