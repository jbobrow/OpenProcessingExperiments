

// Qu'est ce que tu fous ici ptit con !
PFont fontA;

int i = 1;
int j = 50;
int verifi = 0;
int verifj = 0;

void setup()
{
  size(400,400);
  background(255);
  fontA = loadFont("Asap-Regular.ttf");

  textFont(fontA, 20);

}



void draw()

{
  background(255);
 
   
   fill(0);
    text("Monde de Merde",i,j);

    if(i<300 && verifi == 0)
    {
      
      i++;
      
    }
    if (i == 300)
    {
      verifi = 1;
    }
    if ( verifi == 1)
    {
     
      i--;
    }
    if(i == 0)
    {
       verifi = 0;
    }
    if (verifj == 0)
    {
      j++;
    }
    if (j == 300)
    
    {
      verifj = 1;
    }
    if ( verifj == 1)
    {
     j--; 
    }
    if (j == 0)
    {
      verifj = 0;
    }

}


