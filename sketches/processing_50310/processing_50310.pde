
//draws triangles w/ vertices @ center, mouse,pmouse
//needs for loops for something...
void setup()
{
  size (600,600);
  background (222);
}


void draw () {
  fill(222,111,123,100);
  //background(255);
  int x =width/2;
  int y =height/2;
  
  beginShape();
  vertex(mouseX, mouseY);
  vertex(x, y);
  vertex(pmouseX,pmouseY);
  endShape (CLOSE);
  
  //for loop spawns an orange circle in the upper left corner...
  for(int z=50; z<(mouseX+10); z++)
  {
    for(int w=50; w<(mouseY+10); w++)
    {
      for(int m=50; m>(mouseX-10); m--)
        {
        for(int v=50; v>(mouseY-10); v--)
          {
            fill(233,123,12,44);
      ellipse(z,w, m,v);
    }
  }
    }
  }
  
  if (mousePressed)
  {
   fill (12,231,99,150);
  }
  
}
  

