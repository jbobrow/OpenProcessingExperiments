
PFont miVariableTipo1;
int posX;
int posY;
int posX2;
int posY2;
int incremento;
int decremento;
void setup()
{
  miVariableTipo1=loadFont("Magneto-Bold-48.vlw");
 
background(0);
size(600,300);
  textFont(miVariableTipo1);
  frameRate(15);
  posX=10;
  posY=100;
  posX2=590;
  posY2=200;
  
  decremento=0;
  
  incremento=0;
}
void draw()
{
  background(0);
     if (mousePressed){
       posX=10;
       incremento=0;
     }
     if (mousePressed){
       posX2=590;
       decremento=0;
     }
  fill(250);
  text("Q",posX,posY);
  text("U",posX+(incremento),posY);
  text("E",posX+(incremento)*2,posY);
  text("E",posX+(incremento)*3,posY);
  text("N",posX+(incremento)*4,posY);
  
  fill(200,100,50);
  text("!",posX2,posY+100);
  text("O",posX2+(decremento),posY+100);
  text("V",posX2+(decremento)*2,posY+100);
  text("I",posX2+(decremento)*3,posY+100);
  text("V",posX2+(decremento)*4,posY+100);
  fill(250);
  text("N",posX2+(decremento)*5,posY+100);
  text("E",posX2+(decremento)*6,posY+100);
  text("!",posX2+(decremento)*7,posY+100);

  posX2=posX2-1;
  decremento--;
  posX=posX+1;
  incremento++;
  
}

