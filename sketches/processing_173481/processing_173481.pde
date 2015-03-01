
/*
project made by
Adriano Parracciani

interactive gears

click on the colored circles 
inside the Rotation Color panel, 
for changing rotation direction 
of respective gears

*/


void setup() {
size(500,500);
stroke(#CD853F);
frameRate(10);

}

//define variables

int x=250;
int y=200;

int flip1=1;
int flip2=1;
int flip3=1;


int radius=160; //radius of big gears
int radius2=80; //radius of medium gears
int radius3=40; //radius of little gears

//define angle
float angle=1;
float angle2=1;
float angle3=1;

float angle1a=180;
float angle2a=180;
float angle3a=180;

float angle1b=90;
float angle2b=90;
float angle3b=90;

float angle1c=270;
float angle2c=270;
float angle3c=270;

//define increment for each angle
float step1=1.0;
float step2=5.0;
float step3=15.0;

//stroke weight variable
int w=1;

//define RGB colors
int R;
int G;
int B;


void draw() {
  smooth();
  background(50);
  strokeWeight(10); 
  point(x,y);   
 
 //ROTATION CONTROL PANEL
 
 strokeWeight(5);
 stroke(255);
  line(100,418, 400, 420);
  line(100,420, 100, 480);
  line(200,420, 200, 480);
  line(300,420, 300, 480);
  line(400,420, 400, 480);
  line(100,482, 400, 482);
  textSize(14);
  fill(255);
  text("Rotation Control", 195, 410);

//big gears

  w=30; //strokeWeight
  R=202; //RGB COLOR
  G=124;
  B=60;
  strokeWeight(30); 
  stroke(R,G,B);
  point (150,450);
  //call "gears" function
  gears(x,y,angle,w,radius,R,G,B);
  gears(x,y,angle1a,w,radius,R,G,B);
  gears(x,y,angle1b,w,radius,R,G,B);
  gears(x,y,angle1c,w,radius,R,G,B);
  
 //medium gears 
 
   w=20;
   R=138;
   G=170;
   B=199;
   strokeWeight(30); 
    stroke(R,G,B);
    point (250,450);
    
  gears(x,y,angle2,w,radius2,R,G,B);
  gears(x,y,angle2a,w,radius2,R,G,B);
  gears(x,y,angle2b,w,radius2,R,G,B);
  gears(x,y,angle2c,w,radius2,R,G,B);
  
   //little gears 
   
  w=10;
  R=113;
  G=219;
  B=23;
  strokeWeight(30); 
   stroke(R,G,B);
   point (350,450);
  
  gears(x,y,angle3,w,radius3,R,G,B);
  gears(x,y,angle3a,w,radius3,R,G,B);
  gears(x,y,angle3b,w,radius3,R,G,B);
  gears(x,y,angle3c,w,radius3,R,G,B);
 
  //increase the angles
  angle=angle+step1;
  angle1a=angle1a+step1;
  angle1b=angle1b+step1;
  angle1c=angle1c+step1;

  angle2=angle2+step2;
  angle2a=angle2a+step2;
  angle2b=angle2b+step2;
  angle2c=angle2c+step2;


  angle3=angle3+step3;
  angle3a=angle3a+step3;
  angle3b=angle3b+step3;
  angle3c=angle3c+step3;
  

}

// the "gears" functions
void gears(float x1, float y1, float angle, int w, float rad, int R, int G, int B) {

 float ty=rad*sin(radians(angle));
 float tx=rad*cos(radians(angle));
 float TX=x1+tx;
 float TY=y1+ty;
  strokeWeight(w);
  stroke(R,G,B);
  point(TX,TY);
  strokeWeight(1);
  line(x1,y1,TX,TY);
  
   stroke(R,G,B,80);
   noFill();
   ellipse(TX,TY,w*1.50,w*1.50);
   
   }
   
   // changing rotation based on MOUSE pressed

   void mousePressed() {
     
        if ((mouseX >135) && (mouseX<165) && (mouseY>435) && (mouseY<465)) {
          if (flip1==0){
            step1=1;
            flip1=1;
          } else {
            step1=-1;
            flip1=0;
          }
        }
          
          if ((mouseX >235) && (mouseX<265) && (mouseY>435) && (mouseY<465)) {
          if (flip2==0){
            step2=5;
            flip2=1;
          } else {
            step2=-5;
            flip2=0;
          }
          }
          
            if ((mouseX >335) && (mouseX<365) && (mouseY>435) && (mouseY<465)) {
          if (flip3==0){
            step3=15;
            flip3=1;
          } else {
            step3=-15;
            flip3=0;
          }
            }
     }
   
   
