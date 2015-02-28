
void setup()
{
  //tamanho janela
  size(800, 400);
  background(0);
  
  
  //circulos horizontais
 
  for(float ypos = 10; ypos<1000;ypos =ypos + 100) {
 //circulos verticais
    for(float xpos = 10; xpos <1000; xpos = xpos + 100) {
      noStroke();
 
 //transparencias dos circulos
        fill(random(20),random(0),200,100);
      tint(200,200);
      ellipse(xpos,ypos,200,200);
    }
  }
 
}


                
                
