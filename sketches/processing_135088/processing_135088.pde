
/* Taller 2 - Diseñando con algoritmos
 Nombre: Verdant Aurora
 Relizado por: Nicodemus Luna Rojas
 Codigo: 11212041
*/

//>>>>>>Ejecutable<<<<<<
import java.util.*;

Logica app;
/** 
  * Inicio el setup
  */
void setup() {
 //noCursor();
  frameRate(120);
  size(800, 600);
  app= new Logica(); 
}

/** 
  * Inicio el draw
  */
void draw() {
  app.pintar();
}

/** 
  * Inicio el mousePressed
  *
  * Metodo para sujetar los elementos  y para crear los elementos desde el panel de botones
  * 
  */
void mousePressed() {
  app.clic();
}

/** 
  * Inicio el KeyPressed
  *
  * Con la tecla R se resetea la aplicación  
  * 
  * 
  */
void keyPressed() {
  app.teclas();
  if ((key == 'r') || (key == 'R')) {
  app = new Logica();
  }
}
public class Aurora {

  private float velocidad; //Define la velocidad de cambio de las ondas de la aurora
  private float tiempo; //Define el tiempo en que la aurora cambia
  private float radio; //Define el radio de la circunferencia de la aurora
  private float puntos; //Defina la cantidad vertices de la aurora
  private float amplitud; //Define la amplitud de las ondas de la aurora
  private float intensidad; //Define la intensidad de vibracion de la aurora
  private float vibracion; //Define la vibracion de la aurora
  private float xVertice; //Punto X de cada vertice
  private float yVertice; //Punto Y de cada vertice
  private boolean validarColor; //Sirve para cambiar entre la onda gris y la onda verde

  /** 
   * Aurora
   * 
   * Constructor de la clase Aurora
   *
   */
  public Aurora () {
    noiseDetail(8); //Ajusta el nivel de detalle del Perlin noise en 8
    xVertice =1;
    yVertice = 1;
    intensidad = 1;
    amplitud = 1;
    puntos = 1000;
    radio = 300;
    tiempo = 0;
    velocidad = .01;
    validarColor=true;
  }

  /** 
   * pintar
   * 
   * Metodo para pintar la aurora
   *
   * NOTA: Este procedimiento se realizo con ayuda de las siguientes referencias:
   * http://bencrowder.net/blog/2013/05/sine-circle-test-animation
   * http://tex.stackexchange.com/questions/82773/how-to-draw-a-sine-wave-on-a-circular-path-in-tikz
   *
   */
  public void pintar() {
    fill(0, 30);
    noStroke();
    rect(0, 0, width, height);
    translate(width/2, height/2);
    noFill();
    if (validarColor==true) {
      stroke(color(0, random(230, 255), random(100, 255), random(60, 90))); //Pinta la aurora de color verde
    }
    if (validarColor==false) {
      stroke(color(random(100, 150), random(60, 90))); //Pinta la aurora de color gris
    }
    strokeWeight(5);
    /* Toma el valor de mouseX y reasigna la variable intensidad en proporcion
     del ancho de la pantalla y retorna un rango asginado de valores*/
    intensidad = map(mouseX, 0, width, 0.5, 0.1);
    /* Toma el valor de mouseY y reasigna la variable amplitud en proporcion 
     del alto de la pantalla y retorna un rango asignado de valores*/
    amplitud = map(mouseY, 0, height, 0.5, 0.1);

    beginShape(); //Empieza a dibujar la forma
    for (float a=0; a<=TWO_PI; a+=TWO_PI/puntos) { //Recorre varios puntos para crear una circunferencia
      /* La funcion Perlin noise toma un rango de valores y por medio de la sucesion pseudo-randomica map,
       reasigna la variable vibracion en proporcion de un rango asignado y la amplitud*/
      vibracion = map(noise(cos(a)*intensidad+1, sin(a)*intensidad+1, tiempo), 0.0, 1.0, amplitud, 1.0); 
      xVertice = cos(a)*radio *vibracion; //Define la posicion x de los vertices
      yVertice = sin(a)*radio *vibracion; //Define la posicion y de los vertices 
      vertex(xVertice, yVertice); //Pinta los vertices
    } 
    endShape(CLOSE); //Termina de dibujar la forma
    tiempo += velocidad; //Aumenta el tiempo de acuerdo a la velocidad
  }

