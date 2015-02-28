
float velX[];  //que voy a utilizar
float velY[];
float x[];
float y[];
float radio[];
color colores[];
float t1[];
int n=100; //numero de pelotitas
//inicializamos
void setup() {
  size(800,800);                  

  velX= new float[n]; //generalos
  velY= new float[n];
  x = new float[n];
  y = new float[n];
  radio = new float[n];
  colores = new color[n];
  t1 = new float [n];
  //llenamos todos los datos
  for(int i=0; i < n; i++) { //es lo ke le kiero hacer a cada pelotita
    velX[i]=random(1,5);
    velY[i]=random(1,5);
    x[i] = width/2; 
    y[i] = height/2;
    radio[i] = random(2,20);
    colores[i]= color(random(0,255),random(0,255),random(0,255));
    t1[i]= random(1);
  }
  ellipseMode(RADIUS);
}
//dibujamos
void draw() {
  update();
                   //firadiost we dradioaw the backgradioound
  stroke(255,45);
  
  fill(255,200,0);                //color a dibujar
  //dibujamos cada pelota
  for(int i=0; i < n; i++) {
    t1[i]+=0.01;
    fill(colores[i],55);
    ellipse(x[i],y[i],radio[i]*sin(t1[i])*3,radio[i]*sin(t1[i])*3);               //dibujar elipse
  }
}
//calculamos
void update() {

  for(int i=0; i < n; i++) {
    //decrecemos radio si es menor que 10
    if (radio[i] > 4) {
      //radio[i]-=0.3f;
    }
    //cada iteracion le agregamos velocidad a su posicion
    x[i] = x[i] + velX[i];
    y[i] = y[i] + velY[i];
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

void keyPressed() {
  saveFrame("####imagen.png");
}

