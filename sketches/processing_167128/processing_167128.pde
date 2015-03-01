
int midax, miday;
int numdibuixos;
int estat = 1;

void setup()
{
  size(600, 600);
  smooth();
  numdibuixos = 20;
  midax = width/numdibuixos;
  miday = height/numdibuixos;
  ellipseMode(CORNER);
  rectMode (CORNER);
}

void draw()
{
  noStroke();
  background (0);
  
  if (estat == 1) {
    
 for (int j = 0; j < numdibuixos; j++)
 {
    for (int i = 0; i < numdibuixos; i++)
    {
      
      fill(255, 0, 0);
      rect(i*midax, j*miday, midax, miday/2);
      arc(i*midax, j*miday, midax, miday, radians (-5), radians (180));
      fill (255);
      rect (i*midax, j*miday, midax*0.25, miday*0.25);
      ellipse (i*midax, j*miday, midax/2, miday/2);
      fill(0);
      ellipse (i*midax, j*miday, midax/3, miday/3);

  }
}
}else{
  
  for (int j = 0; j < numdibuixos; j++)
 {
    for (int i = 0; i <= j; i++)
    {
      fill(255);
      rect(i*midax, j*miday, midax, miday/2);
      arc(i*midax, j*miday, midax, miday, radians (-5), radians (180));
      fill (255, 0, 0);
      rect (i*midax, j*miday, midax/2, miday/2);
      ellipse (i*midax, j*miday, midax*0.8, miday*0.80);
      fill(0);
      ellipse (i*midax, j*miday, midax/3, miday/3);
    }
 }
}

}

void keyPressed () {
  if (key == 'j') estat = 2;
  else  estat = 1;
}
