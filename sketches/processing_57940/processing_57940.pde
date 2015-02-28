
Circle[] circles;
Circle2[] circles2;
Circle3[] circles3;

int mode = 1;

int n;

void setup(){
  size(800,700);
  smooth();
  noStroke();
  
  circles = new Circle[250];
 
  circles2 = new Circle2[500];
   circles3 = new Circle3[2500];
   
  for(int i = 0; i<circles.length; i++){
    circles[i] = new Circle(random(width),random(height));
  }
  for(int i = 0; i<circles2.length; i++){
    circles2[i] = new Circle2(random(width),random(height));
  } 
  for(int i = 0; i<circles3.length; i++){
    circles3[i] = new Circle3(random(width),random(height));
  } 
}

void draw(){
  background(255);
  if (mode==1){
  for(int i=0; i<circles.length;i++){
    
    circles[i].move();
    circles[i].display();
  }
  }
   if (mode==2){
  for(int i=0; i<circles2.length;i++){
    
    circles2[i].move();
    circles2[i].display();
}
}
    if (mode==3){
  for(int i=0; i<circles3.length;i++){
    
    circles3[i].move();
    circles3[i].display();
}
}
}

    
    void keyPressed(){
  if (key =='1'){
    mode = 1;
  } else if(key=='2'){
    mode =2;
  } else if(key=='3'){
    mode=3;
  }
}
    
    
    
class Circle {
  float x,y,speedx,speedy,angle,vy, vx,  x2, y2, frictiony, frictionx, gravity;
 
  
  Circle (float _x, float _y){ //constructor and these numbers
  x=_x;
  y=_y;
  speedx=1;
  speedy=1;
   vy = 0;
  vx = 1;
 
  x2 = 650;
  y2 = 100;
  frictiony = -.9999; //cuts speed by half when hits ground
  frictionx = .9999; //slows horizontal movement
  gravity = 1; 
  }
  //methods
  void move(){

    x+= speedx;
    y+= speedy; 
   vy += gravity;// Pulling down gravity
  vx *= frictionx;
  x += vx;
  y += vy;
  if (y>height){
    y= height;
    vy *= frictiony;
  }
  if (x>width){
    x = -2;
    vx *= frictionx;
  }
    }
  
  void display(){
    fill(129,195,250);
    ellipse(x,y,10,10);
    fill(0);
     text ("1950 - 250,000 Prisoners",300,150);
     text ("1 ball = 1000 prisoners",300,225);
    
  }
 

    }

class Circle2 {
  float x,y,speedx,speedy,angle,vy, vx,  x2, y2, frictiony, frictionx, gravity;
 
  
  Circle2 (float _x, float _y){ //constructor and these numbers
  x=_x;
  y=_y;
  speedx=1;
  speedy=1;
   vy = 0;
  vx = 1;
 
  x2 = 650;
  y2 = 100;
  frictiony = -.9999; //cuts speed by half when hits ground
  frictionx = .9999; //slows horizontal movement
  gravity = 1; 
  }
  //methods
  void move(){

    x+= speedx;
    y+= speedy; 
   vy += gravity;// Pulling down gravity
  vx *= frictionx;
  x += vx;
  y += vy;
  if (y>height){
    y= height;
    vy *= frictiony;
  }
  if (x>width){
    x = -2;
    vx *= frictionx;
  }
    }
  
  void display(){
    fill(255,212,68);
    ellipse(x,y,5,5);
     fill(0);
     text ("1980 - 500,000 Prisoners",300,150);
     text ("1 ball = 1000 prisoners",300,225);
  }
 

    }

class Circle3 {
  float x,y,speedx,speedy,angle,vy, vx,  x2, y2, frictiony, frictionx, gravity;
 
  
  Circle3 (float _x, float _y){ //constructor and these numbers
  x=_x;
  y=_y;
  speedx=1;
  speedy=1;
   vy = 0;
  vx = 1;
 
  x2 = 650;
  y2 = 100;
  frictiony = -.9999; //cuts speed by half when hits ground
  frictionx = .9999; //slows horizontal movement
  gravity = 1; 
  }
  //methods
  void move(){

    x+= speedx;
    y+= speedy; 
   vy += gravity;// Pulling down gravity
  vx *= frictionx;
  x += vx;
  y += vy;
  if (y>height){
    y= height;
    vy *= frictiony;
  }
  if (x>width){
    x = -2;
    vx *= frictionx;
  }
    }
  
  void display(){
    fill(211,0,23);
    ellipse(x,y,5,5);
    fill(0);
    text ("2010 - 2,500,000 Prisoners",300,150);
     text ("1 ball = 1000 prisoners",300,225);
  }
 

    }

