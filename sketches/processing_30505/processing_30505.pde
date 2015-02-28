
//defenir as variaveis da grelha, onde se diz quantas linhas devem existir em cada modulo, definindo tambem o tamanho de cada modulo.
int patternSeperationX = 20;
int patternSeperationY = 20;
 
//definir tamanho da tela 
void setup() {
  size(500,500);
 
  
  fill(255);
  noStroke();
  //definir modulos da grelha
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  smooth();
 
  for(int i = 0; i < width/patternSeperationX; i++) {
    for(int j = 0; j < height/patternSeperationY; j++) {
      pushMatrix();
      translate(i*patternSeperationX, j*patternSeperationY);
      function();
      popMatrix();
    }
  }
}
 
 
void draw()
{
  saveFrame("wickedgrid.jpg");
}
 
//definir as linhas dentro dos modulos
void function() {
 
  int i;
  for (i = 0; i < patternSeperationY; i++)
  {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(0, i, patternSeperationX, i);
  }
   
  for (i = 0; i < patternSeperationX; i++)
  {
    stroke(random(0, 255), random(0, 255), random(0, 255), random(50, 255));
    line(i, 0, i, patternSeperationY);
  }
 
}