  /** 
   * validarColor
   * 
   * Metodo para validar el color de la aurora
   * Retorna true
   *
   *@validColor boolean validColor sirve para intercambiar entre el color gris y el verde
   *@retorno boolean true
   *
   */
  public boolean validarColor (boolean validColor) {
    this.validarColor=validColor;  
    return true;
  }
}

public class Elemento {
  public float posX, posY, velocidad, angulo, distancia;
  public float rotacion, tamano;

  /** 
   * Luz
   * 
   * Constructor de la clase Elemento
   *
   */
  public Elemento (int tamano, float distancia) {
    this.tamano=tamano;  
    this.distancia=distancia;
  }

  /** 
   * pintar
   * 
   * Metodo para pintar los elementos (moleculas)
   *
   *@x float x posicion en x del elemento (molecula)
   *@y float y posicion en y del elemento (molecula)
   *
   */
  public void pintar (float x, float y) {
   rotar(x, y);
  }

  /** 
   * rotar
   * 
   * Metodo para rotar los elementos (moleculas)
   *
   *@x float x posicion en x del elemento (molecula)
   *@y float y posicion en y del elemento (molecula)
   *
   */
  public void rotar(float x, float y) { //Con esto giran las moleculas al rededor de la tierra
  }
  
  public float getPosX() {
    return posX;
  }
  public float getPosY() {
    return posY;
  }
  public void setPosX(float x) {
    posX=x;
  }
  public void setPosY(float y) {
    posY=y;
  }
}

public class Logica {

  private String[] lineas;
  private ArrayList <Molecula> moleculas;
  private int[] dirRotacion = {-1, 1}; //Selecciona una variable para definir el sentido de la rotacion
  private Parrafo parrafos;
  private Aurora miAurora;
  private Tierra miTierra;
  private int colorTierra;
  private float radioLuz = 10; //Radio del circulo que forma el radio de luz
  private int longitud = 25; //Longitud y duracion del trazo de luz
  private boolean validarColor;
  private boolean validarLuz;
  private PFont fuente;
  private boolean mostrarInstrucciones;
  private Luz miLuz = new Luz(0, 0);
  private Luz[] rastro = new Luz [longitud]; //Arreglo que genera el efecto de un rastro de luz

  /** 
   * Logica
   * 
   * Constructor de la clase Logica
   *
   */
  public Logica() {
    miAurora= new Aurora();
    parrafos = new Parrafo();
    String textoAurora = join(parrafos.getParrafo(), " "); //Une las palabras
    lineas = split(textoAurora, " "); //Separa cada palabra
    moleculas = new ArrayList<Molecula>();
    for (int i=0;i<lineas.length;i++) {    
      if (lineas[i].startsWith("moleculas") || lineas[i].startsWith("particulas") || lineas[i].startsWith("electrones")) {
        moleculas.add(new Molecula((int)random(8, 20), (int)random(210, 400), dirRotacion[(int)random(dirRotacion.length)], (float)random(0.05, 0.1), "moleculas"));
      }
    }
    validarColor=true;
    validarLuz=false;
    fuente = loadFont("Raleway-Light-25.vlw");
    mostrarInstrucciones=true;
    for (int i = 0; i < longitud; i ++) {
      rastro[i] = miLuz;
    }
    miTierra= new Tierra();
  }

