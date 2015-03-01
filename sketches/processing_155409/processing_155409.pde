
Mover[] m = new Mover[100];//empty array of 100 Mover object



void setup(){
  size(640,480);
  background(0);
  for(int i=0;i<100;i++){
    m[i] = new Mover(int(random(width)), int(random(height)), int(random(7)+1));
  }
}


void draw(){
 fill(0,0,0,75); 
 rect(0,0,640,480);
  
  for(int i=0;i<100;i++){
    m[i].display();
  }
  
  
}

class Mover {
  //DATA 
 int x;
 int y;
 int speed;
 
  
  //CONSTRUCTOR
  
  Mover(int myx, int myy, int myspeed){
  x= myx;
  y= myy;
  speed= myspeed;
     
  }
  //FUNCTION(S)
  void display(){
   if(x<0 || x>width){
    speed = -1*speed; //speed *= -1
   } 
  
  if (mouseX-x<100 && mouseX-x>-100 && mouseY-y<100 && mouseY-y>-100);{
   y = y+10;
    
  }
  if(y>height){
    y=0;
  }
  
  x  = x+speed;
  noStroke();  
  fill(0,100,100);
  ellipse(x, y, 10,10);
  triangle(x-5,y,x+5,y,x,y-25);
 }
  
  
}

