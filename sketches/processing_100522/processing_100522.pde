
/*Taller 5 Fundamentos de Programación para el Diseño
 Alejandro Sanclemente Tenorio
 12112025*/

Logica app;


void setup () {
  size(800, 600);
  app = new Logica ();
}

void draw() {
  background(100);
  app.ejecutar();
}

void mouseReleased() {
  app.click();
}

void keyPressed() {
  app.teclado();
}
public class AtaqueEnemigoA {
  private PImage hulkAtaque;
  //Coordenadas ataque Hulk
  private int posX;
  private int posY;
  private int velocidad;
  private boolean ver;

  public AtaqueEnemigoA(int posX, int posY, int velocidad) {
    hulkAtaque= loadImage("hulkAtaque.png");
    this.posX=posX;
    this.posY=posY;
    this.velocidad=velocidad;
    ver=true;
  }

  public void pintar() {
    if (ver==true) {//Si es visible, muestre la imagen
      image(hulkAtaque, posX, posY);
    }
    else {
      posX=-500;
    }
  }

  public void mover() {
    posY+=velocidad;
    if (posY>height+100) {
      posY=0;
      posX=((int) random(40, width-40));
    }
  }


  public int getPosX () {
    return posX;
  }

  public int getPosY () {
    return posY;
  }

  public void setPosX (int posXTemp) {
    posX=posXTemp;
  }

  public void setPosY (int posYTemp) {
    posY=posYTemp;
  }

  public void setVer(boolean visi) {
    ver=visi;
  }
}

public class AtaqueEnemigoC {
  private PImage antorchaAtaque;
  //Coordenadas ataque Antorcha
  private int posX;
  private int posY;
  private int velocidad;
  private boolean ver;

  public AtaqueEnemigoC(int posX, int posY, int velocidad) {
    antorchaAtaque= loadImage("antorchaAtaque.png");
    this.posX=posX;
    this.posY=posY;
    this.velocidad=velocidad;
    ver=true;
  }

  public void pintar() {
    if (ver==true) {//Si es visible, muestre la imagen
    image(antorchaAtaque, posX, posY);
  }
    else {
      posX=-500;
    }
  }

  public void mover() {
    posY+=velocidad;
    if (posY>height+100) {
      posY=0;
      posX=(int) random(100, width-100);
    }
  }


  public int getPosX () {
    return posX;
  }

  public int getPosY () {
    return posY;
  }

  public void setPosX (int posXTemp) {
    posX=posXTemp;
  }

  public void setPosY (int posYTemp) {
    posY=posYTemp;
  }
  
   public void setVer(boolean visi) {
    ver=visi;
  }
}

public class Bala {
  //Coordenadas en X y Y.
  private int posX;
  private int posY;  

  //Si se presiona espacio se mueve la bala, sino no.
  private boolean teclaEspacio;

  //Imagen a usar.
  private PImage goblinAtaque;

  //Booleano para mostrar/ocultar balas
  private boolean ver;

  public Bala() {//Constructor

    goblinAtaque= loadImage("goblinAtaque.png");
    //Espacio no se está presionando al iniciar
    teclaEspacio=false;
    ver=false;
  }

  public void pintar() {  
    if (ver==true) { //Si es visible, muestre la imagen 
      image(goblinAtaque, posX, posY);
    }
  }

  public void mover() {
    if (ver==true) {
      if (teclaEspacio) {
        posY-=3;
      }
    }
  }

  public void setPosX(int x) { //Asigna el valor de la posición del personaje
    posX= x;
  }
  
  public void setPosY(int y) { //Asigna el valor de la posición del personaje
    posY= y;
  }
  
  public void setVer(boolean verTemp) {
    ver=verTemp;
  }
  
  public boolean getVer(){
    return ver;
  }
 

  public void setTeclaEspacio(boolean space) {
    teclaEspacio=space;
  }

  public int getPosX() {
    return posX;
  }

  public int getPosY() {
    return posY;
  }
}

public class EnemigoA {
  private PImage hulk;
  //Coordenadas Hulk
  private int posX;
  private int posY;
  //Booleano para mostrar/ocultar enemigos
  private boolean ver;

  //Velocidad del enemigo  
  private int velocidad;

  public EnemigoA(int posX, int posY) {
    hulk= loadImage("hulk.png");
    this.posX=posX;
    this.posY=posY;
    ver=true;
    velocidad=1;
  } 