  /** 
   * pintar
   * 
   * Metodo para pintar los elementos
   *
   */
  public void pintar() {
    miAurora.pintar();
    translate(-(width/2), -(height/2)); //Vuelve a trasladar todos los elementos al punto 0,0
    for (int i = longitud - 1; i > 0; i -= 1) {
      rastro[i] = rastro [i - 1];
      rastro[i].pintar(radioLuz * (longitud - i) / longitud);
    }
    rastro[0] = miLuz;
    for (int b=0; b<lineas.length; b++) {
      if (lineas[b].startsWith("luz")) {
        miLuz = new Luz (mouseX, mouseY);
        noCursor();
      }
    }
    miLuz.pintar(radioLuz);
    if (dist(mouseX, mouseY, miTierra.getPosX(), miTierra.getPosY())<miTierra.getRadioMiTierra() && miTierra.getColorTierraRojo()==false) {
      miTierra.setColorTierraRojo(true);
    } 
    else if (dist(mouseX, mouseY, miTierra.getPosX(), miTierra.getPosY())>miTierra.getRadioMiTierra() && miTierra.getColorTierraRojo()==true) {
      miTierra.setColorTierraRojo(false);
    }
    for (int b=0; b<lineas.length; b++) {
      if (lineas[b].startsWith("tierra")) {
        if (miTierra.getColorTierraRojo()==false) { 
          miTierra.pintar(map(mouseX, 0, height, 120, 200), map(mouseY, 0, height, 255, 150));
        }
        if (miTierra.getColorTierraRojo()==true) {
          miTierra.pintar(map(mouseX, 0, height, 120, 200), map(mouseY, 0, height, 255, 200));
        }
      }
    }
    for (int i=0;i<moleculas.size();i++) {
      moleculas.get(i).pintar(width/2, height/2);
    }
    if (mostrarInstrucciones==true) {
      instrucciones();
    }
  }

  public void instrucciones() {
    fill(0, 0, 0, 100);
    rect(0, 0, 800, 600);
    textAlign(CENTER);
    fill(255);
    textFont(fuente, 32);
    text("VERDANT AURORA", 190, 50);
    textAlign(LEFT);
    textFont(fuente, 16);
    text("-Las moleculas estan conectadas con las palabras <<particula, electron y molecula(s)>> de un documento de texto .\n-Al hacer clic sobre las moleculas, estas se desaparecen y hacen que las palabras antes mencionadas se cambien a mayusculas.\n-La aurora cambia a color gris con la tecla <<B>>, esto hace que las palabras <<color>> del texto cambien a <<gris>>, para restablecer las palabras y el color se debe presionar la tecla <<C>> \n-La aurora y la tierra cambian con la posicion del mouse.\n-El circulo central (La tierra) cambia de color al posicionar el mouse sobre el.\n-Al hacer clic sobre la tierra, esta se desaparece y las moleculas que giran a su alrededor cambian el sentido de su rotacion. \n-Cuando se hace clic sobre la tierra, la palabra <<tierra>> se convierte a mayuscula. \n-Cuando no esta presente la palabra <<tierra>> en el documento de texto, no se dibuja la tierra. \n-Cuando no esta presente la palabra <<luz>> en el documento de texto, no se pinta el rastro de luz en el cursor. \n-La aplicacion se resetea con la tecla <<R>>. \n-Todos los cambios se guardan en un documento de texto dentro de la carpeta principal de la aplicacion. \n-Para quitar esta pantalla de instrucciones presiona la tecla <<I>>.", 
    50, 120, 700, 600);
  }


  /** 
   * quitarMoleculas
   * 
   * Metodo para desaparecer las moleculas y cambiar las palabras por mayusculas
   *
   */
  public void quitarMoleculas() {
    for (int a=0; a<moleculas.size(); a++) {
      if (dist(mouseX, mouseY, moleculas.get(a).getPosX(), moleculas.get(a).getPosY())<30) {
        for (int b=0; b<lineas.length; b++) {
          if (lineas[b].startsWith("moleculas")) {
            lineas[b]="MOLECULAS";
          }
          if (lineas[b].startsWith("particulas")) {
            lineas[b]="PARTICULAS";
          }
          if (lineas[b].startsWith("electrones")) {
            lineas[b]="ELECTRONES";
          }
        }
        moleculas.remove(a);
        guardarPalabras();
      }
    }
  }

