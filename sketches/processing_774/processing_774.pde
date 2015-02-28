
// import processing.serial.*;

/*  Prinzip : Turtle von LOGO.    */

float TurtleX;
float TurtleY;
int dir;

color bg;

boolean StiftHoch =  false; 

/* =====================     TOOLS            ================================ */

void setup() {

  size(600, 600 );
  bg = color(255, 0, 0 );  
  color (bg);    
  background(110);

  TurtleX = width / 2; 
  TurtleY = height / 2; 
  dir = 0 ; 

  smooth();

}

void MyDelay(float Wert)
{
  float m = millis();
  float a = millis();
  int i=0; 
  delay (4); 
  while ( m + Wert > a )
  {
    // do nothing
    i+=1;
    i-=1; 
    a = millis();
  }
}

boolean Zufall1(int grenze){
  /*  Zufallsentscheidung; "Grenze" gibt die Wahrscheinlichkeit
   an, je höher desto unwahrscheinlicher, 5000 ist jedes zweite Mal;
   10 000 ist konstant                     */
  boolean Zufall1a;
  if (random ( 10000 ) > grenze)
  { 
    Zufall1a  = true; 
  }
  else {
    Zufall1a  = false; 
  }
  return Zufall1a; 
} 

// ==========================================================================================
// Ende Tools 

// ==========================================================================================
// Begin Turtle-Basics 

void huepfzu ( int a,  int b   ) {
  TurtleX = a;
  TurtleY = b;
}

void vw(int Strecke){

  // forward 
  float xNeu;
  float yNeu;
  float WinkelBogenmass;
  int myLine;


  WinkelBogenmass = radians (dir) ;

  xNeu = ( TurtleX + (Strecke * cos(WinkelBogenmass)));
  yNeu = ( TurtleY + (Strecke * sin(WinkelBogenmass)));

  if (!StiftHoch){
    stroke (bg);
    line ( TurtleX , TurtleY, xNeu, yNeu);
  }
  TurtleX = xNeu;
  TurtleY = yNeu;

}

void re(int Winkel)
{   // right 
  dir += Winkel;
}

/* --------------------------------------------------------------------------- */

void LiesKey (){

  switch(key) {
  case 'c': 
    // clear
    fill (110); 
    rect (0,0,width, height); 
    break;
  case 's': 
    // Screenshot
    save("Test1.tif");
    break;    
  case 'p': 
    // pause
    delay (1113);
    int i=0;
    while (true) {
      if (keyPressed == true ) {
        break;
      }
      i = i+1 ; 
      i = i-1 ;
    }
    break;
  case 'q': 
    // quit
    exit();
    break;
  default:
    break;
  }

}

// ==========================================================================================
// Beginn Turtle-Programme  

void Quadrat(int I1)
{
  StiftHoch = false; 
  for (int i = 0; i < 4; i = i+1)  
  {    
    vw (I1);
    re (90);
  }
}

void Quadrat2()
{
  int L = 60 ; 

  StiftHoch = false; 
  for (int i = 0; i < 8; i = i+1)  
  {    
    vw (L);
    re (60);
  }
}

void Quadrat3()
{
  int L = 30 ; 

  StiftHoch = false; 
  for (int i = 0; i < 19; i = i+1)  
  {    
    Quadrat(L); 
    re (20);
  }
}

void Quadrat4()
{
  int L = 60 ; 

  StiftHoch = false; 
  for (int i = 0; i < 100; i = i+1)  
  {    
    Quadrat(i*3); 
    re (20);
  }
}

// ==========================================================================================
// Hauptprogramm 

void draw()
{
  StiftHoch = false; 
  Quadrat(240); 
  delay (2200);  
  Quadrat2(); 
  MyDelay (3200);  
  Quadrat3(); 
  MyDelay (3200);  
  Quadrat4(); 
  noLoop();
  if ( keyPressed == true )  { 
    LiesKey();
  }   
} 


