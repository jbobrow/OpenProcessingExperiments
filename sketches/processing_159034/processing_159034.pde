
int R = 0;
int G = 0;
int B = 0;

void setup()
{
  size(400,400);
  background(255);
}

void draw()
{
  //background(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);  
  
  if(mouseX < width/2 && mouseY < height/2)
  {
    R = int(random(0,255));
    G = int(random(0,255));
    B = int(random(0,255));
    fill(R,G,B);
    rect(0,0,width/2,height/2); 
  }
  else if(mouseX > width/2 && mouseY < height/2)
  {
        R = int(random(0,255));
    G = int(random(0,255));
    B = int(random(0,255));
    fill(R,G,B);
    rect(width/2,0,width/2,height/2);
  }
  else if(mouseX < width/2 && mouseY > height/2)
  {
        R = int(random(0,255));
    G = int(random(0,255));
    B = int(random(0,255));
    fill(R,G,B);
    rect(0,height/2,width/2,height/2);  
  }
  else if(mouseX > width/2 && mouseY > height/2)
  {
        R = int(random(0,255));
    G = int(random(0,255));
    B = int(random(0,255));
    fill(R,G,B);
    rect(width/2,height/2,width/2,height/2);  
  }
}

void mouseClicked()
{
    background(255);
}


