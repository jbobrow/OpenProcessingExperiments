
int x,y;
int shapeSize=20;

void setup(){
  size(400,200);
}

void draw(){
  for(int i=0;i<20;i++)
    for(int j=0;j<10;j++)
    {
      x=(i*shapeSize)+shapeSize/2;
      y=(j*shapeSize)+shapeSize/2;
      if(mouseX<=200&&mouseY<=100)
      fill(255,0,0);
      else if(mouseX<=200&&mouseY>100)
      fill(0,255,0);
      else if(mouseX>200&&mouseY<=100)
      fill(0,0,255);
      else
      fill(255,255,0);
      ellipse(x,y,20,20);
    }
}