  /** 
   * cambiarSentidoMoleculas
   * 
   * Metodo para cambiar el sentido de la rotacion de las moleculas y cambiar las palabras por mayusculas
   *
   */
  public void cambiarSentidoMoleculas() {
    for (int a=0; a<moleculas.size(); a++) {
      if (dist(mouseX, mouseY, miTierra.getPosX(), miTierra.getPosY())<miTierra.getRadioMiTierra()) {
        for (int b=0; b<lineas.length; b++) {
          if (lineas[b].startsWith("tierra")) {
            lineas[b]="TIERRA";
          }
        }
        moleculas.get(a).setDir();
        guardarPalabras();
      }
    }
  }


  /** 
   * mouseCrearElementos
   *
   * Metodo para crar los elementos con el clic
   * 
   */
  public void clic() {
    println(mouseX + " " + mouseY);
    quitarMoleculas();
    cambiarSentidoMoleculas();
  }

  /** 
   * guardarPalabras
   * 
   * Metodo para guardar las palabras modificadas en un documento de texto
   *
   */
  public void guardarPalabras() {
    String gTexto="";
    for (int i=0; i<lineas.length; i++)
      gTexto +=" "+lineas[i];
    String[] gTextos = split(gTexto, ".");
    saveStrings("parrafosSalida.txt", gTextos);
  }

  /** 
   * teclas
   *
   * Metodo para mostrar la pantalla de instrucciones y pintar la aurora
   *
   */
  public void teclas() {
    if ((key == 'i')|| (key == 'I') && mostrarInstrucciones==true) {
      mostrarInstrucciones=false;
    }
    if ((key == 'b')|| (key == 'B') && miAurora.validarColor(true)) {
      miAurora.validarColor(false);
      for (int b=0; b<lineas.length; b++) {
        if (lineas[b].startsWith("color")) {
          lineas[b]="gris";
        }
        guardarPalabras();
      }
    }
    else if ((key == 'c')|| (key == 'C') && miAurora.validarColor(true)) {
      miAurora.validarColor(true);
      for (int b=0; b<lineas.length; b++) {
        if (lineas[b].startsWith("gris")) {
          lineas[b]="color";
        }
        guardarPalabras();
      }
    }
  }
}

public class Luz {

  float posX;
  float posY;

  /** 
   * Luz
   * 
   * Constructor de la clase Luz
   *
   */
  public Luz (float pX, float pY) {
    posX = pX;
    posY = pY;
  }

  /** 
   * pintar
   * 
   * Metodo para pintar la luz
   *
   *@radioLuz float radioLuz radio de la circunferencia de la elipse que pinta la luz
   *
   */
  public void pintar(float radioLuz) {
    stroke(color(random(240, 245), random(255, 255), random(90, 196), random(0, 10)));
    fill(color(random(240, 245), random(255, 255), random(90, 196), random(60, 90)));
    ellipse(posX, posY, 2 * radioLuz, 2 * radioLuz);
  }
}

public class Molecula extends Elemento {

  private float posX, posY, tamano;
  private float dir;
  private boolean validar;
  private String palabra;

  /** 
   * Molecula
   * 
   * Constructor de la clase Molecula
   *
   *@tamano int tamano tamano de cada molecula
   *@distancia float distancia entre el centro del planeta y la molecula
   *@direccion int direccion de rotacion de cada molecula
   *@vel float vel velocidad de rotacion de cada molecula
   *@palab string palab relaciona las moleculas con el texto para despues modificarlo
   *
   */
  public Molecula (int tamano, float distancia, int direccion, float vel, String palab) {
    super(tamano, distancia);
    velocidad=vel*direccion;
    palabra=palab;
    dir=direccion;
  }

