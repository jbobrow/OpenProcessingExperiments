
Mover[] m = new Mover[100];

void setup(){
background(0);
size(640, 480); 
for (int i=0; i<100; i++){
  m[i] = new Mover(int(random(width)), int(random(height)), int(random(7)+1));
}
}
  void draw(){
  fill(0, 0, 0, 0);
  rect(0, 0, width, height);
  for (int i =0; i<100; i++){
    rect(mouseX , mouseY , 10, 10);
    m[i].display();
  }
}

class Mover{
  //DATA
  int x;
  int y;
  int speed;
  
  //CONSTUCTOR    
  Mover(int myx, int myy, int myspeed){
    x=myx;
    y=myy;
    speed= myspeed;
  }
  

   
  //FUNCTION
  void display(){
   if (y<0 || y>height){
     speed = -1*speed; //speed *= -1;
   }

  if (mouseX-x < 75 && mouseX-x > -75 && mouseY-y <75 && mouseY-y > - 75)
  {
    y+=10;
  }

   
   y= y+speed;
   stroke(255, 238, 0 );
   fill(247, 0, 218);
   ellipse(x, y, 15, 50);
  }
 
  
}
  
  

