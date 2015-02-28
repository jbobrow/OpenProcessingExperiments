
/*
REMIX AMOTION
 GERARDO BORGES
 IDEP 2010
 */


//VARIABLES
float angulo = 0.0; // ANGULO INICIAL
float velocidad = 0.01; // VELOCIDAD
float radius = 125; // Range of motion
int opacidad = 5;
float sx = 5.0;
float sy = 2.0;
float rx = 2.0;
float ry = 5.0;
color[] tonos = new color[5];
float grueso = 0.1;
color fondo = #000000;

//SETUP
void setup() {
  size(500, 500);
  noStroke();
  frameRate(30);
  background(#000000);
  smooth();

  //lista del array tonos
tonos[0] = #19F8FF;
tonos[1] = #FFD900;
tonos[2] = #B2097B;
tonos[3] = #FF00FF;
tonos[4] = #FF00FF;
}

void draw() {
  eventos();
  angulo += velocidad; // Update the 
  println("angulo: "+angulo);
  println("opacidad: "+opacidad);

  float x =  width/2 + sin(angulo) * radius;
  float y = height/2 + cos(angulo) * radius;

  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = x + sin(angulo * sx) * radius ;
  float y2 = y + cos(angulo * sy) * radius ;
  //segundo grupo
  float x3 = x + cos(angulo * rx/2) * radius ;
  float y3 = y + cos(angulo * ry/2) * radius;
  //tercer grupo
  float x4 = x + sin(angulo * sx) * radius/2 ;
  float y4 = y + cos(angulo * sy) * radius/2;

  //line
  strokeWeight(grueso);
  fill(fondo,opacidad);
  stroke(tonos[int(random(4))], opacidad+245);
  ellipse(x,y,x2,y2);
  ellipse(x2,y2,x,y);
  ellipse(x,y2,x2,y);
  ellipse(x2,y,x,y2);
  //segundo grupo
  ellipse(x,y,x3,y3);
  ellipse(x3,y3,x,y);
  ellipse(x,y3,x3,y);
  ellipse(x3,y,x,y3);
  //tercer grupo
  strokeWeight(grueso+random(30));
  line(x,y,x,y);
  line(x2,y2,x2,y2);
  line(x3,y3,x3,y3);
  line(y2,y2,y2,y2);
  line(x2,y2,x2,y2);
}
void limpia(){
  background(0);
}


void fade(){
  fill(fondo, 255);
  noStroke();
  rect(0, 0, width, height);
}















