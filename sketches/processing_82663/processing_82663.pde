
Curva[] curvas=new Curva[800];
//PImage img;


void setup() {
  size(1034, 739);   //escala 1:8 a 300dpi


  noStroke();
  background(0);
  rectMode(CENTER);





  // img = loadImage ("void.png");



  for (int i=0;i<curvas.length;i++) {

    float ang = 0.3;
    float diamm=random(15);
    float xpar=0;
    float ypar=random(-100, 100);

    curvas[i]=new Curva(ang, diamm, xpar, ypar); // incremento del angulo del seno (posicion Y), DIAMETRO cuadrado, POSICION DE PARTIDA EN X e Y
  }
}



void draw() {

/*if (millis() >1000) { 
   
   noLoop();
   pushMatrix();
   translate(0, height/2);
   
   tint(255, 180);
   
   image(img, 0, 0);  
   
   popMatrix();
   }*/

  for (int i=0;i< curvas.length; i++) {
    curvas[i].update();
    curvas[i].display();
 
 if (millis() >3000) { 
   
    stop();
   }
 
 
  }

  
}


class Curva {
  int[] cant=new int[100];

  float incremento;

  float angle=0.0;
  float xpos;
  float scalar=30;
  float tam;
  float yy;
  float xx;



  float r=random (255);
  float g=random(255);
  float b=random(255);
  Curva ( float _incremento, float _tam, float _xx, float _yy) {


    incremento=_incremento;
    tam=_tam;
    xx=_xx;
    yy=_yy;
  }

  void update() {

    translate(xx, yy);
  }


  void display() {



    for (int i=1; i < cant.length;i++) {

      fill(r, g, b, 200);

      xpos=xpos+(1+tam)-1/i;
      angle=angle+incremento;
      rect( xpos, height/2+sin(angle)*i, tam, tam);


      rect(1034 -xpos, height/2+sin(angle)*i, tam, tam);
    }
  }
}
