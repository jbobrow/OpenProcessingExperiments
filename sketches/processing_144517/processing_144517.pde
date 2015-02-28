
void setup() 
{  //setup function called initially, only once    
  size(800,800);
  frameRate(.5);
}

void draw() 
{   //draw function loops 
  background(255);  //set background white
  
  for (int i = 0; i <= width; i += width / 200;)
  {
      stroke(random(255),random(255),random(255)); //set lines to random color
      line(i,0,0,width-i);
      line(i,height,0,i);
      line(i,0,width,i);
      line(i,height,width,height-i);
  }
  
  
}
