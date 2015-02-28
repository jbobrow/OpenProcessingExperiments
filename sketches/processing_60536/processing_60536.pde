
PFont miVariable;
PFont miVariable2;

String wheniwasakid = "When I was a kid";
String i= "I was taught,";
String never= "never run";
String withawoodenstake= "with a wooden stake.";
String Mirko= "Mirko Stroker";

 
float positionX = 0;
float positionY = 50;
float velX = 1;
 
void setup()
{
  size(800, 300);
  smooth();
  textAlign(CENTER);
  frameRate(40);
miVariable= loadFont("CopperplateGothic-Bold-48.vlw");
miVariable2= loadFont("Croobie-48.vlw");
}
 
void draw()
{
noStroke();
fill(203, 10, 14,18);
//4ta variable permite hacer el degradado
rect(0, 0, width, height);
//frase/tipo de letra 1
textFont(miVariable, 50);
fill(124,6,6);
  positionX = positionX+velX;
   if (positionX<width)
   {
    velX = .95;
   }
   if (positionX>310)
   {
    velX = 0;
   }
    text(wheniwasakid, positionX+100, positionY);
    if(frameCount >= 40)
    {
      text(i, positionX+135, positionY+50);
    }
     if(frameCount >= 80)
   {
    text(never, positionX+170, positionY+100);
   }
    
   if(frameCount >= 120)
   {
     text(withawoodenstake, positionX+205, positionY+150);
   }
//nombre tipo de letra dos
   fill(0);
  textFont(miVariable2, 60);
    
  if(frameCount >= 160)
   {
     text(Mirko, positionX+240, positionY+200);
   }
    
   
 
//letras atras grandes
textSize(180);
fill(255,255,255,10);
   
   
    text(wheniwasakid, positionX+100, positionY+25);
     
    if(frameCount >= 40)
    {
      text(i, positionX+135, positionY+75);
    }
     
   if(frameCount >= 80)
   {
    text(never, positionX+170, positionY+125);
   }
    
   if(frameCount >= 120)
   {
     text(withawoodenstake, positionX+205, positionY+175);
   }
    
   if(frameCount >= 160)
   {
     text(Mirko, positionX+240, positionY+225);
   }
    }


