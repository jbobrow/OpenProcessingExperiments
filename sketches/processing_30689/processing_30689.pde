
//inicia o processo
void setup()
{
  size (800,600);
  background (255);
  smooth ();
  
}
//corre o processo
void draw ()
{
    if (keyPressed) {
    if (key == ' ')
  {
    saveFrame ("line-####.jpg");
    background (255);   
  }
  }
//define as caracteristicas da linha
fill (399,0,0);
stroke (random (255),random (30,70),59, random (30,100));
strokeWeight (random (2,50));

//define a posição do rato
  line (pmouseX, pmouseY, mouseX, mouseY);
  float tamanho = random (7,100);
  
  noStroke();
  noFill();
  
  fill (random (100,178), random (20,50));
  stroke (random (255,100));
  strokeWeight (random (1,3));
  rectMode (CENTER);
  rect (pmouseX, pmouseY, tamanho, tamanho);
 
}

