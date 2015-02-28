
Curva[] curvas=new Curva[800];




float noiseval;
float xpos;
float angle = 0.0;

float scalar = 0.5;

float x1=10;
float y1=0;
float x2;
float x3;
float y3=30;
float n=random(-100, 100);


void setup() {
  size( 739, 1034);   //escala 1:8 a 300dpi

  background(255);
  rectMode(CENTER);


  noiseval = 0;
  xpos = 10;


  for (int i=0;i<curvas.length;i++) {

    float ang = 0.5;
    float diamm=(10);
    float xpar=0;
    float ypar=random(-200, 200);

    curvas[i]=new Curva(ang, diamm, ypar, xpar); // incremento del angulo del seno (posicion Y), DIAMETRO cuadrado, POSICION DE PARTIDA EN X e Y
  }
}



void draw() {


  noiseval += 0.1;
  xpos=xpos+5;

  noFill();
  //fill(0,g,b,70);
  //stroke(0,g,b,10);
  stroke(0, 100);
  strokeWeight(15);

  angle += 0.1;



  pushMatrix();
  translate(width/2, 80 );
  //translate(0,noise(-1,1)*5*height/4*sin(angle)*scalar+300);
  //triangle(x1+n+xpos, y1+noiseval, x2*n+xpos, y1-noiseval, x3*n+xpos, y3+random(-height/3-noiseval, height/3));

  triangle(y1+noiseval, x1+n+xpos, y1-noiseval, x2*n+xpos, y3+random(-height/3-noiseval, height/3), x3*n+xpos);



  popMatrix();




  if (xpos>1050) {

    for (int i=0;i< curvas.length; i++) {

      curvas[i].update();
      curvas[i].display();
      noLoop();
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

  Curva ( float _incremento, float _tam, float _yy, float _xx) {


    incremento=_incremento;
    tam=_tam;
    xx=_xx;
    yy=_yy;
  }

  void update() {

    translate( yy, xx);
  }


  void display() {



    for (int i=1; i < cant.length;i++) {
      noStroke();
      fill(255, 30);
      xpos=xpos+(1+tam)-1/i;
      angle=angle+incremento;
      //rect( 1034-xpos, height/2+sin(angle)*i, tam, tam);
      rect( width/2+cos(angle)*i, 1034-xpos, tam, tam);
    }
  }
}