  public void pintar() {
    if (ver==true) { //Si es visible, muestre la imagen
      image(hulk, posX, posY);
    }
    else {
      posX=-1000; //Lo saca del lienzo para evitar que haya contacto estando no visible
    }
  }

  public void mover() {
    if (ver==true) {
      if (posX<=700 && posY==20) {
        posX++;
      }

      if (posX==700 && posY<=70) {
        posY++;
      }

      if (posX>=50 && posY==70) {
        posX--;
      }

      if (posX==50 && posY>20 && posY<=120) {
        posY++;
      }

      if (posX<=700 && posY==120) {
        posX++;
      }

      if (posX==700 && posY>70 && posY<=170) {
        posY++;
      } 

      if (posX>=50 && posY==170) {
        posX--;
      }

      if (posX==50 && posY>120 && posY<=220) {
        posY++;
      }

      if (posX<=700 && posY==220) {
        posX++;
      }

      if (posX==700 && posY>=170 && posY<=270) {
        posY++;
      }

      if (posX>=50 && posY==270) {
        posX--;
      }

      if (posX==50 && posY>220 && posY<=320) {
        posY++;
      }

      if (posX<=700 && posY==320) {
        posX++;
      }

      if (posX==700 && posY>=270 && posY<=370) {
        posY++;
      }

      if (posX>=50 && posY==370) {
        posX--;
      }

      if (posX==50 && posY>320 && posY<=420) {
        posY++;
      }

      if (posX<=700 && posY==420) {
        posX++;
      }

      if (posX==700 && posY>=370 && posY<=470) {
        posY++;
      }

      //
      if (posX>=50 && posY==470) {
        posX--;
      }

      if (posX==50 && posY>420 && posY<=520) {
        posY++;
      }

      if (posX<=700 && posY==520) {
        posX++;
      }

      if (posX==700 && posY>=470 && posY<=570) {
        posY++;
      }


      if (posX>=50 && posY==570) {
        posX--;
      }

      if (posX==50 && posY>520 && posY<=620) {
        posY++;
      }
    }
  }

  public void atacar() {
  }

  //Método para volver accesible la posición en X y en Y desde otras clases
  public int getPosY() {
    return posY;
  }

  public int getPosX() {
    return posX;
  }

  public void setVer(boolean visi) {
    ver=visi;
  }
}

public class EnemigoB {
  private PImage spiderman;
  //Coordenadas Spiderman
  private int posX;
  private int posY;
  //Booleano para mostrar/ocultar enemigos
  private boolean ver;

  public EnemigoB(int posX, int posY) {
    spiderman= loadImage("spiderman.png");
    this.posX=posX;
    this.posY=posY;
    ver=true;
  } 

  public void pintar() {
    if (ver==true) {//Si es visible, muestre la imagen
      image(spiderman, posX, posY);
    }else{
     posX=-1000; //Lo saca del lienzo para evitar que haya contacto estando no visible
    }
  }

  public void mover() {
    if (ver==true) {
      if (posX<=700 && posY==20) {
        posX++;
      }

      if (posX==700 && posY<=70) {
        posY++;
      }

      if (posX>=50 && posY==70) {
        posX--;
      }

      if (posX==50 &&  posY>20 &&  posY<=120) {
        posY++;
      }

      if (posX<=700 && posY==120) {
        posX++;
      }

      if (posX==700 && posY>70 && posY<=170) {
        posY++;
      } 

      if (posX>=50 && posY==170) {
        posX--;
      }

      if (posX==50 && posY>120 && posY<=220) {
        posY++;
      }

      if (posX<=700 && posY==220) {
        posX++;
      }

      if (posX==700 && posY>=170 && posY<=270) {
        posY++;
      }

      if (posX>=50 && posY==270) {
        posX--;
      }

      if (posX==50 && posY>220 && posY<=320) {
        posY++;
      }

      if (posX<=700 && posY==320) {
        posX++;
      }

      if (posX==700 && posY>=270 && posY<=370) {
        posY++;
      }

      if (posX>=50 && posY==370) {
        posX--;
      }

      if (posX==50 && posY>320 && posY<=420) {
        posY++;
      }

      if (posX<=700 && posY==420) {
        posX++;
      }

      if (posX==700 && posY>=370 && posY<=470) {
        posY++;
      }

      //
      if (posX>=50 && posY==470) {
        posX--;
      }

      if (posX==50 && posY>420 && posY<=520) {
        posY++;
      }

      if (posX<=700 && posY==520) {
        posX++;
      }

      if (posX==700 && posY>=470 && posY<=570) {
        posY++;
      }


      if (posX>=50 && posY==570) {
        posX--;
      }

      if (posX==50 && posY>520 && posY<=620) {
        posY++;
      }
    }
  }

