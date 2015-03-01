
int length = 10;
int x = length;
int y = length;
int x2 = length;
int y2 = length+20;



void setup()
{
  size(600,600);
  smooth();
  background(255);
  
  
}

void draw()
{
  for (int x = length; x < width; x = x+5) {
    for (int y = length; y < height; y = y+25) {
      for (int y2 = y+5; y2 < height; y2 = y2+length) {
        fill(0);
        line(x,y,x,y2);
        if(dist(mouseX,mouseY, x, y) < 5) {
          x++;
          } else {
            line(x,y,x,y2);
        }
      }
    }
  }

}

