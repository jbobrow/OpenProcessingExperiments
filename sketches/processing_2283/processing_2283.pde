
float x;
float y;
int dragX, dragY;
float radius = 50.0;
float velocity =5.0;
float friction =.98;
float acceleration = .98;

void setup(){
  size(400,400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}



void draw(){
  fill(0,88);
  rect(0,0,400,400);
  fill(185);
  ellipse(x,y,radius,radius);
  if(mousePressed == true){
    x=mouseX;
    y=mouseY;
  }else {
velocity*=friction;  
velocity+=acceleration;
  
y+=velocity;
    if(y>(height-radius)){
    y=height - radius;
    velocity=-velocity;
    
  }
   
}
}




    