  public void atacar() {
  }

//Método para volver accesible la posición en X y en Y desde otras clases
  public int getPosY() {
    return posY;
  }

  public int getPosX() {
    return posX;
  }

  public void setVer(boolean visi) {
    ver=visi;
  }
}

public class EnemigoC {
  private PImage antorcha;
  //Coordenadas Antorcha
  private int posX;
  private int posY;
  //Booleano para mostrar/ocultar enemigos
  private boolean ver;

  public EnemigoC(int posX, int posY) {
    antorcha= loadImage("antorcha.png");
    this.posX=posX;
    this.posY=posY;
    ver=true;
  } 

  public void pintar() {
    if (ver==true) {//Si es visible, muestre la imagen
      image(antorcha, posX, posY);
    }else{
     posX=-1000; //Lo saca del lienzo para evitar que haya contacto estando no visible
    }
  }

  public void mover() {
    if (ver==true) {
      if (posX<=700 && posY==20) {
        posX++;
      }

      if (posX==700 && posY<=70) {
        posY++;
      }

      if (posX>=50 && posY==70) {
        posX--;
      }

      if (posX==50 &&  posY>20 &&  posY<=120) {
        posY++;
      }

      if (posX<=700 && posY==120) {
        posX++;
      }

      if (posX==700 && posY>70 && posY<=170) {
        posY++;
      } 

      if (posX>=50 && posY==170) {
        posX--;
      }

      if (posX==50 && posY>120 && posY<=220) {
        posY++;
      }

      if (posX<=700 && posY==220) {
        posX++;
      }

      if (posX==700 && posY>=170 && posY<=270) {
        posY++;
      }

      if (posX>=50 && posY==270) {
        posX--;
      }

      if (posX==50 && posY>220 && posY<=320) {
        posY++;
      }

      if (posX<=700 && posY==320) {
        posX++;
      }

      if (posX==700 && posY>=270 && posY<=370) {
        posY++;
      }

      if (posX>=50 && posY==370) {
        posX--;
      }

      if (posX==50 && posY>320 && posY<=420) {
        posY++;
      }

      if (posX<=700 && posY==420) {
        posX++;
      }

      if (posX==700 && posY>=370 && posY<=470) {
        posY++;
      }

      //
      if (posX>=50 && posY==470) {
        posX--;
      }

      if (posX==50 && posY>420 && posY<=520) {
        posY++;
      }

      if (posX<=700 && posY==520) {
        posX++;
      }

      if (posX==700 && posY>=470 && posY<=570) {
        posY++;
      }


      if (posX>=50 && posY==570) {
        posX--;
      }

      if (posX==50 && posY>520 && posY<=620) {
        posY++;
      }
    }
  }

  public void atacar() {
  }

//Método para volver accesible la posición en X y en Y desde otras clases
  public int getPosY() {
    return posY;
  }

  public int getPosX() {
    return posX;
  }

  public void setVer(boolean visi) {
    ver=visi;
  }
}

public class EnemigoD {
  private PImage wolverine;
  //Coordenadas Wolverine
  private int posX;
  private int posY;
  //Booleano para mostrar/ocultar enemigos
  private boolean ver;

  public EnemigoD(int posX, int posY) {
    wolverine= loadImage("wolverine.png");
    this.posX=posX;
    this.posY=posY;
    ver=true;
  } 

  public void pintar() {
    if (ver==true) {//Si es visible, muestre la imagen
      image(wolverine, posX, posY);
    }else{
     posX=-1000; //Lo saca del lienzo para evitar que haya contacto estando no visible
    }
  }

