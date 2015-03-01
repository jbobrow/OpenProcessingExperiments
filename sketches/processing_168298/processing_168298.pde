

 
//Gemma Galceran Kimura - Seminari 03
 
int midax, miday;
int ndibuixos;
int estat;
float x = map(mouseX, 0, width, 0, 70);


// Inicialització
void setup() 
{
  size(700, 700);
  ndibuixos = 12;
  midax = width/ndibuixos; //amplada ellipse
  miday = height/ndibuixos; //alçada ellipse
  ellipseMode (CENTER);
  estat=1;  
}

//Cercles blaus d'inici - Estat 1
void draw() 
{
  background(#1E3064);
  if (estat ==1) 
  {
    for (int j=0; (j<height/ndibuixos); j++)
    {
      for (int i=0; (i<height/ndibuixos); i++)
      {
        float a = map(mouseX, 0, width, 0, 70); 
        float b = map(mouseY, 0, height, 0, 70); 
        stroke(180,40,a+50);
        strokeWeight(3);
        noFill();
        ellipse(i*midax+30,j*miday+30,midax-10,miday-10);
        noStroke();
        //negre
        fill(170,a,34);
        ellipse(i*midax+30,j*miday+36,34,28);
        arc(i*midax+30,j*miday+35.54,34,44,-PI,0);
        
        //blanc
        fill(220,160,b);
        ellipse(i*midax+30,j*miday+38,26,24);
  
        //ulls blancs
        ellipse(i*midax+24,j*miday+20,4,4);
        ellipse(i*midax+36,j*miday+20,4,4);
        
        //iris negre
        fill(a,a,110);
        ellipse(i*midax+24,j*miday+20,2.4,2.4);
        ellipse(i*midax+36,j*miday+20,2.4,2.4);
        
        //orelles
        ellipse(i*midax+23,j*miday+12.8,5.4,5.6);
        ellipse(i*midax+37,j*miday+12.8,5.4,5.6);
        
        beginShape(); 
        vertex(i*midax+26,j*miday+16);
        vertex(i*midax+24,j*miday+16);
        vertex(i*midax+22,j*miday+11.2);
        vertex(i*midax+24,j*miday+11.2);
        endShape();
        
        beginShape(); 
        vertex(i*midax+34,j*miday+16);
        vertex(i*midax+36,j*miday+16);
        vertex(i*midax+38,j*miday+11.2);
        vertex(i*midax+36,j*miday+11.2);
        endShape();
      }
    }
  }
  
//Cercles de colors + personatge - Estat 2
  else 
  {
    for (int j=0; (j<height/ndibuixos); j++)
    {
      for (int i=0; i<=j; i++) //dibuix diagonal
      {
        //degradat de colors que depèn del moviment del ratolí
        float a = map(mouseX, 0, width, 0, 70); 
        float b = map(mouseY, 0, height, 0, 70); 
        stroke(170,a,34);
        strokeWeight(3);
        noFill();
        ellipse(i*midax+30,j*miday+30,midax-10,miday-10);
        noStroke();
        //negre
        fill(220,160,b);
        ellipse(i*midax+30,j*miday+36,34,28);
        arc(i*midax+30,j*miday+35.54,34,44,-PI,0);
        
        //blanc
        fill(a,a,110);
        ellipse(i*midax+30,j*miday+38,26,24);
  
        //ulls blancs
        ellipse(i*midax+24,j*miday+20,4,4);
        ellipse(i*midax+36,j*miday+20,4,4);
        
        //iris negre
        fill(180,40,a+50);
        ellipse(i*midax+24,j*miday+20,2.4,2.4);
        ellipse(i*midax+36,j*miday+20,2.4,2.4);
        
        //orelles
        ellipse(i*midax+23,j*miday+12.8,5.4,5.6);
        ellipse(i*midax+37,j*miday+12.8,5.4,5.6);
        
        beginShape(); 
        vertex(i*midax+26,j*miday+16);
        vertex(i*midax+24,j*miday+16);
        vertex(i*midax+22,j*miday+11.2);
        vertex(i*midax+24,j*miday+11.2);
        endShape();
        
        beginShape(); 
        vertex(i*midax+34,j*miday+16);
        vertex(i*midax+36,j*miday+16);
        vertex(i*midax+38,j*miday+11.2);
        vertex(i*midax+36,j*miday+11.2);
        endShape();

      }
    }
  }
}

// Forma de canviar d'estat
void keyPressed()
{
  if (key == 'g') estat = 2;
  else estat = 1;
}
