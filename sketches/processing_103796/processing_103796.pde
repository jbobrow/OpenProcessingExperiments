
nitboolean durch;
float xx;
float yy;
int bcount=0;
int[] stars=new int[300];
boolean[] levelcheck=new boolean[300];
PShape star;
int level=0;
PFont font;
float xw, xh;
int boxh;
boolean menu;
int punkte=0;
int punktelevel=400;
boundry myb1;
boundry myb2;
boundry myb3;
boundry myb4;
mboundry mb1;
mboundry mb2;
mboundry mb3;
myboundry myxb1;
myboundry myxb2;
box mybox1;
bonus bonus1;
bonus bonus2;
schalter schalter1;
schalter schalter2;

int ltime, ctime;
float etime;
int ltime1, ctime1;
float etime1;
float unten;
float a;
boolean pressed;
float xxi, yy2i, xposi, yposi;
float h03,w06,texts ,h15, w30,textsize,w005, h01, w01, h09, w09, w085, h055, w065, w002, w045, h065, w025, w035, h06, w075, w05, h07, w07, w03, w02, w04, w08, w055, h05, h08;

void setup() {

      size(800, 480);
     //size(displayWidth, displayHeight);
    //orientation(LANDSCAPE);



 // font=loadFont("Monospaced.plain-48.vlw");
 // textFont(font, height/15);
  xx=0;
  xx=0;
  yy= height*0.1;
  w05=width*0.5;
  h07=height*0.7;
  w07=width*0.7;
  w03=width*0.3;
  w02=width*0.2;
  w04=width*0.4;
  w08=width*0.8;
  w055=width*0.55;
  h05=height*0.5;
  h06=height*0.6;
  h08=height*0.8;
  w075=width*0.75;
  w035=width*0.35;
  w045=width*0.45;
  w025=width*0.25;
  h065=height*0.65;
  h03=height*0.3;
  w002=width*0.002;
  w06=width*0.6;
  w065=width*0.65;
  h055=height*0.55;
  w085=width*0.85;
  w09=width*0.9;
  h08=height*0.8;
  h09=height*0.9;
  h01=height*0.1;
  w01=width*0.1;
  texts=height/10;
  w01=width*0.1;
  h01=height*0.1;
  boxh=width/38;
  w005=width*0.05;
  textsize=height/20;
  h15=height/15;
  w30=width/30;
  bonus1=new bonus(color(123, 231, 123), width*0.5, height*0.7-boxh, height/20, height/20);
   bonus2=new bonus(color(123, 231, 123), width*0.5, height*0.7-boxh, height/20, height/20);
  schalter1=new schalter(color(123, 231, 123), width*0.5, height*0.7-boxh, height/40, height/30);
  schalter2=new schalter(color(123, 231, 123), width*0.7, height*0.7-boxh, height/40, height/30);

  myb1=new boundry(color(123, 231, 123), width*0.5, height*0.55, width*0.05, height/20);
 
  myb2=new boundry(color(103, 231, 123), width*0.3, height*0.55, width*0.05, height/20);
  myb3=new boundry(color(103, 231, 123), width*0.3, height*0.55, width*0.05, height/20);
  myb4=new boundry(color(103, 231, 123), width*0.3, height*0.55, width*0.05, height/20);
  mb1=new mboundry(color(103, 231, 123), width*0.3, height*0.55, width*0.7, height*.55, width*0.1, height/20, width*0.004, 13);
  mb2=new mboundry(color(103, 231, 123), width*0.2, height*0.55, width*0.7, height*.55, width*0.1, height/20, width*0.004, 13);
  mb3=new mboundry(color(103, 231, 123), 0, height*0.55, width, height*.55, width*0.1, height/20, width*0.004, 13);
  myxb1=new myboundry(color(103, 231, 123), width*0.5, height*0.7, width*0.5, height*.55, width*0.1, height, width*0.001, 13);
  myxb2=new myboundry(color(103, 231, 123), width*0.5, height*0.7, width*0.5, height*.55, width*0.1, height, width*0.001, 13);
  
  mybox1=new box(width*0.007, width*0.05, 0.25);
  unten=height*0.7-boxh;
}
void draw() {
  background(0);
   // Punkte
  
    
     
    
   if (menu==false) {
switch(level){
  case 0:
 level1();
  break;
case 1:
  level1();
   
  break;
  case 2:
  level2();

  break;
   case 3:
      level3();
    
      break;
    case 4:
      level4();
   
      break;
    case 5:
      level5();
      break;
    case 6:
      level6();
      break;
    case 7:
      level7();
      break;
    case 8:
      level8();
      break;
    case 9:
      level9();
      break;
    case 10:
      level10();
      break;
    case 11:
      level11();
      break;
    case 12:
      level12();
      break;
    case 13:
      level13();
      break;
    case 14:
      level14();
      break;
    case 15:
      level15();
      break;
    case 16:
      level16();
      break;
    case 17:
      level17();
      break;
    case 18:
      level18();
      break;
    case 19:
      level19();
      break;
    case 20:
      level20();
      break;
    case 21:
      level21();
      break;
    case 22:
      level22();
      break;
    case 23:
      level23();
      break;
    case 24:
      level24();
      break;
    case 25:
      level25();
      break;
    case 26:
      level26();
      break;
    case 27:
      level27();
      break;
    case 28:
      level28();
      break;
    case 29:
      level29();
      break;
    case 30:
      level30();
      break;
    case 31:
      level31();
      break;
    case 32:
      level32();
      break;
    case 33:
      level33();
      break;
    case 34:
      level34();
      break;
    case 35:
      level35();
      break;
    case 36:
      level36();
      break;
    case 37:
      level37();
      break;
    case 38:
      level38();
      break;
    case 39:
      level39();
      break;
    case 40:
      level40();
      break;
    case 41:
      level41();
      break;
    case 42:
      level42();
      break;
    case 43:
      level43();
      break;
    case 44:
      level44();
      break;
    case 45:
      level45();
      break;
      case 46:
      level46();
      break;
      case 47:
      level47();
      break;
      case 48:
      level48();
      break;
      case 49:
      level49();
      break;
      case 50:
      level50();
      break;
       case 51:
      level51();
      break;
       case 52:
      level52();
      break;
      case 53:
      level53();
      break;
       case 54:
      level54();
      break;
       case 55:
      level55();
      break;
       case 56:
      level56();
      break;
       case 57:
      level57();
      break;
       case 58:
      level58();
      break;
       case 59:
      level59();
      break;
       case 60:
      level60();
      break;
       case 61:
      level61();
      break;
       case 62:
      level62();
      break;
       case 63:
      level63();
      break;
       case 64:
      level64();
      break;
       case 65:
      level65();
      break;
       case 66:
      level66();
      break;
       case 67:
      level67();
      break;
       case 68:
      level68();
      break;
       case 69:
      level69();
      break;
      
}
}


 
}


