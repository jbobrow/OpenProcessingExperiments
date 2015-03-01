
PImage dog;
float x=-50;
float y=-50;
float vx=2;
float vy=4;
float sz=50;
void setup(){
  size(400,300);
  dog=loadImage("beasley.jpg"); 
}

void draw(){
    rect(0,0,width,height);
    image(dog,x,y,50,50);
    
    x+=vx;
    y+=vy;
    if(x>width-sz){
       vx*=-1;
      x=width-sz; 
    }
    if(x<0){
       vx*=-1;
      x=0; 
    }
     if(y>height-sz){
       vy*=-1;
      y=height-sz; 
    }
    if(y<0){
       vy*=-1;
      y=0; 
    }
  
}


