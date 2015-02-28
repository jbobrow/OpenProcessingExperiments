
class Bot {
  PImage t, tb, lleg, rleg, dame, stache, hat, hrt;
  float x1, y1, x2, y2, d;
  float s, s2;
  float a = 0.0;
  float a2 = 0.0;
  float angleInc = PI/1.5;
  float angleInc2 = PI/30.0;
  float scalar = 1.05;
  float scalar2 = 25.0;
  float lpos, rpos, x, y, lx, ly;
  float r;
  float m;
  int typ;

  Bot (){   
    t = loadImage ("t.gif");
    tb = loadImage("tb.gif");
    lleg = loadImage("lleg.gif");
    rleg = loadImage("rleg.gif");
    dame = loadImage("dame.gif");
    stache = loadImage("stache.gif");
    hat = loadImage("hat.gif");
    hrt = loadImage ("hrt.gif");
  }
  
  //show the robot, assign it's type, various math elements.
  void Display(float xpos, float ypos, int type){
  
    //tpye/gender variable;
    typ = type;
    m = millis();
    x = xpos;
    y = ypos;
    a = a+angleInc;
    a2= a2+angleInc2;
    s=sin(a)*scalar;
    s2=sin(a2)*scalar2;
  
    //leg movement
    lpos = y+70;
    rpos = y+90;
    if (m % 4< 2){
      lpos = y+100;
    }
    else{
      rpos = y+110;
    }
    image (lleg, x, lpos-20, 20, 37);
    image (rleg, x+35, rpos-25, 17, 37);
    image (tb, x+s, y);
    //determines actual type
    if (typ == 0){
      image (dame, x-19, y+60, 80, 30);
    }
    else if (typ==1){
      image (stache, x, y+50);
      image (hat, x, y+5);
    }
  }
  
  //toast_bot expresses affection
  void Love (float xpos, float ypos){
    r = random(-3, 3);
    float r1 = random (15.00, 20.00);
    lx = xpos+x;
    ly = ypos+y;
    image (hrt, lx+r, ly+r, r1, r1);
  }
  
  //toastbot expresses distress
  void Distress(){
    m = millis();
    stroke (255);
    if (m % 10< 5){
      strokeWeight(10);
    }
    else {
      strokeWeight (5);
    }
    line (x+25, y+15, x+25, y-10); 
    line (x+40, y+15, x+60, y-10);
    line (x+10, y+15, x-10, y-10);
  }
}