void weiter() {
  levelcheck[level]=true;
  level=level+1;
  mybox1.xx=0;
 schalter1.dead=false;
  schalter2.dead=false;

  mybox1.jumping=false;

  punkte=punkte+punktelevel;
  punktelevel=400;
  bcount=0;
  mybox1.yy2=unten;

  mybox1.a=0;
  
  
 
  
  
  
  
}
void bang() {
  mybox1.xx=0;
   schalter1.dead=false;
    schalter2.dead=false;
  mybox1.jumping=false;
  bcount=bcount+1;
  schalter2.on=false;
  schalter1.on=false;
  if (bcount>=3) {
    stars[level]=2;
  }
  if (bcount>=6) {
    stars[level]=1;
  }
  if (bcount<=2) {
    stars[level]=3;
  }
  mybox1.yy2=unten;
  mybox1.a=0;
  mybox1.xx=0;
  //mybox1.yy2=0;


  mybox1.jumping=false;

  punktelevel=punktelevel-25;
  if (punktelevel<=0)punktelevel=0;
}
void menudisplay() {
  text("CLOSE", w05, h08);
  if ( mousePressed==true
    &&mouseX>=w05
    &&mouseX<=w065
    &&mouseY>=h07
    &&mouseY<=h08
    )menu=false; 

  for (int i=1;i<=35;i++)
  {
    textFont(font, height/40);
    fill(255);
    if (stars[i]==3 && levelcheck[i]==true) {
      shape(star, xx, yy, width/35, width/35);
      shape(star, xx+width/35, yy, width/35, width/35);
      shape(star, xx+width/35+width/35, yy, width/35, width/35);
    }
    if (stars[i]==2 && levelcheck[i]==true) {
      shape(star, xx, yy, width/35, width/35);
      shape(star, xx+width/35, yy, width/35, width/35);
    }
    if (stars[i]==1 && levelcheck[i]==true) {
      shape(star, xx, yy, width/35, width/35);
    }
    text( " Level:"+i, xx, yy);
    xx=xx+w01+w01;

    if (i>=5 && i<6) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=10 && i<11) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=15 && i<16) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=20 && i<21) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=25 && i<26) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=30 && i<31) {
      yy=yy+h01;
      xx=w01;
    }
    if (i>=35 && i<36) {
      yy=yy+h01;
      xx=w01;
    }
    //if(i>=40 && i<41){yy=yy+h01;xx=w01;}
    //if(i>=45 && i<46){yy=yy+h01;xx=w01;}

    if (i>=35) {
      xx=w01;
      yy=h01;
    }
  }
  textFont(font, height/15);
}


