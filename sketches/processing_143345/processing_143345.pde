
void setup() 
{  //setup function called initially, only once
  size(800, 800);
  background(255);  //set background white
  stroke(0); //set lines to be black
  for (int i = 0; i <= width; i += width / 10)
  {
      line(i,0,0,height-i);
  } 
}

void draw() 
{   //draw function loops 
  
  
}
