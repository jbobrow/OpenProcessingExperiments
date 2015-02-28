
void setup() {
  size( 400, 565 );
  background( 255 );
  smooth();
  noLoop();
  
  
stroke(0);
 strokeWeight(10);
 line(50,0,50,540);


bezier( 50, 540, 450, 350, 350, 150, 350, 130 );
   //curve

noStroke();
fill(255,20,0);
rect( 280, 100, 100, 100 );
   //redbox

noStroke();
fill(255,20,0);
rect( 20, 490, 60, 60 );
   //redbox

noStroke();
fill(255,50,0);
triangle(30,130,30,380,200,380);
   //orangetriangle

stroke(0);
strokeWeight(1);
fill(255);
triangle(30,400,390,400,390,450);
   //whitetriangle


stroke(0);
line(390,400,390,550);

noStroke();
fill(0);
quad( 30, 108, 65, 80, 275, 380, 220, 380 );
   //blackbox

noStroke();
fill(0);
quad( 73, 140, 30, 108, 150, 12, 180, 56 );
   //blackbox


int eSize = 10; 
smooth();

for(int c=0; c<=width; c+=20){
 
  if(c == 60 || c == 340){ 
    fill(255);  
  }
  else{  
    fill(0); 
  }
  rect(c, 500, eSize, eSize);
}


noStroke();
 fill(0);
 quad( 60, 308, 100, 265, 140, 308, 100, 350 );
  //blackbox on orangebox
  
noStroke();
fill(0);
rect( 335, 490, 20, 20 );
   //blackbox migisita

  
}



 
void draw() {
 
  int eSize = 32;
  int X = 150;
  int Y = 100;
     //position
 
  float d = 27;
  float e = 41;
   //kakudo
   
  int f = width + eSize;
  int g = height + eSize;
 
  stroke( 150, 60, 80, 100 );
  fill( 150, 60, 80, 70 );
 
  float a = X;
  float b = Y;
 
  a = X;
  b = Y;
 
  while( a < f && b < 360 ) {
    drawShape( a, b, eSize );
    a = a + d;
    b = b + e;
  }
 
}
 
void drawShape( float centerX, float centerY, int drawSize )
{
  fill(0);
  rect( centerX, centerY, drawSize, drawSize );
   //blackbox repeat
}









