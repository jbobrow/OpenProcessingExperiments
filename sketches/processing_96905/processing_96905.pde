
int x1, x2, x3, y1, y2,y3;


int x= 10;
int y= 50;
int z= 70;
int m=20;


void setup(){
  
  frameRate(15);
  size (600,300);


}

void draw(){
    background (255);
    
    drawtriang(50,120);
  
   
            drawtriang(120,50);
              
}

void drawtriang( int q, int f){
  
strokeWeight (.5);
stroke(0,150);
noFill();
triangle (y,m,x,q,z,f);

x++;
y=y-2;
z=z-2;
m++;

if (x>600) {
  x=width/2;
}
if (y>600) {
  y=height/2;
}
if (y<0) {
  y=height/2;
}
if (z>600) {
  z=width/2;
}
if (z<0) {
  z=height/2;
}
if (m>300) {
  m=height/2;
}
}


