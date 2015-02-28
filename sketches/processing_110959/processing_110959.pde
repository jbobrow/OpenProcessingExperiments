
void setup()
{
  size(400, 400);
  noStroke();
  background(255);
frameRate(600);
  
  
}

void draw()
{
  float x=(width/2); 
  float y=(height/2);
  float w=width;
  float h=height;
   


    
   
}

void mouseDragged()
     {fill(mouseX,mouseY,random(255)); 
     filter(BLUR);
     ellipse(mouseX, mouseY,mouseX*.3,mouseY*.30);
     }
