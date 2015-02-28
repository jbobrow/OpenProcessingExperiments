
PImage img;
Gum[]balls=new Gum[10];// an array for the gumballs so that I can call more than one at a time 
 
void setup(){
  background(255);
  img=loadImage("gumball2.jpg");// bacground 
  size(612,792);
  
  smooth();
  for(int i=0; i<balls.length;i++){
    balls[i]=new Gum();
  }

}
 
void draw(){
 
  noStroke();
  image(img,0,0);

 for(int i=0; i<balls.length;i++){//four loop where things are initalized 
  balls[i].move();
  balls[i].display();
  }
 
 
 if(mousePressed) {
 setup();
 
 }
 

  
 
}


class Gum{

float x;
float dir = random(-3,3);
float y;
float ydir = random(1,5);
float sizer=55;

float r,g,b;//color control 
//float speed=.1; 

Gum(){
  r=random(255);
  g=random(255);
  b=random(255);
  
  x=(width/2)+8; //where the gumballs start (near the machine opening )(the width)
  y=(height/2)+225; //where the gumballs start (near the machine opening )(the height)
  
}
void move(){
   x = x + dir; //the direction itself plus the width 
 
 if(dist(mouseX,mouseY,x,y)<sizer){// allows the balls to move when the mouse hovers over it 
  dir = random(-20,20);

}
 
if(x >= width){// if x is greater than the width then these things apply 
  dir = random(-15);
  r = random(255);
  g = random(255);
  b = random(255);
  
}
   
if(x <= 1){// if x is less than the width then these things apply 
  dir = random(15);
  r =random(255) ;
  g =random(255) ;
  b =random(255) ;
}
 
 
y= y + ydir; //the direction itself plus the height
   
if(y >= height){
  ydir =random(-10);
 
}
   
if(y <= 0){// if y is less than the 0 then this applies 
  ydir = random(10);
  
}
}
void display(){
  
fill(r,g,b); 
ellipse(x, y, sizer,sizer);

}
}




