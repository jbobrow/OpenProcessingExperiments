
//Declaració de variables//

int midax, miday;
int numquadrats;
int estat=1;


//Inicialització setup//
void setup()
{
  size(500, 300); //Mida del dibuix
  numquadrats = 10; //Total de quadrats en x i y
  midax = width/numquadrats;
  miday = height/numquadrats;
  rectMode(CORNER);
  ellipseMode(CORNER);

  noStroke();
  
}


//Inicialització draw
void draw()
{
background(222,175,175);
  if(estat ==2) {
    
    int nfigures=1;
    for (int j = 0; (j < height/numquadrats); j++)
    {
      for (int i = 0; (i < height/numquadrats); i++)
      {
        fill(222,175,175);
        rect(i*midax, j*miday, midax, miday);
         fill(230,230,230);
        ellipse(i*midax, j*miday, midax/3, miday/3);
        fill(188,133,133);
        ellipse(i*midax+7, j*miday+7, midax, miday);
         fill(155,122,122);
         ellipse(i*midax+10, j*miday+10, midax, miday);
         fill(170, 130, 130);
         ellipse(i*midax+10, j*miday+10, midax/2, miday/2);
      }
    }
  }
    
    else {
      
       for (int j = 0; (j < height/numquadrats); j++)
    {
      for (int i = 0;  i<=j; i++)
      {
        
        fill(222,175,175);
        rect(i*midax, j*miday, midax, miday);
         fill(230,230,230);
        ellipse(i*midax, j*miday, midax/3, miday/3);
        fill(188,133,133);
        ellipse(i*midax+7, j*miday+7, midax, miday);
         fill(155,122,122);
         ellipse(i*midax+10, j*miday+10, midax, miday);
         fill(170, 130, 130);
         ellipse(i*midax+10, j*miday+10, midax/2, miday/2);
        
      }
    }
    }


}

void keyPressed()
{
  if (key == 'r')  estat = 2;
  else                    estat = 1;
}

   
   
