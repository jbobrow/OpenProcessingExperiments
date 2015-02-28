
zombie[] myz=new zombie[6];
mensch[] mym=new mensch[2];
int level=0;
int time;
int jo;
int wait = 3000;
boolean[] levelcheck;
PShape levelclear;
PShape brain;
PShape mensch11;
PShape mensch12;
PShape zombie11;
PShape zombie12;
PShape zombie21,zombie22,zombie23,zombie24,zombie25;
PShape back1;
int lives=3;
float w01,w005,w02, w03, w04, w05, w06, w07, w08, w09;
float h005,h001,h05,h03,h04,h06,h07;
float off02, off03, off04, off05, off06, off07, off08, off09;

void setup() {
   //size(displayWidth,displayHeight);
    size(800, 480);
   
   time = millis();
  w01=width*0.1;
  w02=width*0.2;
  w03=width*0.3;
  w04=width*0.4;
  w05=width*0.5;
  w06=width*0.6;
  w07=width*0.7;
  w08=width*0.8;
  w09=width*0.9;
  h05=height*0.5;
  h06=height*0.6;
  h07=height*0.7;
  h04=height*0.4;
  h03=height*0.3;
  w005=width*0.05;
  h001=height*0.01;
  h005=height*0.05;
  off02=-height*0.2;
  off03=-height*0.3;
  off04=-height*0.4;
  off05=-height*0.5;
  off06=-height*0.6;
  off07=-height*0.8;
  off09=-height*0.9;
  zombie21=loadShape("cz1.svg");
  zombie22=loadShape("cz2.svg");
  zombie23=loadShape("cz3.svg");
   
  mensch11=loadShape("mensch1-1.svg");
  mensch12=loadShape("mensch1-2.svg");
   
  brain=loadShape("brain.svg");
  back1=loadShape("back1.svg");
  levelclear=loadShape("levelclear.svg");

  myz[0]=new zombie(color(255, 0, 0), -1000, h07, height*0.0000, false); 
  myz[2]=new zombie(color(255, 0, 0), -300, h04, height*0.0001, false); 
  myz[1]=new zombie(color(255, 0, 0), -500, h05, height*0.00025, false); 
  myz[3]=new zombie(color(255, 0, 0), -700, h06, height*0.0003, false);
  myz[4]=new zombie(color(255, 0, 0), -250, h05, height*0.000141 , false);
  myz[5]=new zombie(color(255, 0, 0), -777, h06, height*0.0001, false);
   mym[0]=new mensch(color(255, 0, 0), w07, off08, height*0.0001, false);
  mym[1]=new mensch(color(255, 0, 0), w06, off09, height*0.0003, false);
}



void draw() {
  background(255);
  switch(level){
 case 0:
 level0();
 break;
 case 1:
 level1();
 break;
}
  
  
}
void gamedisplay(){
  if(lives==3){
    shape(brain,w005,h001,w01,w01);
    shape(brain,w005+w01,h001,w01,w01);
      shape(brain,w005+w01+w01,h001,w01,w01);
  }
   if(lives==2){
    shape(brain,w005,h001,w01,w01);
    shape(brain,w005+w01,h001,w01,w01);
     }
     if(lives==1){
    shape(brain,w005,h001,w01,w01);
 
  }
  
  
}
void levelclear(){
  shape(levelclear,w02,h03,w06,w06);
    
    //if(mousePressed==true)level=level+1;
     
}
class zombie { 
  color c;
  float xpos;
  float ypos;
  float yspeed;
  boolean dead;
  int ltime, ctime;
float etime;
int d=0;

  // The Constructor is defined with arguments.
  zombie(color tempC, float tempXpos, float tempYpos, float tempYspeed, boolean dead) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
  }

  void display() {
     if(mousePressed==true && mouseX>=xpos
      && mouseX<=xpos+width/8
      && mouseY>=ypos
      && mouseY<=ypos+width/8
      )dead=true;
    d=d+1;
    if(dead==false){
      if(d<2){
  shape(zombie21, xpos, ypos, width/6, width/6);
      }
      if(d>=2 && d<=4){
        shape(zombie22, xpos, ypos, width/6, width/6);
      }
       if(d>=5 && d<=7){
        shape(zombie23, xpos, ypos, width/6, width/6);
      }
       if(d>=8 && d<=10){
        shape(zombie22, xpos, ypos, width/6, width/6);
      }
      
      if(d==10)d=0;
     // println(d);
    }
  }

  void drive() {
      ctime = millis();
   etime = (ctime - ltime)/1 ;
    ltime = ctime;
    xpos+= yspeed*etime;
    
    
    //ypos = ypos + yspeed;
    if (xpos > width) {
      xpos = 0;
      
     
    }
  }
}
class mensch { 
  color c;
  float xpos;
  float ypos;
  float yspeed;
  boolean dead;
  int ltime, ctime;
float etime;
int d=0;

  // The Constructor is defined with arguments.
  mensch(color tempC, float tempXpos, float tempYpos, float tempYspeed, boolean dead) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempYspeed;
  }

  void display() {
     if(mousePressed==true && mouseX>=xpos
      && mouseX<=xpos+width/8
      && mouseY>=ypos
      && mouseY<=ypos+width/8
      )dead=true;
    d=d+1;
    if(dead==false){
      if(d<4){
  shape(mensch11, xpos, ypos, width/6, width/6);
      }
      if(d>=4){
        shape(mensch12, xpos, ypos, width/6, width/6);
      }
      if(d==9)d=0;
     // println(d);
    }
  }

  void drive() {
      ctime = millis();
   etime = (ctime - ltime)/10 ;
    ltime = ctime;
    ypos+= yspeed*etime;
    
    
    //ypos = ypos + yspeed;
    if (ypos > height) {
      ypos = 0;
      
     
    }
  }
}
  void level0(){
    level=1;
    //if(mousePressed==true && jo==1)level=level+1;
    
  }
  void level1(){
     shape(back1, 0, 0, width, height);
  gamedisplay();
  for (int i=0;i<6;i++) {
    myz[i].display();
    myz[i].drive();
  }
    for (int i=0;i<2;i++) {
    mym[i].display();
    mym[i].drive();
  }
 
  if(myz[0].dead==true
  &&myz;[1].dead==true
  &&myz;[2].dead==true
  &&myz;[3].dead==true
  &&myz;[4].dead==true
  &&myz;[5].dead==true)levelclear();
    
  }


