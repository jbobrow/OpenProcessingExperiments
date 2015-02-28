
int NPOINTS = 15;
float[][] points;
int counter;

PFont f;
float margin = 20;

int indiceMIN;
int indiceMAX;

////////////////////////////////////////////////////////////////
void setup() {
  size(400, 400);
  smooth();
 
  inizializza();

  f = createFont("Courier", 72, true);
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
  for(int i=0; i < points.length; i++) {
    fill(120, 80);
    ellipse(points[i][0], points[i][1], 5, 5);
    fill(120);
    text("["+i+"]", points[i][0], points[i][1]+15);
    fill(0);
    //text(points[i][0]+","+points[i][1], points[i][0], points[i][1]);
  }
  if(counter == 1) {
    noFill();
    strokeWeight(1);
    stroke(255, 0, 0, 100);
    line(margin, points[ indiceMIN ][1], width-2*margin, points[ indiceMIN ][1]);
    line(points[ indiceMIN ][0], margin, points[ indiceMIN ][0], height-margin);
    stroke(0, 255, 0, 100);
    line(margin, points[ indiceMAX ][1], width-2*margin, points[ indiceMAX ][1]);
    line(points[ indiceMAX ][0], margin, points[ indiceMAX ][0], height-margin);
    strokeWeight(2);
    stroke(255, 0, 0);
    ellipse(points[ indiceMIN ][0], points[ indiceMIN ][1], 5, 5);
    stroke(0, 255, 0);
    ellipse(points[ indiceMAX ][0], points[ indiceMAX ][1], 5, 5);
  }
  popStyle();
}



////////////////////////////////////////////////////////////////
// vengono generati NVALUES randomici
void inizializza() {
  points = new float[NPOINTS][2];
  // caso DEFAULT
  for(int i = 0; i < points.length; i++) {
    points[i][0] = random(margin, width-margin);
    points[i][1] = random(margin+20, height-margin);
  } 
}


////////////////////////////////////////////////////////////////
void keyPressed() {
  switch(key) {
    case ' ':
    if(counter == 0) {
      indiceMIN = findMinIndex(points);
      indiceMAX = findMaxIndex(points);
    } else {
      inizializza();
    }
    counter = (counter + 1)%2;
    break;
    default:
    break;
  }
}

//////////////////////////////////////////////////////////////// FIND MIN
int findMinIndex(float[][] a) {  
  float winnerValue = 1000;
  int index = -1;
  for(int i=0; i < a.length; i++) {
    // trovo due y uguali
    if(a[i][1] == winnerValue) {
      // allora discrimino in base alla x
      if (a[i][0] <= a[index][0]) {
        index = i;
      }
    } else if (a[i][1] < winnerValue) {
      // eleggo l'attuale y a 'vincente'
      winnerValue = a[i][1];
      index = i;
    }
  }
  return index;
}

//////////////////////////////////////////////////////////////// FIND MAX
int findMaxIndex(float[][] a) {  
  float winnerValue = -1000;
  int index = -1;
  for(int i=0; i < a.length; i++) {
    // trovo due y uguali
    if (a[i][1] == winnerValue) {
      // allora discrimino in base alla x
      if (a[i][0] >= a[index][0]) {
        index = i;
      }
    } else if(a[i][1] > winnerValue) {
      winnerValue = a[i][1];
      index = i;
    }
  }
  return index;
}




