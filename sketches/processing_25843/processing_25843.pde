
float velX[];    //velocidad en y de la pelotita
float velY[];    //velocidad en y de la pelotita
float x[];       //coordenada x del centro de la pelotita
float y[];       //coordenada y del centro de la pelotita
int rmin;        //el radio minimo de las pelotitas
int rmax;        //el radio maximo de las pelotitas
float radio0[];  //el radio inicial de la pelotita
float radio[];   //el radio variable de la pelotita
color c[]; //variable para el color de cada pelotita
int n=100; //numero de pelotitas

//inicializamos
void setup() {
  size(1000,800);
background(0);
  velX= new float[n];
  velY= new float[n];
  x = new float[n];
  y = new float[n];
  rmin = 7;
  rmax = 14;
  radio0 = new float[n];
  radio = new float[n];
  c = new color[n];
  
  //llenamos todos los datos
  for(int i=0; i < n; i++) {
    radio0[i] = random(rmin , rmax);
    radio[i] = radio0[i];
    velX[i]=random(1,4);
    velY[i]=random(1,4);
    x[i] = random(3+radio[i],(width-3-radio[i])); 
    y[i] = random(3+radio[i],(height-3-radio[i]));
    c[i]= color(random(50,255), random(50,255), random(50,255), random(50,255));

  }
  ellipseMode(RADIUS);
}
//dibujamos
void draw() {
  update();
  background(0);
  noStroke();
  
  //dibujamos cada pelota
  for(int i=0; i < n; i++) {
    fill(c[i]);   
    ellipse(x[i],y[i],radio[i],radio[i]);    //dibujar elipse
  }
}

//calculamos
void update() {

  for(int i=0; i < n; i++) {
    //decrecemos radio si es mayor que radio0 []
    if (radio[i] > radio0[i]) {
      radio[i]-=0.3f;
    }

    //cada iteracion le agregamos velocidad a su posicion
    x[i] = x[i] + velX[i];
    y[i] = y[i] + velY[i];

    //si pega una pared vertical
    if (x[i] > (width-radio0[i]) || (x[i] < (radio0[i]+1))) {
      velX[i] = velX[i] * -1;
      radio[i] = 2*radio0[i]; //si pega lo hacemos grande
    }
    //si pega una pared horizontal
    if ((y[i] > (height-radio0[i])) || (y[i] < (radio0[i]+1))) {
      velY[i] = velY[i] * -1;
      radio[i] = 2*radio0[i]; //si pega lo hacemos grande
    }
  }
  
//Para callcular las colisiones entre las pelotitas
    for(int i = 0; i < n; i++) {
      for(int j = i; j < n; j++){
        if(dist(x[i], y[i], x[j], y[j])+3<(radio[i]+radio[j])){//evalua que la distancia entre centros de 2 pelotitas sea menor que la suma de los radios mas 3
          velX[i] = velX[i] * -1;  //invierte sentido de la velocidad
          velY[i] = velY[i] * -1;
          velX[j] = velX[j] * -1;
          velY[j] = velY[j] * -1;
    }
  }
}
}
    


