
/*

  r/f to change lissajoux drawing
  t/g to change threshold

*/

float x, y, newx, newy, n;
int a, b, c, k;
int V = 0;
int dir = 1;
int startId = 0;
float[] positionsX = {};
float[] positionsY = {};
int[] couleurs   = {};
int seuil = 70;
PFont font;

void setup() {
  stroke(0, 50);
  background(255);
  size(500, 500);
  smooth();
  
  font = loadFont("LoResNineWide-9.vlw");
  textFont(font);
  
  c = 4;
  n = 50;
  x = width/2;
  y = height/2;

  a = 200;
  b = 200;

  recordPositions();
}

void recordPositions() {

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
  
  println("c : "+c);
  println("seuil : "+seuil);
  println("_______");
  

  fill(0);
  for(int j=0; j < positionsX.length; j++){
    
    for(int k=0; k < positionsX.length; k++){
      int distance = int(dist(positionsX[j], positionsY[j],positionsX[k], positionsY[k]));
      float r = random(0, 100);
      if(distance < seuil && r < 100)  line(positionsX[j],positionsY[j],positionsX[k], positionsY[k]);
    }
    
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
    seuil = seuil + 5;
  }
  if (key == 'g' && seuil >5) { 
    seuil = seuil - 5;
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
  draw();
}


/* TOOLS */
int updateColor() {
  if (V >= 255)      dir = -1;
  else if (V == 0)   dir = 1;

  V = V + 1*dir;

  return V;
}
                
