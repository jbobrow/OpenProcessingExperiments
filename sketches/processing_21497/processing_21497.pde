
//variables for position
float x= 200; 
float y= 200;

float x1 = 200;
float y1 = 200;

//variables for speed
float speed = 30;
float speed1 =15;
float speed2 =11;
void setup () {
  size (400,400);
  smooth ();
  frameRate (15);
}

void draw (){
  //background (50);
  fill (50,20); 
  rect (0,0,400,400);
  
  // color
fill (3,247,223);
noStroke ();

ellipse (x,y,random(40,50),50);
ellipse (width/2,height/2,random(40,50),50);
ellipse (x1,y1,random(40,50),50);
//moveeeee
y = y+speed;

if ((y>height-25) || (y<25)) {
  speed = speed *-1;
}
 x1=x1+speed;


if ((x1>width-25) || (x1<25)) {
 speed1 = speed1 *-1; 

 }
 
 y1=y1+speed1;
 if ((y1<width-20) || (y1>=25)) {
 speed2 = speed2 *-1; 



 }
}
                
                
