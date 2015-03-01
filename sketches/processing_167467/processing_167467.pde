
int midax, miday;
int numdibuixos;
int estat;

void setup()
{
  size(900, 700);
  numdibuixos = 20;
  midax = width/numdibuixos;
  miday = height/numdibuixos;
  rectMode(CORNER);
  estat = 1;
}

void draw()
{
   background (0);
 if (estat == 1)
 {
    for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i < width/numdibuixos; i++)
      {
pushMatrix();
            fill(0);
            rect(i*midax, j*miday, midax, miday);
            fill(#E0FF00);
            rect(i*midax, j*miday, midax-(midax/4), miday-(miday/4));
            fill(255,0,0);
            rect(i*midax+midax,j*miday+miday, midax-(midax/3), miday-(miday/3));
            fill(#D3D3D3);
            rect(i*midax, j*miday, midax-(midax/2), miday-(miday/2));
            fill (0);
            ellipse (i*midax, j*miday, midax*0.4, miday*0.4);
 popMatrix();
       }
    }
  }
else {    
 
    for (int j = 0; (j < height/numdibuixos); j++)
    {
      for (int i = 0; i<=j; i++)
      {
            fill(0);
            rect(i*midax, j*miday, midax, miday);
            fill(#E0FF00);
            rect(i*midax, j*miday, midax-(midax/4), miday-(miday/4));
            fill(255,0,0);
            rect(i*midax+midax,j*miday+miday, midax-(midax/3), miday-(miday/3));
            fill(0);
            rect(i*midax, j*miday, midax-(midax/2), miday-(miday/2));
            fill (#FF2478);
            ellipse (i*midax, j*miday, midax*0.4, miday*0.4);
        }
      }
    
    }
    
    
    
}

void keyPressed()
{
  if (key == 'j')  
  {
  estat = 2;
  }

  else
  {
    
    estat = 1;
  }
  }
