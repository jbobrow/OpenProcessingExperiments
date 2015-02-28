
int x=0;

void setup()

  {
  size(500,350);

  stroke(255);
  }
  


void draw()
  {
    background(0);    
  x=x+1;
  
  if (x>600){x=0;}

  ellipse(x,100,50,50);
  fill(190,150,0);
  line (500,300,0,300);
     {
     stroke (190,150,0);
     strokeWeight(6);
     point(mouseX, mouseY);
     }
    

     }
  


