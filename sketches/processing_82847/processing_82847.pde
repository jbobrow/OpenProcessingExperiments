
//Final 1
//In class Physics demonstration; 2 bouncing balls.
//alexander werdmuller von elgg

float x;
float y;
float vx;
float vy;
float fx;
float fy;
float g;

void setup(){
size(800,800);
x = 0;
y = 0;
vx = 1;
vy = .5;
g = 1;
fx = .9918;
fy = -.5;

smooth();

colorMode(HSB,300,50,100,50);
background(150,20,50,100);
}

void draw (){
 background(50,50,50,100);
  x+=vx;
  y+=vy;
  vx*=fx;
  vy+=g;
  

  ellipse(x,y,100,100);
  
  
  if(y>height-50){
   
    y=height-50;
    vy*=fy;
    }
  
  if(x>80){
    vy+=2;
    vx+=0;
    }
    
    ellipse(vx,y,100,100);
    if(y>height-50){
   
    y=height-50;
    vy*=fy;
    }
  
  if(x>80){
    vy+=2;
    vx+=0;
    }
  
}
