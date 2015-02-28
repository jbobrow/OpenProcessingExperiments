
void setup()
{
  

  size (1000, 1000);
  background(50,75,100);

  for (int ypos = 0; ypos <1000; ypos = ypos + 40) {

    for(int xpos = 0; xpos <1000; xpos = xpos +30) {

      rect(xpos+10,ypos+20,4,30);
      fill(255,0,0);
    
      rect(xpos,ypos,4,30);
      fill (100,100,100);

      rect(xpos,ypos,20,1);
      fill(255,0,0);
      
    }

  }

}


