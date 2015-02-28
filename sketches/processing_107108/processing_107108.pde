
float hue;
float saturation;
float brightness;
int reflections;
float lineLengtX, lineLengtY;


void setup()
{ 
  size(1024, 800, P2D);  
  background(0);
  rectMode(CENTER);
  colorMode(HSB);
}

void draw()
{
  //blendMode(BLEND);
  pushMatrix();
  fill(0, 20);
  rect(width/2, height/2, width*2, height*2);
  popMatrix();
  reflections = mouseY * 500 / height;
  lineLengtX = (mouseX - width / 2) / 3;
  lineLengtY = (mouseY - height / 2) / 3;
  hue = (mouseX * 255 / width);
  saturation = (mouseY * 255 / height);
  brightness = 255;

  translate(width / 2 - 100, height / 2 - 100);

  for (int i = 0; i < reflections; i++)
  {
    if (mousePressed)
    {
      lineLengtX = 1;
    }
    translate(sin(i) *100, sin(i) * 100);
    rotate(mouseX * 2 * PI / width * 0.1);
    stroke(hue, mouseY * 255 / height, brightness);
    line(0, 0, lineLengtX, lineLengtY);
  }
} 



