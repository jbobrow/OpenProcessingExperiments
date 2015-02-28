
size (500, 500); 
background (251,243,230);  
smooth(); 
noStroke();

// Definição de parametros de coordenadas

float x1;
float x2;
float y1;
float y2;
float n1;
float n2;

// Parametros de espaçamento

int step;
 
x1 = 100;
x2 = width-100;

y1 = 100;
y2 = height-100;

n1 = 0;
n2 = width;
step = 10;

// Controlo de loop e background de rectangulos

fill(242,170,170);
stroke(244,211,151);
strokeWeight(25);
float stepSize = 10.0/ step;
for ( float t = 0; t<= 10;  t = t + stepSize)
{
          // Float interpolant = n1 + t*(n2 - n1)
          float interpolant = n1 + (t*0.1) *(n2 - n1);
          // Usamos (t*0.1) para que o loop varie de 0 para 1 e não para 10
         
          println(interpolant);
          println(t);
        rect(interpolant,interpolant,50,700);
         }
         
// Corpo da bolacha (grelha)

fill(200,145,82);
noStroke();
for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          
        
          println(x);
          ellipse ( x,y, 50,50);
            
          
      }}

// Buracos da bolacha (grelha)

for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          
        
          println(x);
         
       stroke(208,162,111);
       strokeWeight(7);
          point ( x,y);
            
          
      }}
      
// Texto aplicado (INTEGRAL)

      PFont f;
      f = loadFont("BookmanOldStyle-Bold-50.vlw");
      textFont(f,50);
      fill(159,99,53);
      text("INTEGRAL",113,266);
      fill(159,99,53);
      text("INTEGRAL",119,272);
      fill(220,166,105);
      text("INTEGRAL",116,269);