  public void mover() {
    if (ver==true) {
      if (posX<=700 && posY==20) {
        posX++;
      }

      if (posX==700 && posY<=70) {
        posY++;
      }

      if (posX>=50 && posY==70) {
        posX--;
      }

      if (posX==50 &&  posY>20 &&  posY<=120) {
        posY++;
      }

      if (posX<=700 && posY==120) {
        posX++;
      }

      if (posX==700 && posY>70 && posY<=170) {
        posY++;
      } 

      if (posX>=50 && posY==170) {
        posX--;
      }

      if (posX==50 && posY>120 && posY<=220) {
        posY++;
      }

      if (posX<=700 && posY==220) {
        posX++;
      }

      if (posX==700 && posY>=170 && posY<=270) {
        posY++;
      }

      if (posX>=50 && posY==270) {
        posX--;
      }

      if (posX==50 && posY>220 && posY<=320) {
        posY++;
      }

      if (posX<=700 && posY==320) {
        posX++;
      }

      if (posX==700 && posY>=270 && posY<=370) {
        posY++;
      }

      if (posX>=50 && posY==370) {
        posX--;
      }

      if (posX==50 && posY>320 && posY<=420) {
        posY++;
      }

      if (posX<=700 && posY==420) {
        posX++;
      }

      if (posX==700 && posY>=370 && posY<=470) {
        posY++;
      }

      //
      if (posX>=50 && posY==470) {
        posX--;
      }

      if (posX==50 && posY>420 && posY<=520) {
        posY++;
      }

      if (posX<=700 && posY==520) {
        posX++;
      }

      if (posX==700 && posY>=470 && posY<=570) {
        posY++;
      }


      if (posX>=50 && posY==570) {
        posX--;
      }

      if (posX==50 && posY>520 && posY<=620) {
        posY++;
      }
    }
  }

  public void atacar() {
  }

//Método para volver accesible la posición en X y en Y desde otras clases
  public int getPosY() {
    return posY;
  }

  public int getPosX() {
    return posX;
  }

  public void setVer(boolean visi) {
    ver=visi;
  }
}

public class EnemigoJefe {
  private PImage ironman;
  //Coordenadas Ironman
  private int posX;
  private int posY;

  public EnemigoJefe(int posX, int posY) {
    ironman= loadImage("ironman.png");
    this.posX=posX;
    this.posY=posY;
  }
 
 public void pintar(){
   image(ironman,0,0);
 }
  
}
public class Escudo {
  private PImage escudo;
  //Coordenadas escudo
  private int posX;
  private int posY;
  private float dano;

  public Escudo(int posX, int posY) {
    escudo= loadImage("escudo.png");
    this.posX=posX;
    this.posY=posY;
  } 

  public void pintar() {
    if (dano<50) {
      image(escudo, posX, posY);
      noFill();
      stroke(0);
      rect(posX+15, posY-15, 50, 5);

      noStroke();
      fill(0, 255, 0);
      rect(posX+15, posY-15, 50-dano, 5);
    }else{
     posX=-500; 
    }
  }

  public int getPosY() {
    return posY;
  }

  public int getPosX() {
    return posX;
  }

  public void dano() {
    dano+=15;
  }

  public float getDano() {
    return dano;
  }
}

public class Item {
  private PImage itemVida;
  //Coordenadas item
  private int posX;
  private int posY;
  private boolean ver;

  public Item(int posX, int posY) {
    itemVida= loadImage("itemVida.png");
    this.posX=posX;
    this.posY=posY;
    ver=false;
  } 

  public void pintar() {
    if (ver==true) {
      image(itemVida, posX, posY);
    }else{
      posX=-500;
    }
  }

  public void mover() {
    if (ver==true) {
    posY++;
    }
  }
  
  //Crea un set para poder cambiar el valor de "ver" dependiendo de lo ejecutado en la lógica
  public void setVer (boolean verTemp){
   ver=verTemp; 
  }
  
  //Permite accesar la posición en X y en Y desde otra clase
  public int getPosX (){
   return posX; 
  }
  
  public int getPosY (){
   return posY; 
  }
}

public class Logica {
  //Objeto de la clase Pantalla  
  private Pantalla pant;

  //Objeto de la clase Personaje 
  private Personaje goblin;

  //Objeto de la clase Item 
  private Item item;

  //Objeto de la clase Bala
  private Bala balita;

  //Contador para las oleadas de enemigos
  private int contador;

  //Timer para pasar de nivel
  private int timer;
  private int mostrarTiempo;

  //Contador de vidas y puntos
  private int vidas;
  private int puntos;  

  //Mostrar/ocultar balas
  private boolean balaVisible;

