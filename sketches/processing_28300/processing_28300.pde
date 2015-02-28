
float velX[];
float velY[];
float x[];
float y[];
float radio[];
color sabor[];
float contador[];


int n=100; //numero de pelotitas
//inicializamos
void setup() {
  size(800, 800);                  

  velX= new float[n];
  velY= new float[n];
  x = new float[n];
  y = new float[n];
  radio = new float[n];
  sabor=new color[n];
  contador=new float[n];
  colorMode(HSB);
  //llenamos todos los datos
  for (int i=0; i < n; i++) {
    velX[i]=random(1, 5);
    velY[i]=random(1, 5);
    x[i] = random(width); 
    y[i] = random(height);
    radio[i] = random(2, 20);
    sabor[i]= color(random(80, 290), 503, 255, random(180, 325));
    contador[i]=0;
  }
  ellipseMode(RADIUS);
}
//dibujamos
void draw() {
  update();
  fill(0, 2);
  rect(0, 0, width, height);
  //background(50);                 //firadiost we dradioaw the backgradioound
  //  noStroke();
  //color a dibujar
  //dibujamos cada pelota
  for (int i=0; i < n; i++) {
    fill( sabor[i] );
    ellipse(x[i], y[i], radio[i], radio[i]);   
    //dibujar elipse
    contador[i]+=0.03;//+random(0.2, 0.3);
  }
}
//calculamos
void update() {

  for (int i=0; i < n; i++) {
    //decrecemos radio si es menor que 10
    if (radio[i] > 4) {
      radio[i]-=0.001f;
    }
    //cada iteracion le agregamos velocidad a su posicion
    x[i] = x[i] + velX[i]*cos(contador[i]);
    y[i] = y[i] + velY[i]*sin(contador[i])*sin(contador[i]);
    //si pega una pared
    if ((x[i] > width) || (x[i] < 0)) {
      velX[i] = velX[i] * -1;
      radio[i] = 30; //si pega lo hacemos grande
    }
    //si pega la otra
    if ((y[i] > height) || (y[i] < 0)) {
      velY[i] = velY[i] * -1;
      radio[i] = 30; //si pega lo hacemos grande
    }
  }
}


