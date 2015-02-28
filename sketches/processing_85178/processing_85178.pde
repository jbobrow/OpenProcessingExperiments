
import processing.pdf.*;

int rad = 60;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


float angle= 0;
int radcnt = 0;

void setup() 
{
  size(540, 480);
  noStroke();
  frameRate(20);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}

void dessinerTruc(int N, int x,int y,float angle,float radius) {
  
  
        stroke(0,0,0);

         
         
          float thetastep = 2*3.14/N;
          
          for(int i=0; i < N; i++) {
            
            float x1 = x+radius*cos(angle+thetastep*i);
            float y1 = y+radius*sin(angle+thetastep*i);
            float x2 = x+radius* cos(angle+thetastep*(i+1)); 
            float y2 = y+radius*sin(angle+thetastep*(i+1));
            float x3 = x+radius* cos(angle+thetastep*(i+2)); 
            float y3 = y+radius*sin(angle+thetastep*(i+2));
          
            //line(x1,y1,x2,y2);
            //line(x,y,x1,y1);
            fill(255,255,255);
            //fill(255*(float)i/N,255,random(255));
            triangle(x1,y1,x2,y2,x,y);
          }
     
  
}


void draw() 
{
  background(255,255,255);
  angle+=0.1;
  if(angle>2*3.14) {
     angle=0; 
  }
  radcnt++;
  float radius = 11*(cos(radcnt)+5);
  stroke(0,0,0);
  for(int i = 0 ; i < 9 ; i ++) {
  for(int j = 0 ; j < 8 ; j ++) {
    
    
        dessinerTruc(i+3,20+i*60,20+j*60,angle,9+radius*j/19);
  }    
  }
     

}



