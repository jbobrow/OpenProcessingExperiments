
//******VARIABLES GLOBALES******//

color interpolatedColor1, interpolatedColor2, evolucionDegradado;

float dirXmouse = 0.0;
float dirYmouse = 0.0;


//Colores
color rosa = color(224, 138, 136);
color colorGotas = color(158, 58, 94);
color colorNube = color(114, 36, 84);


//Colores degradado fondo
color naranja = color(255, 203, 157);
color cremita = color(254, 247, 226);
color rosadito = color(252, 131, 120);
color cDegradadoSuperior1 = naranja;
color cDegradadoInferior = cremita;
color cDegradadoSuperior2 = rosadito;

//ARRAY GOTAS SEGUNDOS
int totalGotas = 60;
float[] gota= new float[totalGotas];
float[] xGota= new float[totalGotas];
float[] yGota= new float[totalGotas];
float[] szGota= new float[totalGotas];
float[] vyGota= new float[totalGotas];
float[] opacidadGota= new float[totalGotas];


//FUNCION DEGRADADO FONDO// 
void dibujarDegradado(float transicion) { //declaro que habra una transición.
  for (int i = 0; i <= height; i = i+1) {
    float factor = map(i, 0, height, 0, 1);
    interpolatedColor2 = lerpColor(cDegradadoSuperior2, cDegradadoInferior, factor);
    stroke(interpolatedColor2);
    line(0, i, width, i);
  }

  for (int i = 0; i <= height; i = i+1) {
    float factor = map(i, 0, height, 0, 1);
    interpolatedColor1 = lerpColor(cDegradadoSuperior1, cDegradadoInferior, factor);
    stroke(interpolatedColor1, transicion);//esta transición afecta al degradado inicial.
    line(0, i, width, i);
  }
}

//FUNCION DIBUJAR DIOS
void dibujarDios(float opacidadOjo) {

  // Triangulo exterior
  /*stroke(0);*/
  fill(cremita, opacidadOjo);
  triangle(0, -90, -75, 50, 75, 50);

  // Triangulo interior
  /*stroke(0);*/
  fill(rosa, opacidadOjo);
  triangle(0, -83, -70, 47, 70, 47);

  // Ojo
  /*stroke(0);*/
  fill(255, opacidadOjo);
  ellipse(0, 0, 85, 40);

  
  pushMatrix();
  
  //Tope movimiento ojo
  translate(17.0*dirXmouse, 4.0*dirYmouse);

  // Iris
  /*stroke(0);*/
  fill(naranja, opacidadOjo);
  ellipse(0, 0, 39, 39);
  // Iris interior
  noStroke();
  fill(rosa, opacidadOjo);
  ellipse(0, 0, 23, 23);
  // Pupila
  fill(colorNube, opacidadOjo);
  ellipse(0, 0, 15, 15);
  // Brillo pupila
  fill(255, 255, 255, opacidadOjo);
  noStroke();
  ellipse(3, -2, 5, 5);
  popMatrix();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  int w = 600;
  int h = 600;
  size(w, h);

  //inicializa gotas
  for (int i=0; i<totalGotas; i++) {
    xGota[i]= 0; //da igual
    yGota[i]= height+40; //todas estan abajo (no se ven)
    szGota[i]= random(10, 30); // tamaño variable
    vyGota[i]= random(5, 9);
    opacidadGota[i]= 0;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw() {

  //OJO SIGUE MOUSE
  dirXmouse = -1.0 + 2.0*mouseX/width;
  dirYmouse = -1.0 + 2.0*mouseY/height;


  //Degradado fondo
  //declaro variable h que depende de la hora y va a pasar de opaco a transparente.
  float h = map(hour(), 0, 24, 255, 0);
  dibujarDegradado(h);// esta variable h es la transición que indicaba que habría.


  //Permite que la hora se marque en 2 dígitos
  String hora= str(hour());
  String minuto= str(minute());
  String segundo= str(second());

  if (hour() < 10) {
    hora = "0" + hora;
  }
  if (minute() < 10) {
    minuto = "0" + minuto;
  }
  if (second() < 10) {
    segundo = "0" + segundo;
  }

  fill(cremita);
  textSize(70);
  textAlign(CENTER, CENTER);
  text(hora+" : "+minuto+" : "+segundo, width/2, height/2);



  //Dibuja agua
  fill(rosa, 90);
  int hAgua = minute()*8 + second()*8/59;
  int yAgua = height - hAgua;
  rect(0, yAgua, width, hAgua);

  //cada nuevo segundo una nueva gota en posición X=random y Y=0
  xGota[second()]= random(20, width-20); 
  yGota[second()]= -40;
  opacidadGota[second()]= random(70, 90);

  //Anima y dibuja gotas
  for (int i=0; i<totalGotas; i++) {
    //Hace que la gota baje
    yGota[i] = (yGota[i] + vyGota[i]);

    //Decide transparencia de la gota
    if (yGota[i] >= yAgua) {
      opacidadGota[i] = opacidadGota[i]-10;
    }

    //Dibuja la gota
    noStroke();
    fill(color(colorGotas), opacidadGota[i]);
    ellipse(xGota[i], yGota[i], szGota[i], szGota[i]);
  }

  //LA NUBESITA
  noStroke();
  fill(color(colorNube), 98); //color nube y transparencia
  ellipse(width/2, -200, 850, width);

  pushMatrix();
  translate(width/2, 60);
  scale(0.5);
  dibujarDios(200);
  popMatrix();
}

