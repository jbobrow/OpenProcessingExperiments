
String[]  mensajes;
float posx;
int indice;

void setup()
{
  
  size (540,356);
  
  mensajes = new String [2];
  
    mensajes[0] = "\"El riesgo es que te quieras quedar\"";
     mensajes[1] = "\"the only risk is wanting to stay\"";


posx=0;
indice=0;

}
void draw()
{
 
  image (loadImage ("aruaco.png"),0,0);

fill (0,0,0,150);
noStroke ();
rect(0,height-100, width,100);

PFont f= loadFont("MyriadPro-Regular-32.vlw");

textFont(f,40);
fill(255,255,255,150);
text("Colombia",20,height-60);
text(mensajes [indice], posx,height-20);

posx=posx-10;

if (posx < 0- textWidth("\"El riesgo es que te quieras quedar\""))
{
  posx=540;
  indice =indice +1;
  if (indice >=2)
  {
    indice=0;
  }
}
}