class box { 

  float velocity;
  float incw;
  float jumph;
  float xx=0;
  float yy2=height*0.7-boxh;
  float inc;
  float a;

  boolean jumping;


  // The Constructor is defined with arguments.
  box( float tempvel, float tempincw, float tempjumph) { 

    velocity = tempvel;
    incw = tempincw;
    jumph = tempjumph;
  }

  void display() {
    noStroke();
    inc = (PI / width) * 10 * incw /15;
    println(inc);
    ctime = millis();
    etime = (ctime - ltime)/10;
    ltime = ctime;
    xx+= velocity*etime;
    rect(xx, yy2, boxh, boxh);
    println(incw);
    println(a);
  }

  void jump() {
    if (mousePressed && !jumping) jumping = true;
    if (jumping)
    {

      if (a > PI) {
        jumping = false;
        a = 0;
      }
      yy2 = unten - abs(sin(a)) * height * jumph;
      println(yy2);
      //yy2=unten+sin(a)*210.0;1

      a += inc;
    } else {
      yy2 = unten;
      a = 0;
    }

  }
}
class mboundry { 
  color c;
  float xpos;
  float ypos;
  float xpos1;
  float ypos1;
  float w;
  float h;
   float inc;
   float velocity;
  float incw;
  float xxpos;
  boolean merker;

  // The Constructor is defined with arguments.
  mboundry(color tempC, float tempXpos, float tempYpos,float tempXpos1, float tempYpos1, float tempw, float temph,float tempvel, float tempincw) { 
    c = tempC;
    xpos = tempXpos;
    xxpos=tempXpos;
    ypos = tempYpos;
     xpos1 = tempXpos1;
    ypos1 = tempYpos1;
      velocity = tempvel;
    incw = tempincw;
 w=tempw;
 h=temph;
  xw=tempw;
  }

  void display() {
noStroke();
    fill(c);
    xw=mb1.w;
      inc = (PI / width) * 10 * xw / incw;
  ctime1 = millis();
  etime1 = (ctime1 - ltime1)/5;
  ltime1 = ctime1;
  
   
    rect(xpos,ypos,w,h);
     if(merker==false) xpos+= velocity*etime;
     if(xpos>=xpos1 && merker==false)
     merker=true;
     if(merker==true){
        xpos-= velocity*etime;
     }
     if(merker==true && xpos<=xxpos+30)merker=false;
   
     
     if(mybox1.xx+boxh>=xpos && mybox1.xx<=xpos+w&& mybox1.yy2+boxh>=ypos && mybox1.yy2<=ypos+h)
  {bang();}
    
  }


}
class myboundry { 
  color c;
  float xpos;
  float ypos;
  float xpos1;
  float ypos1;
  float w;
  float h;
   float inc;
   float velocity;
  float incw;
  float xxpos;
  boolean merker;
  float yypos;

  // The Constructor is defined with arguments.
  myboundry(color tempC, float tempXpos, float tempYpos,float tempXpos1, float tempYpos1, float tempw, float temph,float tempvel, float tempincw) { 
    c = tempC;
    xpos = tempXpos;
    xxpos=tempXpos;
    ypos = tempYpos;
     xpos1 = tempXpos1;
    ypos1 = tempYpos1;
    yypos=tempYpos;
      velocity = tempvel;
    incw = tempincw;
 w=tempw;
 h=temph;
  xw=tempw;
  }

  void display() {
noStroke();
    fill(c);
    xw=mb1.w;
      inc = (PI / width) * 10 * xw / incw;
  ctime1 = millis();
  etime1 = (ctime1 - ltime1)/5;
  ltime1 = ctime1;
  
   
    rect(xpos,ypos,w,h);
     if(merker==false) ypos-= velocity*etime;
     if(ypos<=ypos1 && merker==false)
     merker=true;
     if(merker==true){
        ypos+= velocity*etime;
     }
     if(merker==true && ypos>=yypos+30)merker=false;
   
     
     if(mybox1.xx+boxh>=xpos && mybox1.xx<=xpos+w&& mybox1.yy2+boxh>=ypos && mybox1.yy2<=ypos+h)
  {bang();}
    
  }


}
class boundry { 
  color c;
  float xpos;
  float ypos;
  float w;
  float h;
  boolean on;
 

