
int counter = 1;
float x, y, px, py;
float easing = 0.1;
PImage hg, pinsel, pinsela;
float[] dataX = new float[6000];
float[] dataY = new float[6000];
float[] dataWeight = new float[6000];

void setup(){
  size(600, 439);
  hg = loadImage("papierhg.png");
  pinsel = loadImage("pinsel-oben.png");
  pinsela = loadImage("pinsel-unten.png");
  smooth();
  noCursor();
  stroke(0);
}

void drawData(){
  for (int i = 2; i < counter; i++){
    strokeWeight(dataWeight[i]);
    line(dataX[i-1], dataY[i-1], dataX[i], dataY[i]);
  }
}

void draw(){
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  
  image(hg, 0, 0);
  
  if (mousePressed){
    dataX[counter] = x;   
    dataY[counter] = y;
    dataWeight[counter] = weight;
    counter++; 
    println(counter);
    drawData();
    image(pinsela, x - 35, y - 700);
    
  } else {
    drawData();
    image(pinsel, mouseX - 35, mouseY - 700);
  }
  
  py = y;
  px = x;
}

