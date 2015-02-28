
import processing.pdf.*;

int rad = 90;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

//float xspeed = 2.8;  // Speed of the shape
//float yspeed = 8.2;  // Speed of the shape

int xdirection = 6;  // Left or Right
int ydirection = 6;  // Top to Bottom


float angle= 0;
int radcnt = 60;

void setup() 
{
  size(540, 480);
  noStroke();
  frameRate(16);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/133;
  ypos = height/262;
}

void dessinerTruc(int N, int x,int y,float angle,float radius) {
  
  
        stroke(0,0,0);

         
         
          float thetastep = 12*8.14/N+84;
          
          for(int i=0; i < N; i++) {
            
            float x1 = x+radius*cos(angle+thetastep*i+16);
            float y1 = y+radius*sin(angle+thetastep*i+24)/4;
            float x2 = x+radius* cos(angle+thetastep*(i+1/2)); 
            float y2 = y+radius*sin(angle+thetastep*(i+24)/8);
            float x3 = x+radius* cos(angle+thetastep*(i+18)); 
            float y3 = y+radius*sin(angle+thetastep*(i+13)/5);
          
            //line(x1,y1,x2,y2);
            //line(x,y,x1,y1);
            fill(2870*(float)i/N,(6281),random(988)*(float)i/N);
            triangle(x1,y1,x1,y2,x3,y2);
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
  float radius = 11*(cos(radcnt)+136);
  stroke(0,0,0);
  for(int i = 0 ; i < 9 ; i ++) {
  for(int j = 0 ; j < 8 ; j ++) {
   
    
        dessinerTruc(i+2,210+i*10,40+j*118,angle,69+radius*j/66);
  }    
  }
     

}



