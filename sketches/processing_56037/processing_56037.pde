
int bertilXPos; //bertils position i x-led
int speed; //hastighet

void setup ()
{
  bertilXPos = 0; //bertils startposition är 0
  frameRate (100); //draw anropas 100 ggr/sek 
  speed = 1; //bertils x position ökar med 1px
  size (500, 300); //Fönsterstorlek
}

void draw ()
{
noStroke (); //ingen kantlinje
smooth(); //rundare kanter
ellipseMode (CENTER); //utgår ifrån mitten
fill (40, 60, 120); //övre färg
rect (0, 0, width, height/2); //ritar himlen

fill (75, 170, 70); //undre färg
rect (0, height/2, width, height/2); //ritar marken

fill (255, 255, 0); //stjärnornas fyllnadsfärg

int starXPosition = 50; //stjärnans position

while (starXPosition < width) //sjärnorna fortsätter tills dess position är mindre än bredden
{
ellipse (starXPosition, 20, 5, 5); //stjärnor rad 1
ellipse (starXPosition, 70, 5, 5); //stjärnor rad 2
ellipse (starXPosition, 120, 5, 5); //stjärnor rad 3
starXPosition = starXPosition + 60; //avståndet mellan stjärnorna är 60 pixlar
}

bertil (bertilXPos, 70); //ritar bertil och hans position
  bertilXPos = bertilXPos + speed; //flyttar bertil 1px åt höger i x-led
  
  if(bertilXPos > width - 170) //if-sats nr 1 - ökar 1px åt höger så länge bertil håller sig inom -170px för fönsterstorleken
  {
    speed = -1; //ökar 1 px åt höger
  }
  
  if(bertilXPos < 0) //if-sats nr 2 - ökar 1px åt vänster så länge bertil håller sig inom bredden 0 för fönsterstorleken
  {
    speed = 1; //ökar 1 px åt vänster
  }
}

void bertil (int bertilXPosition, int bertilYPosition) //parametrar för bertils position
{

/* BERTIL BANDIT
 av Caroline Hedberg*/
 //Ben
 stroke (0);        
 strokeWeight(20);   // Tjockare linjer
 line (105 + bertilXPosition, 140 + bertilYPosition, 95 + bertilXPosition, 120 + bertilYPosition);
 line (55 + bertilXPosition, 140 + bertilYPosition, 65 + bertilXPosition, 120 + bertilYPosition);

 //Kropp
 stroke (255);       
 strokeWeight(1);   // Tunna linjer
 fill (0);        
 ellipse (81 + bertilXPosition, 70 + bertilYPosition, 120, 100);
 
 //Ögon
 fill (255);      
 ellipse (65 + bertilXPosition, 70 + bertilYPosition, 30, 40);
 ellipse (95 + bertilXPosition, 70 + bertilYPosition, 30, 40);
 fill (0);      
 ellipse (70 + bertilXPosition, 75 + bertilYPosition, 10, 20);
 ellipse (90 + bertilXPosition, 75 + bertilYPosition, 10, 20);
 
 //Ögonbryn
 line (50 + bertilXPosition, 40 + bertilYPosition, 20 + bertilXPosition, 20 + bertilYPosition);
 line (110 + bertilXPosition, 40 + bertilYPosition, 140 + bertilXPosition, 20 + bertilYPosition);
 
 //Mun
 line (95 + bertilXPosition, 105 + bertilYPosition, 120 + bertilXPosition, 95 + bertilYPosition);
  /*BERTIL BANDIT
 slut*/
 
 int brynBollar = 20; //bollar på ögonbrynen + storlek
 
 ellipse (20 + bertilXPosition, 20 + bertilYPosition, brynBollar, brynBollar); //ritar vänster boll
 ellipse (140 + bertilXPosition, 20 + bertilYPosition, brynBollar, brynBollar); // ritar höger boll
 
}

