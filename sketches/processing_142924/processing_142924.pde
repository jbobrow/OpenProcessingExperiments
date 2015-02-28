
/*
  Anna Mª del Corral  - Escola Elisava
  Space Invaders adaptat a Introducció a l´Informàtica de 2on de GEDI

  Per jugar cal usar les tecles LEFT i RIGHT per a moure la defensa i UP per a disparar
  
*/

int posXInvaders, posYInvaders;
int posXDefender;
int velX, velY;
int numInvadersEnX, numInvadersEnY;
boolean[][]  InvadersViu = new boolean[50][50];
int numInvadersVius;

int iniciX;
int iniciY;

int midaInvadersX;
int midaInvadersY;

int numTrets = 30;
int velTret = 30;
int numTretsDisparats = 0;

int[] posTretsX = new int[numTrets];
int[] posTretsY = new int[numTrets];

void setup()
{
  size(800,600);
  
  numInvadersEnX = 12;
  numInvadersEnY = 6;
  
  midaInvadersX = int(width * 0.8)/(2*numInvadersEnX);
  midaInvadersY = int(height * 0.3)/(2*numInvadersEnY);

  iniciX = int(width * 0.12);
  iniciY = int(height * 0.2);
  
//  println(numInvadersEnX);
//  println(numInvadersEnY);
//  println(midaInvadersX);
//  println(midaInvadersY);
  
  posXInvaders = iniciX;
  posYInvaders = iniciY;
  
  posXDefender = width/2;
  
  velX = 5;
  velY = 10;
  
  for( int i=0; i < numInvadersEnX; i++)
    for( int j=0; j < numInvadersEnY; j++)
    {
       InvadersViu[i][j] = true;
    }  
  numInvadersVius = numInvadersEnX * numInvadersEnY;
  println(numInvadersVius);
  
  for( int i=0; i < numTrets; i++) posTretsY[i] = 0;

  noStroke();
  frameRate(10);
}

void draw()
{
 int tecla;
 
 background (0);
 if ((QuedenInvaders())&&(InvadersNoToquenDefensa()))
 {
   MoureInvaders();
   tecla = QuinaTeclaToco();
   if(tecla == UP)  haDisparat();
   else if ((tecla == LEFT) || (tecla == RIGHT)) MoureDefensa(tecla);
   MoureTretsIMatar();
   DibuixarInvaders();
   DibuixaDefensa();
   DibuixaTrets();
   EscriuPuntuacio();
 }
 else
   {
      EscriuPuntuacioFinal();
   }
}


void MoureDefensa(int tec)
{
  if ((tec == LEFT)&&( posXDefender > 0)) posXDefender = posXDefender - 10;
  else  if ( posXDefender < width) posXDefender = posXDefender + 10;
}

void DibuixaDefensa()
{
  rect(posXDefender, height-10, 20, 15);
}

boolean InvadersNoToquenDefensa()
{
  return(((posYInvaders + midaInvadersY) < height)&& (numInvadersVius>0) );
}

void DibuixaTrets()
{
   for( int i=0; i < numTrets; i++)
   {
     if ( posTretsY[i] != 0)
     {
       ellipse( posTretsX[i]+3, posTretsY[i]+3, 5, 5);
       rect( posTretsX[i]+2, posTretsY[i]+5, 2, 4);
     }
   }  
}

void haDisparat()
{
 int i;

 i = 0;
 while (posTretsY[i] != 0) i++;
 posTretsY[i] = height - 20;
 posTretsX[i] = posXDefender; 
 numTretsDisparats = numTretsDisparats +1;
}

void MoureTretsIMatar()
{   
  int X, Y;
  
   for( int i=0; i < numTrets; i++)
   {
     if ( posTretsY[i] != 0)
     {
       posTretsY[i] = posTretsY[i] - velTret;
       if(( posTretsY[i] >= posYInvaders) && (posTretsX[i] >= posXInvaders))
       {
             X = (posTretsX[i] - posXInvaders) /(2 * midaInvadersX);
             Y = (posTretsY[i] - posYInvaders) /(2 * midaInvadersY);
//             println("tret a pos "+ posTretsX[i]+" "+posTretsY[i]+" mata "+X+" "+Y);
             if (InvadersViu[X][Y]) 
             {
               InvadersViu[X][Y] = false;
               posTretsY[i] = 0;
               numInvadersVius = numInvadersVius - 1;
             }
       }
       else if(posTretsY[i] < posYInvaders/2)   posTretsY[i] = 0;
     }
   }
}

int QuinaTeclaToco()
{
  if (keyPressed)   return (keyCode);
  else return(0);
}
void MoureInvaders()
{ 
//  println("....." + posXInvaders+"   "+ ( posXInvaders + (2 * numInvadersEnX * midaInvadersX)));
  if (( posXInvaders < midaInvadersX ) || ((( posXInvaders + (2 * numInvadersEnX * midaInvadersX))) > width)) 
  {
     velX = int(velX * (-1.1));
     posYInvaders = posYInvaders + velY;
     velY = int(velY * 1.1);
  }
  posXInvaders = posXInvaders + velX;

}

void DibuixarInvaders()
{
  for( int i=0; i < numInvadersEnX; i++)
    for( int j=0; j < numInvadersEnY; j++)
     {
       if (InvadersViu[i][j])
         dibuixaUnInvader(posXInvaders, posYInvaders, i, j);
     } 
}


void dibuixaUnInvader(int pX, int pY, int _i, int _j )
{
  int X, Y;
  
  X = pX + (_i * (2 * midaInvadersX));
  Y = pY + (_j * (2 * midaInvadersY));
  rect (X+(midaInvadersX/4), Y+(midaInvadersY/4), midaInvadersX, midaInvadersY);
  ellipse (X+(midaInvadersX/2), Y+(midaInvadersY/2), midaInvadersX, midaInvadersY);
}

boolean QuedenInvaders ()
{
  boolean a;
  a = numInvadersVius > 0;
  return a;
}
  
void  EscriuPuntuacio()
{
  int punts;
  
      textSize(20);
      punts = numInvadersEnX * numInvadersEnY - numInvadersVius;
      text("Invaders caiguts:"+punts, 30, height-50);
      text("Número de trets:"+numTretsDisparats, 30, height-30);

}
  
void  EscriuPuntuacioFinal()
{
  int punts;
  
      textSize(50);
      punts = (numInvadersEnX * numInvadersEnY - numInvadersVius)*20 -  numTretsDisparats *5;
      if (punts == 0)     text("GAME OVER", width/2 - 50, height/2);
      else  text("La puntuació és:"+punts, 30, height/2);
}


