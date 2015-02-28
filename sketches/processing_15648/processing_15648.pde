
void setup()
{
  size(600, 600);
  background(0);

  for(float ypos = 0; ypos<1000;ypos =ypos + 100) { 

    for(float xpos = 0; xpos <1000; xpos = xpos + 100) {
      noStroke();

        fill(random(20),random(255),100,155);
      tint(255,255);
      ellipse(xpos,ypos,200,200);
    }
  }

}
                
                                                
