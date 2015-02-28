
int NVALUES = 10;
float[] values;
int counter;

PFont f;
float w;

int indiceMIN;
int indiceMAX;

////////////////////////////////////////////////////////////////
void setup() {
  size(600, 200);
  smooth();
 
  inizializza();

  f = createFont("Courier", 72, true);
  w = float(width)/NVALUES;
  counter = 0;
}

////////////////////////////////////////////////////////////////
void draw() {
  background(255);
  
  pushStyle();
  textFont(f);
  textSize(12);
  textAlign(LEFT);
  fill(0);
  if(counter == 0) {
    text("QUALE il minimo e massimo ?\npress SPACE", 10, 20);
  } else {
    text("ECCOLI: minimo (ROSSO) e massimo (VERDE)\npress SPACE", 10, 20);
  }
  popStyle();
  
  pushStyle();
  textFont(f);
  textSize(12);
  textAlign(CENTER);
  stroke(120);
  strokeWeight(1);
  for(int i=0; i < NVALUES; i++) {
    fill(120, 80);
    rect(w*i, height-values[ i ], w, values[ i ] );
    fill(120);
    text("["+i+"]", w*i+w/2, height-5);
    fill(0);
    text(values[ i ], w*i+w/2, height-values[ i ]-5);
  }
  if(counter == 1) {
    noFill();
    strokeWeight(2);
    stroke(255, 0, 0);
    rect(w*indiceMIN, height-values[ indiceMIN ], w, values[ indiceMIN ] );
    stroke(0, 255, 0);
    rect(w*indiceMAX, height-values[ indiceMAX ], w, values[ indiceMAX ] );
  }
  popStyle();
}



////////////////////////////////////////////////////////////////
// vengono generati NVALUES randomici
void inizializza() {
  
  values = new float[NVALUES];
  for(int i = 0; i < values.length; i++) {
    values[i] = random(10, 150); 
  }
  
}


////////////////////////////////////////////////////////////////
void keyPressed() {
  switch(key) {
    case ' ':
    if(counter == 0) {
      indiceMIN = findMinIndex(values);
      indiceMAX = findMaxIndex(values);
    } else {
      inizializza();
    }
    counter = (counter + 1)%2;
    break;
    default:
    break;
  }
  
}


////////////////////////////////////////////////////////////////
int findMinIndex(float[] a) {  
  float winnerValue = 1000.0;
  int index = -1;
  for(int i=0; i < a.length; i++) {
    if(a[i] < winnerValue) {
      winnerValue = a[i];
      index = i;
    }
  }
  return index;
}

////////////////////////////////////////////////////////////////
int findMaxIndex(float[] a) {  
  float winnerValue = -1000.0;
  int index = -1;
  for(int i=0; i < a.length; i++) {
    if(a[i] > winnerValue) {
      winnerValue = a[i];
      index = i;
    }
  }
  return index;
}




