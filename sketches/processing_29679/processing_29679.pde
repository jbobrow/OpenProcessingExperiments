
/*
  r/d change lissajoux drawing
  t/g change tail size
  p/m change tail head size
*/

float x, y, newx, newy, n;
int a, b, c, k;
int V = 0;
int dir = 1;
int startId = 0;
float[] positionsX = {};
float[] positionsY = {};
int[] couleurs   = {};
int nbCircles = 70;
int tailleMax = 25;
PFont font;

void setup() {
  stroke(0, 10);
  background(255);
  size(500, 500);
  smooth();
  
  font = loadFont("LoResNineWide-9.vlw");
  textFont(font); 
  text("test", 15, 30);
  
  c = 4;
  n = 50;
  x = width/2;
  y = height/2;

  a = 100;
  b = 100;

  recordPositions();
}

void recordPositions() {
  println("nbCircles : "+nbCircles);
  println("_______");

  positionsX = new float[0];
  positionsY = new float[0];
  couleurs   = new int[0];
  startId    = 0;
  
  for (float j=0; j<=2*PI; j = j+(PI/n/c)) {
    positionsX = (float[]) append(positionsX, getLissajouxX(j));
    positionsY = (float[]) append(positionsY, getLissajouxY(j));
    couleurs   = (int[])   append(couleurs, updateColor());
  }
}

void draw() {
  background(255);

  fill(0);  
  for(int i=0; i< nbCircles; i++){
    int id = startId + i;
    if (id >= positionsX.length) id = id - positionsX.length;
    
    float ratio = float(i)/float(nbCircles);
    fill(255,ratio* 255, 0, ratio* 255);
    
    int taille = (i+1)%tailleMax;
    ellipse(positionsX[id], positionsY[id], taille, taille);
  }
  
  startId++;
  if (startId == positionsX.length) { 
    startId = 0;
  }
}

float getLissajouxX(float j) {
  return width/2 + a * sin(c*j);
}

float getLissajouxY(float j) {
  return height/2 + b * sin((c+1)*j);
}

void keyPressed() {
  
  if (key == 't') {
    nbCircles++;
    println("nbCircles : "+nbCircles);
    return;
  }
  if (key == 'g' && nbCircles >1) { 
    nbCircles--;
    println("nbCircles : "+nbCircles);
    return;
  }
  
  if (key == 'p') {
    tailleMax++;
    println("tailleMax : "+tailleMax);
    return;
  }
  if (key == 'm' && tailleMax >1) { 
    tailleMax--;
    println("tailleMax : "+tailleMax);
    return;
  }
  
  if (key == 'd') {
    a++;
  }
  if (key == 'q') { 
    a--;
  }
  if (key == 'z') {
    b++;
  }
  if (key == 's') { 
    b--;
  }
  if (key == 'r') {
    c++;
  }
  if (key == 'f' && c >1) { 
    c--;
  }
  if (key == ENTER) {
    setup();
  }
  
  recordPositions();
  
}


/* TOOLS */
int updateColor() {
  if (V >= 255)      dir = -1;
  else if (V == 0)   dir = 1;

  V = V + 1*dir;

  return V;
}

