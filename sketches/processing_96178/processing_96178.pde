

int radi;
int radi_2;
void setup()
{
    size(500, 500);
    radi=50+mouseX;
   }

void draw()
{
  background(256);
  stroke(256, 256, 256);
  strokeWeight(4);
  fill(mouseX-350, mouseY-400, mouseY-350);
    line(width/4, height/4, 3*width/4, 3*height/4);
    line(3*width/4, height/4, width/4, 3*height/4);
    ellipse(width/2, height/2, 100+mouseX, 100+mouseX);
    ellipse(width/4, height/4, 50+mouseX/5, 50+mouseX/5);
    ellipse(3*width/4, height/4, 50+mouseX/5, 50+mouseX/5);
  
  }