  /** 
   * pintar
   * 
   * Metodo para pintar cada molecula
   *
   *@x float x posicion en x del elemento (molecula)
   *@y float y posicion en y del elemento (molecula)
   *
   */
  public void pintar(float x, float y) {
    rotar(x, y);
    ellipse(posX, posY, 15, 15);
  }

  public void rotar(float x, float y) { 
    angulo+=velocidad;
    posX= (distancia * cos(angulo)+x);
    posY= (distancia * sin(angulo))+y;
  }

  /** 
   * Metodo "getPalabra"
   * 
   *@retorno true Retorna el string palabra
   *
   */
  public String getPalabra() {
    return palabra;
  }
  
  /** 
   * Metodo serDir
   *
   * Con este metodo se cambia el sentido de la rotacion de las moleculas 
   *
   */
  public void setDir() {
    velocidad*=-1;
  }

  public float getPosX() {
    return posX;
  }
  public float getPosY() {
    return posY;
  }
  public void setPosX(float x) {
    posX=x;
  }
  public void setPosY(float y) {
    posY=y;
  }
}

public class Parrafo{
  
  private String[] parrafo;
  private char[] letra;
  
 /** 
  * Palabra
  * 
  * Constructor de la clase Palabra
  *
  */
  public Parrafo (){
    parrafo = loadStrings("parrafos.txt");
    for (int i=0; i<parrafo.length;i++) {
      letra = parrafo[i].toCharArray();
    }
  }
  
 /** 
  * pintar
  * 
  * Metodo pintar
  *
  */
  public void pintar(){

  }
  
 /** 
  * Metodo "getString"
  * 
  * Metodo para usar la informacion del documento de texto
  * Retorna el documento de texto con los parrafos
  *
  */
  public String[] getParrafo(){
    return parrafo;
  }
  
}
public class Tierra {

  private float posX;
  private float posY;
  private float radioMiTierra;
  private boolean colorTierraRojo;

  /** 
   * Tierra
   * 
   * Constructor de la clase Tierra
   *
   */
  public Tierra () {
    posX = width/2; //Ubica a la tierra en el centro del lienzo
    posY = height/2; //Ubica a la tierra en el centro del lienzo
    colorTierraRojo=false;
  }

  /** 
   * pintar
   * 
   * Metodo pintar
   *
   *@radioTierra float radioTierra Mofifica el radio del circulo de la tierra 
   *@colorTierra float colorTierra Modifica el color de la tierra
   *
   */
  public void pintar(float radioTierra, float colorTierra) {
    radioMiTierra=radioTierra;   
    if (colorTierraRojo==false) {
      fill(0, colorTierra, colorTierra, 5); //Define el color del resplandor de la tierra
    }
    if (colorTierraRojo==true) {
      fill(colorTierra, 20, 20, 5); //Define el color del resplandor de la tierra
    } 
    for (int i=0;i<15;i++) {  //Hace que la tierra adquiera un resplandor
      ellipse(posX, posY, radioTierra+(i*5), radioTierra+(i*5)); //Pinta varias elipses concentricas para lograr un resplandor
    }
    //draws ellipse 
    noStroke();
    if (colorTierraRojo==false) {
      fill(0, colorTierra, colorTierra, 100); //Define el color de la tierra
    }
    if (colorTierraRojo==true) {
      fill(colorTierra, 50, 40, 100); //Define el color de la tierra
    }
    ellipse(posX, posY, radioTierra, radioTierra); //Pinta a la tierra
  }

  public float getPosX() {
    return posX;
  }
  public float getPosY() {
    return posY;
  }
  public void setPosX(float x) {
    posX=x;
  }
  public void setPosY(float y) {
    posY=y;
  }  
  public float getRadioMiTierra() {
    return radioMiTierra;
  }

  public boolean getColorTierraRojo() {
    return colorTierraRojo;
  }
  public void setColorTierraRojo(boolean c) {
    colorTierraRojo=c;
  }
}



