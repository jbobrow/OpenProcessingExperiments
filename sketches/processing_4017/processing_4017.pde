

color pal(PImage i, int x, int y){
  color c = i.get(x,y);
  return c;
}


void masAutoPinceles(){
  int sp = 5;
  for(int i = 0; i < height; i+= sp){
    Pincel p = new Pincel(0, i);
    p.ang = 0;
    autoPinceles.add(p);
  } 
}
class Pincel{
  int x, y;
  float ang, rad;
  int seed;

  Pincel(float px, float py){
    x = round(py);
    y = round(px);
    rad = PI*4;
    seed = round(random(4000));
  }


  void dibuja(){
    if (mousePressed == true){
      noiseSeed(seed);
      ang += (noise((millis()/random(3500,4500))*6) - 0.2);

      x += round(cos(ang) * rad);
      y += round(sin(ang) * rad);
      
      noStroke();
      fill(pal(img,x,y));
      ellipse(x,y,random(7),random(7)); 

      if (x < 0) x += width;
      if (y < 0) y += height;
      if (x > width) x -= width;
      if (y > height) y -= height;
    }
  }
}




