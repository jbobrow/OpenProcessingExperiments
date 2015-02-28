
PImage monaLisa;
PImage emperor;
PImage luke;

void setup()
{
  size(800, 800);
  monaLisa = requestImage("MonaLisa.jpg");
  emperor = requestImage("Emperor.jpg");
  luke = requestImage("Luke.jpg");
  
  
}

void draw()
{
  println(mouseX + "," + mouseY);
  if(monaLisa.width > 0)
  {
    image(monaLisa, 0, 0, width, height);
  }
  
  monaLisa.filter(POSTERIZE, 3);
  
  stroke(0, 0, 0);
  strokeWeight(1);
  for(int x = 0; x < width; x+= 20)
  {
    line(x, 0, x, height);
  }
  
  for(int y = 0; y < height; y += 20)
  {
    line(0, y, height, y);
  }
  
  
  if(emperor.width > 0);
  {
    image(emperor, 0, 100, 200, 163);
  }
  
  if(luke.width > 0);
  {
    image(luke, 640, 560, 160, 216);
  }
  
  float x = 85;
  float y = 160;
  float prevX = x;
  float prevY = y;
  
  stroke(73, 130, 219);
  strokeWeight(3);
  while(x < 650)
  {
    x += random(-5, 30);
    y += random(5, 15);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
}


