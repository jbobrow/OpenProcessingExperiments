

 
String adivinanza = "", resposta = "cebolla";
boolean correcte = false;
 
void setup()
{
  size(400, 400);
  
  
}
 
void draw()
{
  background(0);
  textSize (32);
  fill (255,0,0);
  text("Fui a la plaza y", 10, 30);
  text("las compre bellas,",10,70);
  text ("llegué a casa",10,110);
  text ("y lloré con ellas",10,150);
  text("respuesta " + adivinanza, 10, 200);
  text("¿Es correcto? " + correcte, 10, 300);
}
 
void keyPressed()
{

  if (key != CODED)
    adivinanza += key.toString();
  if(adivinanza.equalsIgnoreCase(resposta))
    correcte = true;
}



