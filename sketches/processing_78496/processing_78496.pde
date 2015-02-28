
//Bolitas Processing

PFont Bradley;
char[] Puntuacion = {'P', 'u', 'n', 't', 'u', 'a', 'c', 'i', 'o', 'n', ':'};
char[] Ganado = {'G', 'a', 'n', 'a', 's', 't', 'e', '!'};

int i, j=20, Score=0, X=40, Y, CaidaVertical = 1;

void setup()  

{
  size(800, 800);
  noFill();
  smooth();
  background(255);
  frameRate(30);

  Bradley = loadFont("BradleyHandITC-48.vlw");
  
}

void draw()  

{
  
  background(255);
  textFont(Bradley, 70);
  
  //Marcador Fijo

  fill(255);
  rect(420, 745, 340, 35);

  //Marcador Dinamico

  fill(255, 0, 0);
  rect(420, 745, 0+Score, 35);
  
  //Bolitas
  
  strokeWeight(4);
  fill(random(255), random(255), random(255));
  ellipse(X, Y, 40, 40);
  Y += 10;
  
  if(Y==690)
  
  {
   
   X=int(random(800));
   Y=0; 
    
  }
  
  //Canasta
  
  rect(mouseX, 625, 70, 70);  
    
  //Borde
  
  fill(255, 255, 0);
  rect(0, 700, 800, 20);
  
  //Puntuacion
  
  fill(0);
    
  text (Puntuacion[0], 20, 780);
  text (Puntuacion[1], 60, 780);
  text (Puntuacion[2], 100, 780);
  text (Puntuacion[3], 150, 780);
  text (Puntuacion[4], 180, 780);
  text (Puntuacion[5], 220, 780);
  text (Puntuacion[6], 260, 780);
  text (Puntuacion[7], 290, 780);
  text (Puntuacion[8], 310, 780);
  text (Puntuacion[9], 340, 780);
  text (Puntuacion[10], 385, 775);
  
  //Encesta
  
  fill(0);
  
  if( (X >= mouseX) && (X <= (mouseX + 70) ) && (Y >= 630) )
  
  {
    
  Score += 5;
    
  }
  
  if(Score == 340)
  
  {
   
   noLoop();
   
   background(0);
  
   textFont(Bradley, 120);
   fill(255, 0, 0);
  
   text (Ganado[0], 120, 400);
   text (Ganado[1], 220, 400);
   text (Ganado[2], 280, 400);
   text (Ganado[3], 360, 400);
   text (Ganado[4], 420, 400);
   text (Ganado[5], 480, 400);
   text (Ganado[6], 540, 400);
   text (Ganado[7], 600, 400);
  
  }

  
    
}




