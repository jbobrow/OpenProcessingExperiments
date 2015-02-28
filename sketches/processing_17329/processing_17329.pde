
int xpos = 200;
int ypos = 300;

void setup() 

{
  size(400, 400);
  background(0);
}

void draw () {

  for (int j=0; j<480; j=j+50) {
    for (int i = 0; i<480; i=i+50) {
      xpos = i;
      ypos = j;
    
    stroke(255);
      fill(mouseY,ypos,255,100);
      triangle(ypos,xpos,xpos-20,ypos-20,xpos-40,ypos-40);  
      
      stroke(255);
      stroke(0);
      fill(xpos,mouseX,255);
      ellipse(xpos,ypos,20,20);
      
      
    }
  }
}

