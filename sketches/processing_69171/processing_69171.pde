
int x;
int y;

void setup(){
  
  size (500,500);
  smooth();
  noFill(); 
  background(255);//de 0 a 255 escala de grises
  x=25;
  y=25;
frameRate(15);
  }
  
  void draw(){
    background(255);
    
   
  fill(125);
   stroke(125);
    rect(x+100,y-10,25,25);
    x=x+1;
    y=y+1;
   
   fill(0,0,255);
   triangle(x+37,y-15,x,y,x+100,y);
   
    fill(125);
    stroke(125);
    rect(x,y,100,50);
    x=x+1;
    y=y+1;
   
    fill(0);
    ellipse(x+25,y+50,25,25);
     x=x+1;
     y=y+1;
    
      fill(0);
    ellipse(x+50,y+50,25,25);
      x=x+1;
      y=y+1;
    
      fill(0);
    ellipse(x+75,y+50,25,25);
     x=x+1;
     y=y+1;
    
    
    }

