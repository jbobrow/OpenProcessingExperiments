
/******************************************************************************
 Microscope 1.2 Harlem Shake  By  G.Barbarov Rostan    gbarbarov(at)gmail.com   
 ******************************************************************************
 Coursera: Creative programming  Project 1    working in progress  June 2013
 ******************************************************************************/  
// javascript version

Maxim maxim;
AudioPlayer player;
AudioPlayer player2;

int spermNum = 100;
final int sizeX=200;
final int sizeY=200;
float     mbrown=1.5; //Brownian movement global level


Sperm[] spermList = new Sperm[spermNum];
int mode=0;  //0=ini    //1=target pointer  2= harlem shake 
 
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
  float epx=0; //x target pos
  float epy=0; //y target pos  
   
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
     if (dist(x,y,pmouseX,pmouseY)>30)  //space for ovule
     {
      x+= random(-mbrown,mbrown)-(x-(epx))*v;
      y+= random(-mbrown,mbrown)-(y-(epy))*v;    
     }
     else
     { x+= random(-mbrown,mbrown);
       y+= random(-mbrown,mbrown);   
     };
    
    
    //Head     
    fill(a,a,a,250);    
    stroke(250);   
    ellipse(x,y,z,z);
    
    //Tail nodes move   
    ar3=ar2*1.2; 
    ar2=ar*1.1;    
    ar =(0.4)* cos(t);    
    t+=v*10+random(0.2,0.4);
      
    arctang=atan2(y-epy,x-epx);
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
  //noCursor();  
  size(200,200);
  //size(sizeX,sizeY);
  background(255,180,200);
  smooth(); 
  
  maxim = new Maxim(this);
  player = maxim.loadFile("kids3.wav");
  player.setLooping(true);
  player2 = maxim.loadFile("harlemshake3.wav");
  player2.setLooping(true);
      
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

  //if (mousePressed == true) {
  //  noCursor();
  //} else {
  //  cursor(HAND);
  //}
  
  if (mode==0) {
                player.speed(3);
                player.play();
                mode=1;
                };     
  
  for (int i=0; i<spermNum; i++) {
     if (mode==1) {spermList[i].epx=pmouseX;
                   spermList[i].epy=pmouseY; 
                  };
     spermList[i].paint();
     
      
  };
  
   //ovule 
  // fill(205,200,218,160); 
  // stroke(205,200,218,180);   
  // ellipse(pmouseX,pmouseY,20,20); 
    
   //mask microscope 
   fill(200,200,218,0); 
   strokeWeight(sizeX*0.75);
   stroke(0);   
   ellipse(sizeX/2,sizeY/2,sizeX*1.70,sizeX*1.70);
   //border ,cromatic aberration
   fill(0,0,0,0);
   strokeWeight(1);
   stroke(0,10);   
   ellipse(sizeX/2,sizeY/2,sizeX*0.90,sizeX*0.90);
   stroke(5,0,145,20);   
   ellipse(sizeX/2,sizeY/2,sizeX*0.91,sizeX*0.91);
   stroke(0,50);   
   ellipse(sizeX/2,sizeY/2,sizeX*0.92,sizeX*0.92);
   stroke(0,70);   
   ellipse(sizeX/2,sizeY/2,sizeX*0.93,sizeX*0.93);
   stroke(145,0,0,90);   
   ellipse(sizeX/2,sizeY/2,sizeX*0.94,sizeX*0.94);   
};

void mousePressed ()
  {mode++;
   if (mode>=3) {mode=1;};
   if (mode==1) {player2.stop();
                 player.cue(0);
                 player.play(); //kids sound
                 player.speed(3);
                 mbrown=1.5;
                }
   else if (mode==2) {player.stop();
                      player2.cue(0);
                      player2.play(); // harlem shake
                      player2.speed(1.4); 
                      mbrown=2;
                      for (int i=0; i<spermNum; i++) {
                            spermList[i].epx=sizeX/2+random(0,sizeX*0.75)*cos(random(0,2*PI));
                            spermList[i].epy=sizeX/2+random(0,sizeX*0.75)*sin(random(0,2*PI));
                            };
                     };             
  };



