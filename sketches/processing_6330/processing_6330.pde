
float x = width/2.5;
float y = height/1.25;
int r = 255;
int g = 255;
int b = 255;
boolean nowDragging;
int rX, rY;

void setup()
{
  size(800, 800);
  background(0);
}

void draw()
{
   stroke(alpha(255), 0, 0);
   fill(0);
   ellipse(y, x, mouseX, pmouseY);
   fill(178, 034, 034);
       
       if(mousePressed)
       {
         strokeWeight(2);
         stroke(random(128,255), random(40,120), random(40,210));
         triangle(pmouseX, pmouseY, mouseX, mouseY, pmouseX, pmouseY);
       }
      
         
       if(nowDragging)
        {
            stroke(random(r), random(g), random(b));
            triangle(0,0,20,30,pmouseX,pmouseY);
        }  
        
}

void mouseDragged()
{
  stroke(random(r), random(g), random(b));
  triangle(mouseX, mouseY,pmouseX,pmouseY,pmouseX,pmouseY);
}

void mouseReleased()
{
  nowDragging = false;
  rX = mouseX;
  rY = mouseY;
  
}