  //Arreglos de enemigos
  private EnemigoA enemyA[];
  private EnemigoB enemyB[];
  private EnemigoC enemyC[];
  private EnemigoD enemyD[];

  //Ataque enemigos
  private AtaqueEnemigoA ataqueEnemigoA[];
  private AtaqueEnemigoC ataqueEnemigoC[];



  //Arreglo de escudos
  private Escudo oscorp[];

  public Logica () { //Constructor de la lógica
    goblin = new Personaje ();
    pant = new Pantalla ();
    balita = new Bala();
    item = new Item ((int) random(100, width-100), -50);
    balaVisible=false;
    puntos=0;
    vidas=3;
    mostrarTiempo=50;


    //Inicializo arreglos de enemigos y de sus ataques
    enemyA= new EnemigoA[9];
    enemyB= new EnemigoB[9];
    enemyC= new EnemigoC[9];
    enemyD= new EnemigoD[9];
    oscorp= new Escudo[4];

    ataqueEnemigoA= new AtaqueEnemigoA[5];
    ataqueEnemigoC= new AtaqueEnemigoC[5];

    //Repetitiva para los enemigos
    for (int i=0; i<9; i++) {
      enemyA[i]= new EnemigoA(-400+i*79, 20);
      enemyB[i]= new EnemigoB(-400+i*79, 20);
      enemyC[i]= new EnemigoC(-400+i*79, 20);
      enemyD[i]= new EnemigoD(-400+i*79, 20);
    }

    for (int i=0; i<5; i++) {
      ataqueEnemigoA[i] = new AtaqueEnemigoA ((int) random(0, width-50), -50, (int) random(2, 4));
      ataqueEnemigoC[i] = new AtaqueEnemigoC ((int) random(0, width-50), -50, (int) random(2, 4));
    }

    //Repetitiva para los escudos
    for (int i=0; i<4; i++) {
      oscorp[i]= new Escudo(60+i*200, 380);
    }
  }

