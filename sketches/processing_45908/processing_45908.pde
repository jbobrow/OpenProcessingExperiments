
float vy=0;
float vx=2;
float x=10;
float y=200;
float frictiony=-.6;
float frictionx=.998;
float frictionx1=.88;
float frictiony1=-.9;
float gravity=.04;
float gravity1=.08;
float vx1=4;
float vy1=1;

void setup(){
  background(255);
  size(800,600);
  smooth();
}

void draw(){
  //the large red ball
  vy += gravity; //vy = vy+ gravity
  vx *= frictionx; //vx = vx* frictionx
  x += vx;
  y += vy;
  if(y>height){
    y = height;
    vy *= frictiony;
  }
  if(x>width){
    x=width;
    vx*=frictiony;
  }
  ellipse(x,y,100,100);
  fill(255,0,0);
 //top ball that creates cylinders that relate with the boucnies and
// the distance of the bouncing area. 
  vy1 += gravity1;
  vx1 *= frictionx1;
  x+= vx1;
  y+=vy1;
  if(y>height){
    y=height;
    vy1 *= frictiony1;
  }
  if (x>width){
    x=width;
    vx1 *= frictiony1;
  }
  ellipse(x,vy1,35,35);
  
}
  
void mousePressed(){
  vy -= 5;

}


