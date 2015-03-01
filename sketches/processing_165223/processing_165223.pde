
/*Hola profe
 Revisando un poco el curso, creo que en general me siento un poco adelantado.
 Yo vi conceptos de programación en mi pregrado, y de ahí, vengo
 trabajando en Processing desde hace un buen rato. Se me ocurre
 presentarte el siguiente ejercicio cubriendo una buena parte del 
 temario. Basicamente funciona utilizando bucles para crear y pintar las Ventanas.
 Cada ventana se genera con un color random, que se puede volver a randomizar haciendo clic en cada una. 
 Utilizando barra espaciadora se randomizan todas (técnicamente se reinicia la aplicacion).
 Todas las ventanas son modulares (Asi como la aplicacion en si). Existe una clase 
 ventana para controlar cada ventana y una clase Lógica en donde se genera 
 (como su nombre lo dice) todo el procesamiento.
 
 Igualmente proponerte ejercer un proyecto personal. 
 Lo último que estuve haciendo en este entorno fue recibir unas señales
 de un kinect, las cuales recibía en crudo. En algún momento quise 
 limpiar un poco la señal pero no tuve ni el tiempo ni el conocimiento.
 Si estaría bien, me gustaría empezar por investigar un poco sobre
 procesamiento de señales y su uso en processing. Se que existen
 algunas librerias, pero tambien entiendo que el algoritmo detras de ellas
 no es muy complejo.
 
 Si tienes alguna duda sobre el código o sugerencias, quiza es un poco ineficiente, quedo atento.
 
 Espero que te suene un poco mi propuesta, aunque estoy mas que dispuesto
 a atender a clase si te parece que puede ser positivo para mi.
 
 Saludos,
 
 Juan Felipe Gómez
 */

Logica app;
float modulo = 40; //se genera un modulo inicial, para controlar el tamaño de la app y de las ventanas
float anchoPantalla= modulo*10;
float altoPantalla = anchoPantalla;
float anchoVentana=modulo*2;
float espacio=modulo;

void setup() {
  size((int)anchoPantalla, (int)altoPantalla);
  app = new Logica(this, anchoVentana, modulo);
  app.crear();
}

void draw() {
  background(255);
  app.pintar();
}
void mousePressed() {
  app.mousePressed();
}
void keyPressed() {
  if (key == ' ') {
    app = new Logica(this, anchoVentana, modulo);
    app.crear();
  }
}

public class Logica {
  ArrayList<Ventana> lasVentanas;
  private float es, aV;
  PApplet parent;

  public Logica(PApplet p, float anchoV, float espacio) {
    parent =p;
    aV=anchoV;
    es=espacio;
    lasVentanas = new ArrayList<Ventana>();
  }

  private void crear() {
    for (int i =0;i<3;i++) {
      for (int j=0;j<3;j++) {
        lasVentanas.add(new Ventana(((int) (es*(j+1)+(aV*j) )), ((int)(es*(i+1)+(aV*i))), ((int)random(0, 255)), ((int)random(0, 255)), ((int)random(0, 255)), (aV)));
        /*utilizando el modulo inicial y el ancho de cada ventana, se puede calcular la posicion de cada una por medio de una simple operacion matematica, haciendo uso de los contadores que se generan en el 'for'. En este caso 'j' controla la posicion en X, multiplicandose por los valores del modulo y del ancho, asi como 'i', controla la posicion en Y.*/
      }
    }
  }

  private void pintar() {
    for (int k = 0; k<lasVentanas.size(); k++) {
      Ventana temp = lasVentanas.get(k);
      println( "PosX: "+temp.getX()+"   PosY: "+temp.getY() +"   Size: "+temp.getSais() );
      temp.dibujar();
    }
  }

  private void clicColor() {

    for (int l = 0; l<lasVentanas.size(); l++) {
      Ventana temp = lasVentanas.get(l);
      if (mouseX>temp.getX() && mouseX<(temp.getX()+temp.getSais())) {
        if (mouseY>temp.getY() && mouseY<(temp.getY()+temp.getSais())) {
          temp.randomizeColors();
        }
      }
      /*Usando la informacion misma de las ventanas podemos comparar con la posicion del mouse al hacer clic,
      y si coinciden, llamar el metodo 'randomizeColors' para randomizar los colores de la ventana seleccionada.*/
    }
  }

  public void mousePressed() {
    clicColor();
  }
}

public class Ventana{
  private int posX;
  private int posY;
  private int r;
  private int g;
  private int b;
  private float s;
  
  public Ventana(int x, int y, int red, int green, int blue, float sais){
    posX=x;
    posY=y;
    r=red;
    g=green;
    b=blue;
    s=sais;
  }
  
  void dibujar(){
    fill(r,g,b);
    rect(posX,posY,s,s);
  }
  
  void randomizeColors(){
    r= (int)random(0,255);
    g= (int)random(0,255);
    b= (int)random(0,255);
  }
  
  int getX(){
   return posX;
  }
  
  int getY(){
   return posY;
  }
  
  float getSais(){
   return s;
  }
  
}

