
Circle circle1,circle2;

void setup(){
  
    size(600,600);
     circle1 =new Circle(300,10,100);
     circle2 =new Circle(250,112,100);

   
  
}

void draw(){
  circle1.display();
    circle1.move();

  
}
void mouseClicked(){
}






//object
class Circle {
 
  //DATA
  float x,y,circleSize;

  float vy=0;
  float vx =7;
  int directionX = 1;
  int directionY = 1;
  float frictiony =-.7;
  float frictionx=.998;
  float gravity =.05;
  
  //constructor
  
  Circle(float xpos, float ypos, float cSize){
    x=xpos;
    y=ypos;
    circleSize=cSize;
    
  }
 
 
 void display(){
   ellipse(x,y,circleSize,circleSize);
 }
 
 void move(){
   y+=directionY;
    
    vy+=gravity; 
    vx*= frictionx;
    y+=vy;

  if(y>height){
    y=height;
    vy*=frictiony;
  }
   
if(x>width){
  x=width;
  vx*=frictiony;
}

if(x>width){
  x=width;
  vx*=frictiony;
}

ellipse(x,y,12,12);
}

void mousePressed(){
  vy-= 2;
}
 }
  
  

