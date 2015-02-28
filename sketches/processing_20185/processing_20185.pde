
PFont font;
String poema = "Separe lentamente los jirones de mi piel\n uno por uno\n observe mis manos ensangrentadas\n turbio manantial brotando de mis entrañas\n poco tiempo me mantuve en  pie\n lo que una vez fui, desaparecio y fue renovado\n purificada en granate\n no senti ni dude al regresar sobre mis pasos\n aun sabiendo la inexorable manera en que las cosas siguen su curso";

void setup()
{
  size(192,157);
 
font = loadFont ("Arial-Black-10.vlw");
textFont (font);
}
 
void draw()
{
  background(#D80F2A);
  fill(#000000);
  text ( poema, 0 , 0, mouseX, 192);
}

                
                                                                
