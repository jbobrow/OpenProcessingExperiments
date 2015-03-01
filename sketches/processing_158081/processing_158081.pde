
float px=0;
void setup() {
  size(700, 600);
}
void draw()
{
  px++;
  if (px<=width*2) {
    fill(255, 0, 0);
  }
  else 
    px--;
  {
    if (px>=width/2) {
      fill(0, 255, 0);
    }
    ellipse(px, 300, 20, 20);
  }
}

