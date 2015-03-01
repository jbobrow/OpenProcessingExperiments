
//Ana MolÃ©s Barrero

//DeclaraciÃ³ de variables

int midax, miday;
int numdibuixos;
int estat;

//void setup, part estÃ tica i inicialitzaciÃ³
void setup()
{
  smooth();
  size(800, 500);
  numdibuixos = 20;
  midax = width/numdibuixos; 
  miday = height/numdibuixos;
  rectMode(CORNER);
  ellipseMode(CORNER);
}

//void draw, part dinÃ mica
void draw() {
 background(198,164,209);
 
 if (estat == 2) { //segons el void keypress
   
 for (int j = 0; (j <numdibuixos); j++ ) //recorregut per primera dimensiÃ³
 {
    for (int i = 0; (i <numdibuixos); i++) //recorregut per segona dimensiÃ³
    {
      noStroke();
      fill(116,115,112);
      rect(i*midax,j*miday,midax,miday);
      fill(228,160,229);
      rect(i*midax+midax/2, j*miday+miday/2, midax/2, miday/2);
      fill(184,131,185);
      rect(i*midax, j*miday, midax-midax/1.3, miday-miday/2);
      fill(158,104,175);
      ellipse(i*midax+midax/2,j*miday,midax/5,midax/5);
      fill(204,133,227);
      ellipse(i*midax+midax/3.5,j*miday+miday/4,midax/5,midax/5);
    }
      
    
 }
 }
 
 
 
else{ //si no Ã©s estat 2, Ã©s a dir, estat 1
       
       for (int j = 0; (j < numdibuixos); j++)
    {
      for (int i = 0;  i<=j; i++) //dibuix recorre fins la diagonal
      {
      
      noStroke();
      
      fill(202,99,234);
      rect(i*midax,j*miday,midax,miday);
      fill(228,160,229);
      rect(i*midax+midax/2, j*miday+miday/2, midax/2, miday/2);
      fill(184,131,185);
      rect(i*midax, j*miday, midax-midax/1.5, miday-miday/2);
      fill(158,104,175);
      ellipse(i*midax+midax/2,j*miday,midax/5,midax/5);
      fill(204,133,227);
      ellipse(i*midax+midax/3.5,j*miday+miday/4,midax/5,midax/5);
      

         
      }
    }
}
}


//

void keyPressed()
{
  if (key == 'j')  estat = 2; //tecla j - fa estat 2
  else             estat = 1 ; //qualsevol tecla que no sigui j - fa 1
}