  // The Constructor is defined with arguments.
  boundry(color tempC, float tempXpos, float tempYpos, float tempw, float temph) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
 w=tempw;
 h=temph;
  }

  void display() {
noStroke();
    fill(c);
   
    rect(xpos,ypos,w,h);
     if(mybox1.xx+boxh>=xpos && mybox1.xx<=xpos+w&& mybox1.yy2+boxh>=ypos && mybox1.yy2<=ypos+h)
  {bang();}
    
  }


}
class bonus { 
  color c;
  float xpos;
  float ypos;
  float w;
  float h;
   boolean dead;

  // The Constructor is defined with arguments.
  bonus(color tempC, float tempXpos, float tempYpos, float tempw, float temph) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
 w=tempw;
 h=temph;
  }

  void display() {
noStroke();
    fill(c);
   

     if(dead==false && mybox1.xx+boxh>=xpos && mybox1.xx<=xpos+w&& mybox1.yy2+boxh>=ypos && mybox1.yy2<=ypos+h)
 {punkte=punkte+500; dead=true;}
if(dead!=true) ellipse(xpos,ypos,w,h);
    
  }


}
class schalter { 
  color c;
  float xpos;
  float ypos;
  float w;
  float h;
   boolean dead;
   boolean on;

  // The Constructor is defined with arguments.
  schalter(color tempC, float tempXpos, float tempYpos, float tempw, float temph) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
 w=tempw;
 h=temph;
  }

  void display() {
noStroke();
    fill(c);
   

     if(dead==false && mybox1.xx+boxh>=xpos && mybox1.xx<=xpos+w&& mybox1.yy2+boxh>=ypos && mybox1.yy2<=ypos+h)
 {on=true; dead=true;}
if(dead!=true) rect(xpos,ypos,w,h);
    
  }


}


void level0() {
   fill(111);
  text("Jump! Jump!\nClick to start!", w05, h05);
  text("(C) by www.bitator.com", w03, h07);
  if (mousePressed==true)weiter();
}

