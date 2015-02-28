
String[]  mensajes;
float posx;
int indice;

void setup()
{
  
  size (500,356);
  
  mensajes = new String [4];
  
    mensajes[0] = "\"No contaban con mi astucia\"";
     mensajes[1] = "\"¡Fue sin querer queriendo!\"";
 mensajes[2] = "\"¡Ahora sí te descalabro los cachetes!\"";
 mensajes[3] = "\"¡Bueno pero no se enoje\"";



posx=0;
indice=0;

}
void draw()
{
 background(255, 233, 0);
 
pushMatrix();
 translate (105,170);
  image (loadImage ("url.png"),0,0);
 popMatrix();


fill (0,0,0,250);
noStroke ();
rect(0,0, width,140);

PFont f= loadFont("Nadeem-28.vlw");

textFont(f,40);
fill(255,255,255,180);
text("Chapulin Colorado",20,60);

fill(255,255,255,120);
text(mensajes [indice], posx,120);

posx=posx-5;

if (posx < 0- textWidth("\"El riesgo es que te quieras quedar\""))
{
  posx=550;
  indice =indice +1;
  if (indice >=4)
  {
    indice=0;
  }
}
}



