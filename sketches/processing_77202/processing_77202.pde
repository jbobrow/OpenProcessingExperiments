
float fl;
float hue;
int frame;

int iterations = 5000;

void setup()
{
  size(700, 700);
  fl = 0;
  background(0);
  frameRate(1000);
  frame = 0;
  hue = random(0, 255);
}

void modify(PVector v)
{
  PVector p = new PVector((noise(v.x / 50, v.y / 50, fl) - 0.5f), (noise(v.x / 50 + 54, v.y / 50 - 756, fl) - 0.5f));
  p.mult(5);
  //p.setMag(2);
  v.add(p);
}

void addColor()
{
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++)
  {
    pixels[i] = getColor((float)brightness(pixels[i]) / 255);
  }
  
  updatePixels();
}

void draw()
{
  //image(temp, 0, 0);
  PVector pos = new PVector(width/2, height/2);
 
  stroke(255, 7);
  //blendMode(ADD);
  for(int i = 0; i < iterations; i++)
  {
    float x = pos.x;
    float y = pos.y;
    
    modify(pos);
    //line(x, y, pos.x, pos.y);
    
    if(!(brightness(get((int)x, (int)y)) > 220 && abs(x - width/2) > 10 && abs(y - height/2) > 10))
      line(x, y, pos.x, pos.y);
  }
  
  fl += 0.01;
  addColor();
  
  if(fl > 10)
  {
    fl = 0;
    noiseSeed((int)random(10000));
    hue = random(0, 255);
    //get().save("frame" + frame + ".png");
    frame++;
    background(0);
  }
}


color getColor(float f)
{
  colorMode(HSB, 255);
  return color(hue, sqrt(1-f) * 255 * 1.5, f * 255);
}