  public void ejecutar() {     
    pant.cambioPantalla();

    if (pant.getPantalla()==3) {// En la pantalla 3 se ejecutan los enemigos, personaje, balas e ítems

      //Timer para pasar de nivel y aumentar la velocidad de los enemigos
      timer++;

      if (timer%60==0) {
        if (mostrarTiempo>0) {
          mostrarTiempo-=1;
        }
      }

      if (mostrarTiempo>0) {
        textSize(50);
        fill(255, 255, 255, 100);
        text (mostrarTiempo, 490, 280);

        textSize(15);
        fill(255, 255, 255, 100);

        text ("Tiempo para la siguiente oleada", 250, 270);
      }
      else {
        textSize(50);
        fill(255, 255, 255, 100);
        if (contador<3200) {
          text ("Nivel 2", 320, 270);
        }
      }      

      for (int i=0; i<4; i++) {
        oscorp[i].pintar();
      }

      contador++;

      if (balaVisible==true) {
        if (balita.getVer()==true) {
          balita.setVer(true);
          balita.pintar();
          balita.mover();
        }
      }

      for (int i=0; i<5; i++) {

        //Pinta el ataque del enemigo
        ataqueEnemigoA[i].pintar();
        ataqueEnemigoA[i].mover();

        if (mostrarTiempo==0) {
          ataqueEnemigoC[i].pintar();
          ataqueEnemigoC[i].mover();
        }
      }

      for (int i=0; i<9; i++) {

        //Colisión bala-enemigos

        if (balaVisible==true) {
          if (balita.getVer()==true) {

            //Condición para evaluar si hay contacto entre la bala y el enemigo A. De ser así ambos desaparecen
            if (dist(enemyA[i].getPosX(), enemyA[i].getPosY(), balita.getPosX(), balita.getPosY())<30) {
              enemyA[i].setVer(false);
              balaVisible=false;
              puntos++;
            }

            //Condición para evaluar si hay contacto entre la bala y el enemigo B. De ser así ambos desaparecen
            if (dist(enemyB[i].getPosX(), enemyB[i].getPosY(), balita.getPosX(), balita.getPosY())<25) {
              enemyB[i].setVer(false);
              balaVisible=false;
              puntos++;
            }

            //Condición para evaluar si hay contacto entre la bala y el enemigo B. De ser así ambos desaparecen
            if (dist(enemyC[i].getPosX(), enemyC[i].getPosY(), balita.getPosX(), balita.getPosY())<30) {
              enemyC[i].setVer(false);
              balaVisible=false;
              puntos++;
            }

            //Condición para evaluar si hay contacto entre la bala y el enemigo B. De ser así ambos desaparecen
            if (dist(enemyD[i].getPosX(), enemyD[i].getPosY(), balita.getPosX(), balita.getPosY())<35) {
              enemyD[i].setVer(false);
              balaVisible=false;
              puntos++;
            }

            if (balaVisible==false) {
              balita.getPosY();
            }
          }
        }

        //Condición para que cuando la bala se salga del lienzo vuelva a su posición inicial

        if (balita.getPosY()< -10) { 
          balita.setPosY(goblin.getPosY());
          balaVisible=false;
        }

        //Aparición de enemigos por oleadas

        if (contador>=0) {
          enemyA[i].pintar();
          enemyA[i].mover();
        }

        if (contador>=1000) {
          enemyB[i].pintar();
          enemyB[i].mover();
        }

        if (mostrarTiempo==0) {
          enemyC[i].pintar();
          enemyC[i].mover();
        }

        if (contador>=4000) {
          enemyD[i].pintar();
          enemyD[i].mover();
        }
      }

      //Personaje principal
      goblin.pintar();
      goblin.mover();

      //Hud (Información de vidas y puntos)
      textSize(20);
      fill(255, 255, 255);
      text (puntos, 750, 555);

      textSize(20);
      fill(255, 255, 255);
      text (vidas, 755, 515);


      //Ítem vida
      println(contador);
      if (contador>=500) {
        item.pintar();
        item.mover();
      }

      if (contador==500) {
        item.setVer(true);
      }


      //Colisión entre personaje e ítem
      if (dist(item.getPosX(), item.getPosY(), goblin.getPosX(), goblin.getPosY())<50) {
        item.setVer(false);
        if (vidas<=3) {
          vidas+=1;
        }
      }

      //Colisión entre balas y escudos
      for (int i=0; i<4; i++) {

        if (dist(balita.getPosX(), balita.getPosY(), oscorp[i].getPosX(), oscorp[i].getPosY())<40) {
          oscorp[i].dano();
          balaVisible=false;
          balita.setPosX(-500);
        }
      }

      //Colisión entre ataque enemigo y escudos

      for (int i=0; i<4; i++) {

        if (dist(oscorp[i].getPosX(), oscorp[i].getPosY(), ataqueEnemigoA[i].getPosX(), ataqueEnemigoA[i].getPosY())<50) {
          oscorp[i].dano();
          balaVisible=false;
          balita.setPosX(-500);
          ataqueEnemigoA[i].setVer(false);
        }

        if (dist(ataqueEnemigoC[i].getPosX(), ataqueEnemigoC[i].getPosY(), oscorp[i].getPosX(), oscorp[i].getPosY())<50) {
          oscorp[i].dano();
          balaVisible=false;
          balita.setPosX(-500);
          ataqueEnemigoC[i].setVer(false);
        }
      }

      //Colisión entre ataque enemigo y personaje

        for (int i=0; i<4; i++) {

        if (dist(goblin.getPosX(), goblin.getPosY(), ataqueEnemigoA[i].getPosX(), ataqueEnemigoA[i].getPosY())<50) {
          ataqueEnemigoA[i].setVer(false);
          vidas--;
        }

        if (dist(goblin.getPosX(), goblin.getPosY(), ataqueEnemigoC[i].getPosX(), ataqueEnemigoC[i].getPosY())<30) {
          ataqueEnemigoC[i].setVer(false);
          vidas--;
        }
      }

      if (vidas==0) { //Si las vidas llegan a 0 se muestra la pantalla final
        pant.setPantalla(4);
      }
      
      if (puntos>36) { //Si las vidas llegan a 0 se muestra la pantalla final
        pant.setPantalla(4);
      }
      
    }
    if (pant.getPantalla()==4) {
      //Información de vidas y puntos
      textSize(20);
      fill(255, 255, 255);
      text (puntos, 480, 315);

      textSize(20);
      fill(255, 255, 255);
      text (vidas, 480, 385);
    }
  }


  public void click() { //Al hacer clic ejecuta el metodo click en la clase Pantalla
    pant.click();
  }