void level1() {
  myb2.display();
  rect(0, h07, width, height);
  myb2.c=color(121, 233, 1);
  mybox1.display();
  mybox1.jump();

  myb2.h=height;
  myb2.xpos=width*0.35;




  if (mybox1.xx>width) {
    weiter();
    mybox1.xx=0;
  }
}
void level2() {
  myb1.display();
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  myb1.h=height;
  if (mybox1.xx>width) {
    weiter();
  }
}
void level3() { 

  myb1.c=color(211, 213, 1);
  myb2.c=color(211, 213, 1);
  myb1.display();
  myb2.display();
  myb2.xpos=w07;
  myb1.xpos=width*0.35;

  mybox1.display();
  mybox1.jump();
  rect(0, h07, width, height);
  if (mybox1.xx>width) {
    weiter();
  }
}
void level4() { 

  myb1.c=color(21, 213, 1);
  myb2.c=color(21, 213, 1);
  myb1.display();
  myb2.display();

  myb2.xpos=width*0.75;
  myb1.xpos=width*0.32;
  mybox1.display();
  mybox1.jump();
  rect(0, h07, width, height);
  if (mybox1.xx>width) {
    weiter();
  }
}
void level5() { 

  myb1.c=color(211, 13, 1);
  myb1.display();
  mybox1.incw=width*0.04;
  rect(0, height*0.7, width, height);

  mybox1.display();
  mybox1.jump();

  myb1.h=height;
  myb1.xpos=width*0.45;

  myb1.ypos=height*0.65;
  myb1.w=width*0.1;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level6() { 

  myb1.c=color(111, 13, 19);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();

  myb1.h=height;
  myb1.xpos=width*0.5;
  mybox1.incw=width*0.032;
  myb1.ypos=height*0.65;
  myb1.w=width*0.25;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level7() { 
  xw=myb1.w;
  myb1.c=color(11, 131, 19);
  myb2.c=color(11, 131, 19);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=w05;
  myb2.ypos=height*0.3;
  myb2.w=width*0.25;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=width*0.5;
  mybox1.incw=width*0.032;
  myb1.ypos=height*0.65;
  myb1.w=width*0.25;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level8() { 
  xw=myb1.w;
  myb1.c=color(11, 131, 19);
  myb2.c=color(11, 131, 19);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=w03;
  myb2.ypos=height*0.4;
  myb2.w=width*0.25;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=width*0.77;
  mybox1.incw=width*0.032;
  myb1.ypos=height*0.66;
  myb1.w=width*0.25;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level9() { 
  xw=myb1.w;
  myb1.c=color(11, 131, 191);
  myb2.c=color(11, 131, 191);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=0;
  myb2.ypos=height*0.4;
  myb2.w=width*0.25;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=width*0.3;
  mybox1.incw=width*0.032;
  myb1.ypos=height*0.65;
  myb1.w=width*0.2;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level10() { 
  xw=myb1.w;
  myb1.c=color(11, 131, 91);
  myb2.c=color(11, 131, 91);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=w04;
  myb2.ypos=height*0.55;
  myb2.w=width*0.05;
  myb2.h=width*0.02;
  myb1.h=height;
  mybox1.incw=width*0.04;

  myb1.ypos=height*0.65;
  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level11() {
  myb1.c=color(113, 231, 91);
  myb2.c=color(113, 231, 91);
  myb3.c=color(113, 231, 91);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  myb3.display();
  mybox1.display();
  mybox1.jump();

  myb2.xpos=w03;
  myb2.ypos=height*0.55;
  myb2.w=width*0.05;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=w04;
  mybox1.incw=width*0.03;
  myb1.ypos=height*0.65;
  myb1.w=width*0.05;
  myb3.h=height;
  myb3.xpos=w07;

  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level12() {
  myb1.c=color(123, 211, 91);
  myb2.c=color(123, 211, 91);
  myb3.c=color(113, 211, 91);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  myb3.display();
  mybox1.display();
  mybox1.jump();

  myb2.xpos=w03;
  myb2.ypos=height*0.6;
  myb2.w=width*0.03;
  myb2.h=height;
  myb1.h=height;
  myb1.xpos=w055;

  myb1.ypos=height*0.65;
  myb1.w=width*0.03;
  myb3.h=height;
  myb3.xpos=w08;
  mybox1.incw=width*0.05;
  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}


void level13() {
  mb1.c=color(113, 41, 91);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();


  mybox1.incw=width*0.04;
  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level14() {
  mb1.c=color(123, 241, 191);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();

  myb1.h=height;
  myb1.xpos=w075;

  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.04;
  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level15() {

  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb1.h=height;
  xposi=myb1.xpos;
  xh=myb1.h;
  yposi=myb1.ypos;
  xxi=mybox1.xx;
  yy2i=mybox1.yy2;
  mybox1.incw=width*0.04;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level16() {
  myxb1.c=color(123, 22, 98);
  rect(0, h07, width, height);
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myxb1.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level17() {
  myxb1.c=color(13, 222, 98);
  myxb2.c=color(13, 222, 98);
  rect(0, h07, width, height);
  myxb1.xpos=w04;
  myxb2.xpos=w075;
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myxb1.display();
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level18() {
  mybox1.display();
  mybox1.jump();
  bonus1.display();
  rect(0, h07, width, height);
  if (mybox1.xx>width) {
    weiter();
    bonus1.dead=false;
  }
}
void level19() {
  myb1.c=color(131, 222, 981);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  myb1.xpos=w05;
  myb1.ypos=h06;
  bonus1.display();
  bonus1.xpos=w075;
  myb1.display();
  if (mybox1.xx>width) {
    weiter();
    bonus1.dead=false;
  }
}
void level20() {
  myb1.c=color(11, 231, 9);
  myb2.c=color(11, 231, 9);
  myb3.c=color(11, 231, 9);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  myb3.display();
  mybox1.display();
  mybox1.jump();

  myb2.xpos=w03;
  myb2.ypos=height*0.55;
  myb2.w=width*0.05;
  myb2.h=height;
  myb1.h=height;
  myb1.xpos=w04;
  mybox1.incw=width*0.03;
  myb1.ypos=height*0.65;
  myb1.w=width*0.05;
  myb3.h=height;
  myb3.xpos=w075;

  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level21() {
  fill(21, 213, 182);
  myb1.c=color(21, 213, 182);
  myb2.c=color(21, 213, 182);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb1.h=height;
  myb1.xpos=w035;
  mybox1.incw=width*0.04;
  myb1.ypos=height*0.53;
  myb1.w=width*0.025;
  myb2.display();
  myb2.h=height;
  myb2.xpos=w07;

  myb2.ypos=height*0.53;
  myb2.w=width*0.025;
  if (mybox1.xx>width) {
    weiter();
  }
}
void level22() {

  mb1.c=color(113, 141, 23);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb2.display();
  myb1.h=height;
  myb1.xpos=w07;
  myb1.xpos=width*0.3;
  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.035;
  myb2.ypos=height*0.6 ;
  myb2.xpos=w075;
  myb1.w=width*0.03;
  mb1.velocity=width*0.003;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level23() {

  mb1.c=color(123, 156, 123);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb2.display();
  myb4.xpos=w05;
  myb1.h=height;
  myb1.xpos=w07;
  myb1.xpos=width*0.3;
  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.04;
  myb2.ypos=height*0.6 ;
  myb2.xpos=w07;
  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level24() {

  mb1.c=color(12, 156, 123);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb2.display();
  myb1.h=height;
  myb1.xpos=w07;
  myb1.xpos=width*0.3;
  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.04;
  myb2.ypos=height*0.6 ;
  myb2.xpos=w08;
  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level25() {
  myb1.c=color(113, 131, 9);
  myb2.c=color(113, 131, 9);
  myb3.c=color(113, 131, 9);
  myb4.c=color(113, 131, 9);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  myb3.display();
  myb4.display();
  mybox1.display();
  mybox1.jump();

  myb2.xpos=w03;
  myb2.ypos=height*0.55;
  myb2.w=width*0.05;
  myb2.h=height;
  myb1.h=height;
  myb1.xpos=w04;

  myb1.ypos=height*0.65;
  myb1.w=width*0.05;
  myb3.h=height;
  myb3.xpos=w075;
  mybox1.incw=width*0.04;
  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level26() {
  myb1.c=color(136, 131, 9);
  myb2.c=color(136, 131, 9);
  myb3.c=color(136, 131, 9);
  myb4.c=color(136, 131, 9);
  myb1.display();
  rect(0, h07, width, height);
  // myb2.display();
  myb3.display();
  //myb4.display();
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  myb2.xpos=w03;
  myb2.ypos=height*0.55;
  myb2.w=width*0.05;
  myb2.h=height;
  myb1.h=height;
  myb1.xpos=w05;

  myb1.ypos=height*0.65;
  myb1.w=width*0.05;
  myb3.h=height;
  // myb3.xpos=w085;

  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level27() {

  rect(0, h07, width, height); 
  mybox1.display();
  mb1.xpos=w025;
  mybox1.jump();
  mb2.display();
  myxb1.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level28() {
  mb1.c=color(121, 14, 172);
  mb2.c=color(121, 14, 172);
  rect(0, h07, width, height); 
  mybox1.display();
  mb1.xpos=w02;
  mb1.ypos=h055;
  mybox1.jump();
  mb2.display();
  myxb1.display();
  myxb2.xpos=w08;
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level29() {
  mb1.c=color(55, 55, 122);
  mb2.c=color(55, 55, 122);
  rect(0, h07, width, height); 
  mybox1.display();
  mb1.xpos=w025;
  mb1.ypos=w055;
  mybox1.jump();
  mb2.display();
  myxb1.display();
  myxb1.xpos=w03;
  myxb2.xpos=w075;
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level30() {
  myb1.c=color(131, 131, 19);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb1.h=height;
  myb1.xpos=w045;
  mybox1.incw=width*0.04;
  myb1.ypos=h065;
  myb1.w=width*0.2;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level31() {
  fill(145, 55, 55);
  rect(0, h07, width, height);
  mb3.w=w002;
  mb3.display(); 
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myb1.xpos=w03;
  myb2.ypos=myb1.ypos;
  myb3.ypos=myb1.ypos;
  myb1.h=height;
  myb1.w=myb2.w;
  myb2.h=height;
  myb3.h=height;
  myb1.xpos=w025;
  myb2.xpos=w055;
  myb3.xpos=w085;
  myb1.display();
  myb2.display();
  myb3.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level32() {
  fill(145, 255, 57);
  myb1.c=color(145, 255, 57);
  rect(0, h07, width, height);
  schalter1.display();
  mybox1.display();
  mybox1.jump();
  if (schalter1.on==true) {
  } 
  else {
    myb1.xpos=w065;
    myb1.ypos=0;
    myb1.h=height;
    myb1.display();
  }
  if (mybox1.xx>width) {
    weiter();
  }
}
void level33() {
  fill(15, 255, 157);
  myb1.c=color(15, 255, 157);
  rect(0, h07, width, height);
  schalter1.xpos=w035;
  schalter1.display();
  mybox1.display();
  mybox1.jump();
  if (schalter1.on==true) {
    myb1.display();
    myb1.xpos=w07;
    myb1.ypos=h055;
  }


  if (mybox1.xx>width) {
    weiter();
  }
}
void level34() {
  fill(155, 255, 157);
  myb1.c=color(155, 255, 157);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  mb1.w=width*0.02;
  mb1.ypos=h06;
  mb1.h=height;
  mb1.display();

  if (mybox1.xx>width) {
    weiter();
  }
}
void level35() {
  fill(57, 255, 157);
  myb1.c=color(57, 255, 157);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  mb3.w=width*0.02;
  mb3.ypos=h06;
  mb3.h=height;
  mb3.display();

  if (mybox1.xx>width) {
    weiter();
  }
}
void level36() {
  fill(37, 255, 157);
  myb1.c=color(37, 255, 157);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  mb3.w=width*0.02;
  mb3.ypos=h06;
  mb3.h=height;
  mb3.display();

  if (mybox1.xx>width) {
    weiter();
  }
}
void level37() {
  myb1.c=color(111, 231, 91);
  myb2.c=color(111, 231, 91);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=w04;
  myb2.ypos=height*0.55;
  myb2.w=width*0.08;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=w05;
  mybox1.incw=width*0.035;
  myb1.ypos=height*0.65;
  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}

void level38() {
  myb1.c=color(119, 137, 19);
  myb2.c=color(191, 137, 19);
  myb1.display();
  rect(0, h07, width, height);
  myb2.display();
  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb2.xpos=w02;
  myb2.ypos=height*0.4;
  myb2.w=width*0.25;
  myb2.h=width*0.02;
  myb1.h=height;
  myb1.xpos=width*0.5;
  mybox1.incw=width*0.031;
  myb1.ypos=height*0.66;
  myb1.w=width*0.25;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level39() {
  myb1.c=color(123, 13, 191);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb1.h=height;
  myb1.xpos=width*0.5;
  mybox1.incw=width*0.031;
  myb1.ypos=height*0.65;
  myb1.w=width*0.25;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level40() {
  myxb1.c=color(131, 122, 98);
  myxb2.c=color(131, 122, 98);
  rect(0, h07, width, height);
  myxb1.xpos=w04;
  myxb2.xpos=w075;
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myxb1.display();
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level41() {
  mb1.c=color(12, 156, 123);


  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb2.display();
  myb1.h=height;
  myb1.xpos=w07;
  myb1.xpos=width*0.3;
  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.04;
  myb2.ypos=height*0.6 ;
  myb2.xpos=w08;
  myb1.w=width*0.05;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level42() {
  mb1.c=color(134, 176, 123);
  rect(0, h07, width, height);
  schalter1.display();
  schalter1.xpos=w03;
  schalter2.display(); 
  mybox1.display();
  mybox1.jump();
  if (schalter1.on==true) {
    bonus1.xpos=w055;
    bonus1.display();
  }
  if (schalter2.on==true) {
    myb1.xpos=w09;
    myb1.ypos=0;
    myb1.h=height;

    myb1.display();
  }
  if (mybox1.xx>width) {
    weiter();
  }
}
void level43() {
  mb1.c=color(234, 136, 23);
  rect(0, h07, width, height);
  schalter1.display();
  schalter1.xpos=w04;
  schalter1.xpos=w065;
  schalter2.display(); 
  mybox1.display();
  mybox1.jump();
  if (schalter1.on==true) {
  }
  else {   
    myb1.xpos=w09;
    myb1.ypos=h055;
    myb1.h=height;

    myb1.display();
  }
  if (schalter2.on==true) {
    myb1.xpos=w09;
    myb1.ypos=h055;
    myb1.h=height;

    myb1.display();
  }
  if (mybox1.xx>width) {
    weiter();
  }
}
void level44() {
  rect(0, h07, width, height);
  schalter1.xpos=w03;
  schalter1.display();
  if (schalter1.on==true) {
    mb3.velocity=width*0.002;
    mb3.h=height;
    mb3.display();
  }
  mybox1.display();
  mybox1.jump();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level45() {
  myxb1.c=color(231, 172, 98);
  myxb2.c=color(231, 172, 98);
  rect(0, h07, width, height);
  myxb1.xpos=w03;
  myxb2.xpos=w08;
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myxb1.display();
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level46() {
  myxb1.c=color(34, 22, 98);
  myxb2.c=color(34, 22, 98);
  rect(0, h07, width, height);
  myxb1.xpos=w02;
  myxb2.xpos=w06;
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myxb1.display();
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level47() {
  mb1.c=color(214, 123, 111);

  fill(214, 123, 111);
  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();


  mybox1.incw=width*0.04;
  myb3.ypos=height*0.6 ;

  myb1.w=width*0.05;
  bonus2.ypos=h05;
  bonus2.display();
  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level48() {
  fill( 14, 123, 11);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  myb1.xpos=w05;
  myb1.ypos=h055;
  myb1.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level49() {

  fill( 124, 23, 131);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  myb1.xpos=w03;
  myb1.ypos=h055;
  myb1.display();
  myb2.xpos=w05;
  myb2.ypos=h055;
  myb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level50() {
  mb1.c=color(163, 161, 63);

  fill(163, 161, 63);
  rect(0, h07, width, height);
  mb1.display();
  mybox1.display();
  mybox1.jump();
  myb1.display();
  myb2.display();
  myb1.h=height;
  myb1.xpos=w07;
  myb1.xpos=width*0.5;
  myb1.ypos=height*0.65;
  myb1.w=width*0.03;

  mybox1.incw=width*0.035;
  myb2.ypos=height*0.6 ;
  myb2.xpos=w075;
  myb1.w=width*0.03;
  mb1.velocity=width*0.003;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level51() {
  mb1.c=color ( 63, 11, 63);

  fill( 63, 11, 63);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();

  myb1.h=height;
  xposi=myb1.xpos;

  yposi=myb1.ypos;
  xxi=mybox1.xx;
  yy2i=mybox1.yy2;
  mybox1.incw=width*0.04;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level52() {
  mb1.c=color(121, 143, 122);
  mb2.c=color(121, 143, 122);
  rect(0, h07, width, height); 
  mybox1.display();
  mb1.xpos=w025;
  mb1.ypos=w055;
  mybox1.jump();
  mb2.display();
  myxb1.display();
  myxb2.xpos=w075;
  myxb2.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level53() {
  fill(37, 255, 157);
  myb1.c=color(37, 255, 157);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  mb3.w=width*0.07;
  mb3.ypos=h06;
  mb3.h=height;
  mb3.display();

  if (mybox1.xx>width) {
    weiter();
  }
}
void level54() {
  fill(27, 225, 157);
  myb1.c=color(27, 225, 157);
  rect(0, h07, width, height);
  mybox1.display();
  mybox1.jump();
  mybox1.incw=width*0.04;
  mb3.w=width*0.1;
  mb3.ypos=h06;
  mb3.h=height;
  mb3.display();

  if (mybox1.xx>width) {
    weiter();
  }
}
void level55() {
  fill(200, 200, 200);
  rect(0, h07, width, height);
  schalter1.xpos=w07;
  schalter1.display();
  if (schalter1.on==true) {
    mb3.velocity=width*0.006;
    mb3.h=height;
    mb3.display();
    mb3.xpos=w05;
  }
  mybox1.display();
  mybox1.jump();
  if (mybox1.xx>width) {
    weiter();
  }
}

void level56() {

  fill(222, 222, 200);
  rect(0, h07, width, height);
  schalter1.xpos=w04;
  schalter1.display();
  if (schalter1.on==true) {
    mb3.velocity=width*0.002;
    mb3.h=height;
    mb3.display();
    mb3.xpos=w05;
  }
  mybox1.display();
  mybox1.jump();
  if (mybox1.xx>width) {
    weiter();
  }
} 
void level57() {
  fill(112, 112, 100);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb1.h=height;
  xposi=myb1.xpos;
  xh=myb1.h;
  yposi=myb1.ypos;
  xxi=mybox1.xx;
  yy2i=mybox1.yy2;
  mybox1.incw=width*0.04;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level58() {
   fill(1 , 155, 155);
  rect(0, h07, width, height);
  mb3.w=w002;
  mb3.display(); 
  mybox1.incw=width*0.04;
  mybox1.display();
  mybox1.jump();
  myb1.xpos=w03;
  myb2.ypos=myb1.ypos;
  myb3.ypos=myb1.ypos;
  myb1.h=height;
  myb1.w=myb2.w;
  myb2.h=height;
  myb3.h=height;
  myb1.xpos=w03;
  myb2.xpos=w06;
  myb3.xpos=w09;
  myb1.display();
  myb2.display();
  myb3.display();
  if (mybox1.xx>width) {
    weiter();
  }
}
void level59() {
   myb1.c=color(122, 122, 122);
  myb1.display();
  rect(0, h07, width, height);

  mybox1.display();
  mybox1.jump();
  xw=myb1.w;
  myb1.h=height;
  myb1.xpos=w03;
  mybox1.incw=width*0.04;
  myb1.ypos=h065;
  myb1.w=width*0.2;

  ///Go to the next level
  if (mybox1.xx>width) {
    weiter();
  }
}
void level60() {
   myb1.c=color(122, 122, 122);
  myb1.display();
  rect(0, h07, width, height);
  mb1.ypos=h05;
  mb1.display();

  mybox1.display();
  mybox1.jump();
  
  
  
   if (mybox1.xx>width) {
    weiter();
  }
}
void level61() {
     
}
void level62() {
}
void level63() {
}
void level64() {
}
void level65() {
}
void level66() {
}
void level67() {
}
void level68() {
}
void level69() {
}

void level100() {
  text("The End!\nMore levels will\ncome soon!", width*0.3, height*0.5);
}



