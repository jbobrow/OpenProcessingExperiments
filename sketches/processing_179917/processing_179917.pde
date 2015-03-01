
PImage sam;
int count;

void setup()
{
  size(800,800);
  sam = loadImage("sam.jpg");
  background(0);
  count = 0;
}

void draw()
{
  //image(sam,0,0);
  
  for (int i = 0; i < 150; i++)
  {
    float x = mouseX + random(100) - 50;
    float y = mouseY + random(100) - 50;
    
  
    color c = sam.get(int(x),int(y));
  
    fill(c,50);
  
    noStroke();
    ellipse(x,y,2,2);
  }
  count++;
  if (count == 600)
  {
    sam = loadImage("apple.png");
  }
  
}

void mousePressed()
{
  for (int i = 0; i < 400; i++)
  {
    float x = random(width);
    float y = random(height);
    
    color c = sam.get(int(x),int(y));
    
    fill(c);
    noStroke();
    ellipse(x,y,16,16);
  }
}


