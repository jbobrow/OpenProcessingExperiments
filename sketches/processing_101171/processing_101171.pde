
/******************************************************************************
   Microscope   By  G.Barbarov Rostan     gbarbarov(at)gmail.com    June 2013 
 ******************************************************************************/ 
// javascript version

int spermNum = 100;
final int sizeX=200;
final int sizeY=200;

Sperm[] spermList = new Sperm[spermNum]; 
 
class Sperm {  
  float x = 0;
  float y = 0;
  float a = 0;
  float v = 0;
  float z = 0;
  float ar =0; 
  float ar2 =0;  
  float ar3 =0;
  float nx =0;
  float ny =0;
  float nx2=0;
  float ny2=0;
  float nx3=0;
  float ny3=0;
  float t = 0; 
   
  //Constructor class
  Sperm() {
   a = random(250,255); //  level color  
   v = random(0.001,0.00400); //speed
   z = random(2,3); // size
   ar = 0;
   ar2 =0;
   ar3= 0;
   nx = 0;
   ny = 0;
   nx2 = 0;
   ny2 = 0;
   nx3 = 0;
   ny3 = 0;
   t=0;   
  };
   
  //Sperm paint
  void paint() {   
    float arctang;
    
    //brownian move + pointer speed vector
    x+= random(-2,2)-(x-(pmouseX))*v;
    y+= random(-2,2)-(y-(pmouseY))*v;   
    
    //Head     
    fill(a,a,a,250);    
    stroke(250);   
    ellipse(x,y,z,z);
    
    //Tail nodes move   
    ar3=ar2*1.2; 
    ar2=ar*1.1;    
    ar =(0.4)* cos(t);    
    t+=v*10+random(0.2,0.4);
      
    arctang=atan2(y-pmouseY,x-pmouseX);
    nx=8*cos(ar+arctang);
    ny=8*sin(ar+arctang);
    nx2=18*cos(ar2+arctang);
    ny2=18*sin(ar2+arctang);
    nx3=28*cos(ar3+arctang);
    ny3=28*sin(ar3+arctang);
    
    stroke(a,140);
    line(x,y,x+nx,y+ny);
    stroke(a,110);
    line(x+nx,y+ny,x+nx2,y+ny2);
    stroke(a,90);
    line(x+nx2,y+ny2,x+nx3,y+ny3);    
  };
};  //end Sperm class 
 
 
void setup() {
  size(sizeX,sizeY);
  background(255,180,200);
  smooth(); 
      
  //Create the sperm  
  for (int i=0; i<spermNum; i++){    
    Sperm new_sp = new Sperm();    
    spermList[i] = new_sp;     
    //put to the center of view
    new_sp.x =sizeX/2+random(0,sizeX*0.75)*cos(random(0,2*PI));
    new_sp.y =sizeY/2+random(0,sizeX*0.75)*sin(random(0,2*PI));   
  };
  
  // The winner :-) speed x 8
  spermList[0].v *= 8;
};
 
void draw() {  
  background(220,220,228);
  strokeWeight(1);     
  for (int i=0; i<spermNum; i++) {
     spermList[i].paint();
  };
    
   fill(200,200,218,0);
   strokeWeight(sizeX*0.75);
   stroke(0);   
   ellipse(sizeX/2,sizeY/2,sizeX*1.70,sizeX*1.70);
  
};




