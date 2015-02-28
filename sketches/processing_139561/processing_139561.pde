
int NVALUES = 10;
int[][] values;
float w;
int counter = 0;
PFont f;

////////////////////////////////////////////////////////////////
void setup() {
  size(400, 400);
  smooth();
 
  inizializza();

  f = createFont("Courier", 72, true);
}

////////////////////////////////////////////////////////////////
void draw() {
  background(255);
  
  pushStyle();
  textFont(f);
  textAlign(CENTER);
  textSize(12);
  strokeWeight(1);
  for(int i= 0; i < values.length; i++) {
    stroke(0, 60);
    line(w*i+w/2, height, w*i+w/2, height-values[i][1]);
    stroke(0);
    fill(0);
    ellipse(w*i+w/2, height-values[i][1], 5, 5);
    fill(255, 0, 0);
    text(char(65 + values[i][0]), w*i+w/2, height-values[i][1]-10);
  }
  popStyle();
  
  
  pushStyle();
  textFont(f);
  textAlign(LEFT);
  textSize(14);
  strokeWeight(1);
  fill(0, 120);
  if (counter == 0) 
    text("CAOS: press any key to create ORDER", 10, 20);
  else
    text("ORDER: press any key to create CAOS", 10, 20);
 
}



////////////////////////////////////////////////////////////////
// vengono generati NVALUES randomici
void inizializza() {
  NVALUES = (int)random(10, 50);
  values = new int[NVALUES][2];
  for(int i = 0; i < values.length; i++) {
    values[i][0] = i;
    values[i][1] = (int)random(width-40); 
  }
  
  w = (float)width / NVALUES;
}


////////////////////////////////////////////////////////////////
// i valori random vengono ordinati secondo l'algoritmo di MERGE SORT
void keyPressed() {
  if (counter == 0)
    mergeSort(values, 0, NVALUES-1);
  else
    inizializza();
  counter = (counter + 1)%2;
}



void mergeSort (int[][] a, int left, int right) {
    if (left < right ) {
      int center = floor((left + right) / 2);
      mergeSort(a, left, center);
      mergeSort(a, center+1, right); 
      merge(a, left, center, right); 
    } 
}

void merge (int[][] a, int left, int center, int right) {
  int[][] b = new int[a.length][2];
  int i = left;
  int j = center+1;
  int k = left;
  
  while ( (i <= center) && (j <= right) ) {
    if (a[i][1] <= a[j][1]) {
      b[k][1] = a[i][1];
      b[k][0] = a[i][0];
      i++;
    } else {
      b[k][1] = a[j][1];
      b[k][0] = a[j][0];
      j++;
    }
    k ++;
  }

  while (i <= center) {
    b[k][1] = a[i][1];
    b[k][0] = a[i][0];
    i ++;
    k ++;
  }

  while (j <= right) {
    b[k][1] = a[j][1];
    b[k][0] = a[j][0];
    j ++;
    k ++;
  }

  for (k = left; k <= right; k++) {
    a[k][0] = b[k][0];
    a[k][1] = b[k][1];
  }
}





