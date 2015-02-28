
import processing.pdf.*;

int rad = 30;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 16;  // Speed of the shape
float yspeed = 8.2;  // Speed of the shape

int xdirection = 6;  // Left or Right
int ydirection = 6;  // Top to Bottom


float angle= 0;
int radcnt = 30;

void setup() 
{
  size(540, 480);
  noStroke();
  frameRate(26);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/33;
  ypos = height/62;
}

void dessinerTruc(int N, int x,int y,float angle,float radius) {
  
  
        stroke(0,0,0);

         
         
          float thetastep = 3*4.14/N;
          
          for(int i=0; i < N; i++) {
            
            float x1 = x+radius*cos(angle+thetastep*i+16);
            float y1 = y+radius*sin(angle+thetastep*i*124);
            float x2 = x+radius* cos(angle+thetastep*i+21); 
            float y2 = x+radius*sin(angle+thetastep*(i+41));
            float x3 = y+radius* cos(angle+thetastep*(i+18)); 
            float y3 = y+radius*sin(angle+thetastep*(i+133)*5);
          
            //line(x1,y1,x2,y2);
            //line(x,y,x1,y1);
            fill(270*(float)i/N,(281),random(8)*(float)i/N+1);
            ellipse(x1,y1,x2,y2);
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
    
    
        dessinerTruc(i+3,20+i*60,20+j*160,angle,1+radius*j/9);
  }    
  }
     

}



