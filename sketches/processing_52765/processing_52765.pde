
PImage spacecat;
float x,y,dX,dY,easing;



void draw(){
  //background(255);
  dX = mouseX - x;
  dY = mouseY - y;
  
  x = x + dX*easing;
  y = y + dY*easing;
  image(spacecat,x,y);
  
}

void setup(){
 //rainbow background
   for(int i=0;i<width;i++){
     float colorValue=map(i,0,width,0,360);
     stroke(colorValue,100,100);
     line(i,0,i,height);
size(800,600);
spacecat= loadImage("spacecat.png");
imageMode(CENTER);
x = 0;
y = 0;
easing = .05;
}
}