  public void teclado() {

    if (keyCode==' ') { //Al presionar espacio...
      if (balaVisible==false) {
        balaVisible=true; //Muestra la bala

        balita.setTeclaEspacio(true); //Permite presionar las teclas de dirección al tiempo sin interrumpir el disparo de la bala
        balita.setPosX(goblin.getPosX()); //Coloca la posición de la bala con la que tenia el personaje al disparar
        balita.setPosY(goblin.getPosY()); //Coloca la posición de la bala con la que tenia el personaje al disparar
        balita.setVer(true);
      }
    }
  }

  public int getVidas() {
    return vidas;
  }

  public int getPuntos() {
    return puntos;
  }
}

public class Pantalla {
  private int posX;
  private int posY;
  private PImage pantallaInicial;
  private PImage pantallaFinal;
  private PImage pantallaInstrucciones;
  private PImage botonJugar;
  private PImage botonJugarEncima;
  private PImage botonJugarClicked;
  private PImage pantallaPersonajes;
  private PImage goblinSeleccion;
  private PImage venomSeleccion;
  private PImage deadpoolSeleccion;
  private PImage pantallaEscenario;
  private PImage hud;
  private int pantalla=0;

  public Pantalla() {

    pantallaInicial= loadImage("pantallaInicial.jpg");
    pantallaFinal= loadImage("pantallaFinal.jpg");
    pantallaInstrucciones= loadImage("pantallaInstrucciones.jpg");
    botonJugar= loadImage("botonJugar.png");
    botonJugarEncima= loadImage("botonJugarEncima.png");
    botonJugarClicked= loadImage("botonJugarClicked.png");
    pantallaPersonajes= loadImage("pantallaPersonajes.jpg");
    goblinSeleccion= loadImage("goblinSeleccion.png");
    venomSeleccion= loadImage("venomSeleccion.png");
    deadpoolSeleccion= loadImage("deadpoolSeleccion.png");
    pantallaEscenario= loadImage("pantallaEscenario.jpg");
    hud= loadImage("hud.png");
  }

  public void cambioPantalla() {
    switch(pantalla) {
    case 0:
      image(pantallaInicial, 0, 0);

      if (mousePressed) {
        image(botonJugarClicked, 0, 0);
      }
      else {  
        if (mouseX>515 && mouseX<682 && mouseY>455 &&mouseY<540) {
          image(botonJugarEncima, 0, 0);
        }
        else {
          image(botonJugar, 0, 0);
        }
      }

      break;

    case 1:
      image(pantallaInstrucciones, 0, 0);
      break;

    case 2:
      image(pantallaPersonajes, 0, 0);
      if (mouseX>17 && mouseX<240 && mouseY>20 &&mouseY<460) {
        image(goblinSeleccion, 0, 0);
      }

      if (mouseX>290 && mouseX<507 && mouseY>20 &&mouseY<430) {
        image(venomSeleccion, 0, 0);
      }

      if (mouseX>530 && mouseX<782 && mouseY>20 &&mouseY<408) {
        image(deadpoolSeleccion, 0, 0);
      }
      break;

    case 3:
      image(pantallaEscenario, 0, 0);
      image(hud,0,0);
      break;
    
    
    case 4:
      image(pantallaFinal, 0, 0);
        
      break;
    }
  }

  public void click() {
    switch(pantalla) {
    case 0:
      if (mouseX>515 && mouseX<682 && mouseY>455 &&mouseY<540) {
        pantalla+=1;
      }
      break;

    case 1:
      pantalla+=1;
      break;

    case 2:
      if (mouseX>17 && mouseX<240 && mouseY>20 &&mouseY<460) {
        pantalla+=1;
      }
      break;
    }
  }

  public int getPantalla() {
    return pantalla;
  }
  
  public void setPantalla(int pantallaTemp) {
    pantalla=pantallaTemp;
  }
}

public class Personaje {
  private int posX;
  private int posY;
  private int posYAtaque;
  private PImage goblin;

  public Personaje() {
    posX=380;
    posY=500;    
    goblin= loadImage("goblin.png");
  }

  public void pintar() {
    image(goblin, posX, posY);
  }

  public void mover() {    

    if (posX<=650 && keyPressed && keyCode==RIGHT) {
      posX+=5;
    }

    if (posX>=50 && keyPressed && keyCode==LEFT) {
      posX-=5;
    }
  }

  public int getPosX() { //Obtiene el valor de la posición del personaje y lo vuelve público
    return posX;
  }
  
  public int getPosY(){
    return posY;
  }
}



