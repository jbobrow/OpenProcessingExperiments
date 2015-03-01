
//Eric Conejo Tejada (Grupo 301)

int num_shapes = 60;

float[] positionsX = new float[num_shapes];
float[] positionsY = new float[num_shapes];
float[] speedX = new float[num_shapes];
float[] speedY = new float[num_shapes];
float[] size = new float[num_shapes];

color [] color_iris = new int [num_shapes];

boolean transparencias = true;


void setup() {
  size(600, 600);

  for (int i= 0; i < num_shapes; i++) {

    positionsX[i] = random(100, width-100);
    positionsY[i] = random(100, height-100);
    speedX[i] = random(1, 5);
    speedY[i] = random(1, 5);
    size[i] = float(25);
    color_iris[i] = color (0, int(random(0, 255)), 0);
  }
}

void draw() {

  if (transparencias) {
    fill (0, 40);
    rect(0, 0, width, height);
  } else background (mouseX, mouseY, random(0, 255));

  for (int i= 0; i < num_shapes; i++) {
    positions(i);
    limits(i);
    shapes(i);
  }
}


void positions(int _i){
  positionsX[_i]  += speedX[_i] ;
  positionsY[_i]  += speedY[_i] ;
}


void limits(int _i) {
  if ((positionsX[_i] < size[_i]/2-10)||(positionsX[_i] > width-size[_i])) {
    speedX[_i]  = -speedX[_i] ;
  } 

  if ((positionsY[_i] < size[_i]/2-10)||(positionsY[_i] > height-size[_i])) {
    speedY[_i]  = -speedY[_i] ;
  }
}


void shapes(int _i){ 
  smooth();

  fill(255, 175, 70); //cuernos
  bezier(positionsX[_i]+4, positionsY[_i]+8, positionsX[_i]+3, positionsY[_i]+3, positionsX[_i], positionsY[_i], positionsX[_i]+8, positionsY[_i]+3);
  bezier(positionsX[_i]+25, positionsY[_i]+8, positionsX[_i]+26, positionsY[_i]+3, positionsX[_i]+29, positionsY[_i], positionsX[_i]+21, positionsY[_i]+3);

  fill (0, 255, 55); //cabeza
  ellipse (positionsX[_i]+14, positionsY[_i]+15, size[_i], size[_i]);

  fill(255); //ojo
  ellipse (positionsX[_i]+14, positionsY[_i]+12, +12, +12);

  fill (color_iris[_i]); //iris
  ellipse (positionsX[_i]+14, positionsY[_i]+12, +6, +6);

  noFill(); //boca
  arc(positionsX[_i]+14, positionsY[_i]+15, 18, 18, 0, PI);
}


void keyPressed (){
  transparencias = !transparencias;
}

