
PImage dog;
float x=-50;
float y=-50;
float vx=2;
float vy=4;
void setup(){
  size(400,300);
  dog=loadImage("beasley.jpg"); 
}

void draw(){
    rect(0,0,width,height);
    image(dog,x,y,50,50);
    x+=vx;
    if(x>width)x=-50;
    y+=vy;
    if(y>height)y=-50;    
}


