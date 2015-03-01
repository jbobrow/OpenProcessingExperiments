
int medidax, mediday;
int numdibujos;
int estado = 1;
 
 
void setup ()
{
  size (500, 450);
  numdibujos = 25;
  medidax = width/numdibujos;
  mediday = height/numdibujos;
  noStroke();
}
 
void draw ()
{
  if (estado == 2)
  {
    background (255);

    for (int j=0; j<numdibujos; j++)
    {
      for (int i=0; i<=j; i++)
      {
        fill (#00FF28);
        triangle (i*medidax, j*mediday, i*medidax+10, j*mediday+20, i*medidax+20, j*mediday);
        fill (#B600FF);
        triangle (i*medidax, j*mediday+20, i*medidax+10, j*mediday, i*medidax+20, j*mediday+20);
      }
    }
  }
      else
      {
        background (#FFAF00);

        for (int i=0; i<numdibujos; i++)
        {
          for (int j=0; j<numdibujos; j++)
          {
            fill (#00FF28);
            triangle (i*medidax, j*mediday+20, i*medidax+10, j*mediday, i*medidax+20, j*mediday+20);
            fill (#B600FF);
            triangle (i*medidax, j*mediday, i*medidax+10, j*mediday+20, i*medidax+20, j*mediday);
          }
        }
      }
  }
 
 
 
void keyPressed ()
{
  if (key == 'q')  estado = 2;
  else             estado = 1;
}
