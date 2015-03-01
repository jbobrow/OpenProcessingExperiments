
//Variables CRONOMRTROOOOOOO
PImage fons1, fons2, fons3, fons4, fonsGO;
Boto b1, b2, b3, b4;
Temps cronometre;
int pantalla=1;


//Metodo setup
void setup(){
  size(800, 600);
  //Cargamos las fotos en las variables de tipo PImage que hemos creado;
  fons1 = loadImage("mario1.jpg");
  fons2 = loadImage("mario2.jpg");
  fons3 = loadImage("mario3.jpg");
  fons4 = loadImage("mario4.png");
  fonsGO = loadImage("gameover.png");
  //Creamos 4 objetos boton distintos con la plantilla Boto.
  b1 = new Boto(125, color(255,0,0), 1,"MUNDO 1");
  b2 = new Boto(275, color(0,255,255), 2,"MUNDO 2");
  b3 = new Boto(425, color(255,255,0), 3,"MUNDO 3");
  b4 = new Boto(575, color(255,0,255), 4,"MUNDO 4");
  
  cronometre = new Temps();

}
//Si pantalla es igual a 1, que cargue el metodo fondo1(), y asi succesivamente;
void draw(){
   switch(pantalla){
      case 1: fondo1(); break;
      case 2: fondo2(); break;
      case 3: fondo3(); break;
      case 4: fondo4(); break;
     
   }
     cronometre.dibuixaComptaEnrere();
     if (cronometre.fiEnrera()){
        fondoGO();
      }
}
 //Cuando clicamos con el raton llamamos al metodo apreta de cada de los 4 botones
void mousePressed(){
  b1.apreta();
  b2.apreta();
  b3.apreta();
  b4.apreta();
}




  
  

//CLASE O PLANTILLA

//Variables
class Boto {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fonBoto;
  String texte;
  

 //Metodo constructor Boto, con el cual creamos el objeto con los valores que queramos
  Boto(float x, color col, int inici, String t ){    
    
    fonBoto = createFont("Forte", 20);
    textFont(fonBoto);
    xPos = x;
    yPos = 500;
    c = col;
    widthB = 115;
    heightB = 30;
    pantallaActual = inici;
    texte = t;
    
  }
  //Metodo dibuixa, el cual se encarga de dibujar los botones
  void dibuixa( int colorBorde, int anchuraBorde){
    
    stroke(colorBorde);
    strokeWeight(anchuraBorde);
    fill(c, 1000);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(0);
    text (texte, xPos + 10, yPos + 20);
  }
  
  //Metodo apreta, en el cual definimos que depeniendo en que posicion clicamos con el raton, que vaya a una pagina o a otra.
  void apreta(){
    if ((125 <= mouseX && mouseX <= 125 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 1;
      
    }
    if ((275 <= mouseX && mouseX <= 275 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 2;
    }
    if ((425 <= mouseX && mouseX <= 425 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 3;
    }
    if ((575 <= mouseX && mouseX <= 575 + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB)){
      pantalla = 4;
    }
  }

}
class Temps{
  int principi;
  int enrera;
  Temps(){
    principi = millis();
    enrera = 10000 + principi;
  }
  
  void reiniciaEnrera(int segons){
    enrera = millis() + segons * 1000;
  }
  int segons(){
    return (int)((millis() - principi)/ 1000)%60;
  }
  int minuts(){
    return (int)((millis() - principi)/ 60000);
  }
  
  int minutsEnrera(){
      int resultat = (int)((enrera-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int segonsEnrera(){
    int resultat = (int)((enrera-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
  
  boolean fiEnrera(){
    return minutsEnrera() == 0 && segonsEnrera() == 0;
  }

  

  void dibuixaComptaEnrere(){
    fill(0);
    text(minutsEnrera()+":"+segonsEnrera(), 700, 50);
  }
  void reinicia(){
    principi = millis();
  }

  
}
//Metodo fondo1, el cual muestra la imagen del primer fondo, los cuatro botones, y remarcando el boton 1 cambiandole el color y la anchura del borde.

void fondo1() {
  image(fons1,0,0);
    b1.dibuixa(255,5);
    b2.dibuixa(0,2);
    b3.dibuixa(0,2);
    b4.dibuixa(0,2);
    
}
//Metodo fondo2, el cual muestra la imagen del segundo fondo, los cuatro botones, y remarcando el boton 2 cambiandole el color y la anchura del borde.
void fondo2() {
  image(fons2,0,0);
    b1.dibuixa(0,2);
    b2.dibuixa(255,5);
    b3.dibuixa(0,2);
    b4.dibuixa(0,2);
}
//Metodo fondo3, el cual muestra la imagen del tercer fondo, los cuatro botones, y remarcando el boton 3 cambiandole el color y la anchura del borde.
void fondo3() {
  image(fons3,0,0);
    b1.dibuixa(0,2);
    b2.dibuixa(0,2);
    b3.dibuixa(255,5);
    b4.dibuixa(0,2);
}
//Metodo fondo4, el cual muestra la imagen del cuarto fondo, los cuatro botones, y remarcando el boton 4 cambiandole el color y la anchura del borde.
void fondo4() {
  image(fons4,0,0);
    b1.dibuixa(0,2);
    b2.dibuixa(0,2);
    b3.dibuixa(0,2);
    b4.dibuixa(255,5);
}
void fondoGO() {
  image(fonsGO,0,0);
  
    }


