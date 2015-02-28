
int i = 8;  
int j;  
PImage img;


float yoff = 0.0f;      
float[] yvalues;         

void setup() {

  int j=600;
  int h=200;
  img = loadImage("snow.png");
  size(400, 500);
  frameRate(20);
  smooth();
  j = 600;
  yvalues = new float[j/i];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  float dx = 0.05f;
  float dy = 0.1f;
  float amplitude = 500f;

  yoff += dy;


  float xoff = yoff; 

  for (int i = 0; i < yvalues.length; i++) {

    yvalues[i] = (2*noise(xoff)-1)*amplitude;    
    xoff+=dx;
  }
}

void renderWave() {

  for (int x = 0; x < yvalues.length; x++) {
    noStroke();
    image(img, x*i, width/2+yvalues[x], 20, 16);
    tint(random(255),random(255),random(255)); 
    image(img, x*i, 500-(width/2+yvalues[x]), 20, 16);
    fill(random(255), random(255), random(255));
    rect(x*i, 100, 20, 20);
    rect(x*i, 200, 20, 20);
    rect(x*i, 300, 20, 20);
  }
}


