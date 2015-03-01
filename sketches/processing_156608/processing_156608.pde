
int p1;
int p2;
int p3;

void setup(){
 size(500,500);
 background(0);
}

void draw(){
  fill(100);
  for(int i=0;i<10;i++)
  {
    for(int j=0;j<10;j++)
    {
      if(mouseX>(i-1)*50 && mouseX<(i+2)*50 && mouseY<(j+2)*50 && mouseY>(j-1)*50)
      {
        fill(150);
         if(mouseX>i*50 && mouseX<(i+1)*50 && mouseY<(j+1)*50 && mouseY>j*50)
      {
        fill(255);
      }
      }
      else
      {
        fill(100);
      }
      triangle(i*50,j*50,50+i*50,j*50,i*50,50+j*50);
    }
  }
}


