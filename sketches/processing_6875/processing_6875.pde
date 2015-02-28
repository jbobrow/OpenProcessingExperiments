
class rond
{
  float x;
  float y;
  float vit;
  float rayon;
  float r,g,b;
  
  rond()
  {
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
    x = random(width-100) + 30;
    y = -50;
    vit = random(3) + 1;
    rayon = random(30) + 10;
  }
 
  void refresh()
  {
    fill(r,g,b,200);
    ellipse(x,y,rayon,rayon);
    y+=vit;
    x+=2*sin(y/20);
  }
}

