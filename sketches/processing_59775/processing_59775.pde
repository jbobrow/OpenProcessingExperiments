
PFont miVariableTipo1; //declaro variable
int posX;
int posY;
int incremento;

void setup()
{
size (500,500);
smooth();
miVariableTipo1=loadFont("HelveticaNeue-UltraLight-72.vlw"); //cargar tipografía


frameRate(30);
posX=10;
posY=500;
incremento=0;
}

void draw()
{
  
  textFont(miVariableTipo1,incremento);

background(0);

text("A", posX,posY);

posX=posX+1;
incremento++;

if (posX>=400){
  posX=posX-3;
incremento=incremento-4;
}
 

}





