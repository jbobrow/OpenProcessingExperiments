
int i = 0;
int j = 0;
int MYMAX = 100;
int spacing = 100;

void setup()
{
  size(400,400);
  background(255);  
}


void draw()
{
  while(i< width)
  {
    line(i,0,i,height);
    i+=spacing;
  }
  
  while(j< height)
  {
    line(0,j,width,j);
    j+=spacing;
  }

}


void mousePressed()
{
  
  //1st row, 1st square
  if(mouseX < width/4 && mouseY <height/4)
  {
    fill(191);
    rect(0,0,width/4,height/4);
  }
  
  //1st row, 2nd square
  if(mouseX > width/4 && mouseX<width/2 && mouseY <height/4)
  {
    fill(255,0,0);
    rect(width/4,0,width/4,height/4);
  }
  
  //1st row, 3rd square
  if(mouseX > width/2 && mouseX<width/1.333333 && mouseY <height/4)
  {
    fill(0,255,0);
    rect(width/2,0,width/4,height/4);
  }  
  
  //1st row, 4th square
  if(mouseX > width/1.3333333 && mouseX<width && mouseY <height/4)
  {
    fill(0,0,255);
    rect(width/1.3333333,0,width/4,height/4);
  }  

  
  
  //2nd row, 1st square
  if(mouseX < width/4 && mouseY > height/4 && mouseY <height/2)
  {
    fill(127);
    rect(0,height/4,width/4,height/4);
  }
  
  //2nd row, 2nd square
  if(mouseX > width/4 && mouseX<width/2 && mouseY > height/4 && mouseY <height/2)
  {
    fill(191,0,0);
    rect(width/4,height/4,width/4,height/4);
  }
  
  //2nd row, 3rd square
  if(mouseX > width/2 && mouseX<width/1.333333 && mouseY > height/4 && mouseY <height/2)
  {
    fill(0,191,0);
    rect(width/2,height/4,width/4,height/4);
  }  
  
  //2nd row, 4th square
  if(mouseX > width/1.3333333 && mouseX<width && mouseY > height/4 && mouseY <height/2)
  {
    fill(0,0,191);
    rect(width/1.3333333,height/4,width/4,height/4);
  }    


  //3rd row, 1st square
  if(mouseX < width/4 && mouseY > height/2 && mouseY < height/1.3333333)
  {
    fill(64);
    rect(0,height/2,width/4,height/4);
  }
  
  //3rd row, 2nd square
  if(mouseX > width/4 && mouseX<width/2 && mouseY > height/2 && mouseY < height/1.3333333)
  {
    fill(127,0,0);
    rect(width/4,height/2,width/4,height/4);
  }
  
  //3rd row, 3rd square
  if(mouseX > width/2 && mouseX<width/1.333333 && mouseY > height/2 && mouseY < height/1.3333333)
  {
    fill(0,127,0);
    rect(width/2,height/2,width/4,height/4);
  }  
  
  //3rd row, 4th square
  if(mouseX > width/1.3333333 && mouseX<width && mouseY > height/2 && mouseY < height/1.3333333)
  {
    fill(0,0,127);
    rect(width/1.3333333,height/2,width/4,height/4);
  }   
  
  
  
  //4th row, 1st square
  if(mouseX < width/4 && mouseY > height/1.3333333 && mouseY < height)
  {
    fill(0);
    rect(0,height/1.3333333,width/4,height/4);
  }
  
  //4th row, 2nd square
  if(mouseX > width/4 && mouseX<width/2 && mouseY > height/1.3333333 && mouseY < height)
  {
    fill(64,0,0);
    rect(width/4,height/1.3333333,width/4,height/4);
  }
  
  //4th row, 3rd square
  if(mouseX > width/2 && mouseX<width/1.333333 && mouseY > height/1.3333333 && mouseY < height)
  {
    fill(0,64,0);
    rect(width/2,height/1.3333333,width/4,height/4);
  }  
  
  //4th row, 4th square
  if(mouseX > width/1.3333333 && mouseX<width && mouseY > height/1.3333333 && mouseY < height)
  {
    fill(0,0,64);
    rect(width/1.3333333,height/1.3333333,width/4,height/4);
  } 
}

void keyPressed()
{
   background(255); 
}

