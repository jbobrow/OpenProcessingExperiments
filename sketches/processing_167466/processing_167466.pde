
int midax, miday;
int numdibuixos;
int estat=1;

void setup()
{
  size(500, 500);
  numdibuixos = 20;
  midax = width/numdibuixos;
  miday = height/numdibuixos;
  smooth();
  ellipseMode(CORNER);
  fill(249, 192, 214);
}

void draw()
{
  background(255);
 
 if(estat==1)

    for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i <= j; i++)
      
      {
        
        ellipse(i*midax, j*miday, midax, miday); //cap
        ellipse(i*midax+5, j*miday+12, midax-11, miday-17); //nas
        ellipse(i*midax+9, j*miday+16, midax-24, miday-24);
        ellipse(i*midax+14, j*miday+16, midax-24, miday-24);
        fill(255);
        ellipse(i*midax+14, j*midax+5, midax-20, miday-20);//ojos
        ellipse(i*midax+7, j*midax+5, midax-20, miday-20);
        
        fill(0);
        ellipse(i*midax+16, j*midax+7.5, midax-24, miday-24);//pupilas
        ellipse(i*midax+9, j*midax+7.5, midax-24, miday-24);
        
        fill(249, 192, 214);
      }
    }
    
    else
    
    for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i < width/numdibuixos; i++)
      {
        
        ellipse(i*midax, j*miday, midax, miday); //cap
        ellipse(i*midax+5, j*miday+12, midax-11, miday-17); //nas
        ellipse(i*midax+9, j*miday+16, midax-24, miday-24);
        ellipse(i*midax+14, j*miday+16, midax-24, miday-24);
        fill(255);
        ellipse(i*midax+14, j*midax+5, midax-20, miday-20);//ojos
        ellipse(i*midax+7, j*midax+5, midax-20, miday-20);
        
        fill(0);
        ellipse(i*midax+16, j*midax+7.5, midax-24, miday-24);//pupilas
        ellipse(i*midax+9, j*midax+7.5, midax-24, miday-24);
   
        fill(249, 192, 214);
  }
    }
  }


void keyPressed()
{
  if (key == 'j')  estat = 2;
  else estat = 1;  
}
