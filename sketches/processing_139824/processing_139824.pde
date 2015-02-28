
Sorter sorter;

int NVALUES = 20;
float[][] points;
int counter;

PFont f;
float w;

float[][] ordinato;
int[]   indici;

////////////////////////////////////////////////////////////////
void setup() {
  size(400, 400);
  smooth();
 
  sorter = new Sorter();
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
    text("DISORDINE: press SPACE", 10, 20);
  } else {
    text("ORDINE: press SPACE", 10, 20);
  }
  popStyle();
  
  pushStyle();
  textFont(f);
  textSize(12);
  textAlign(CENTER);
  stroke(120);
  for(int i=0; i < NVALUES; i++) {
    fill(120, 90);
    ellipse(points[ indici[i] ][0], 20+points[ indici[i] ][1], 5, 5);
    fill(0);
    // qui indico l'ordine con cui i punti vengono disegnati
    // e a seguire l'indice con cui il punto era stato disegnato inizialmente
    text(i+"-"+indici[i], points[ indici[i] ][0], 20+points[ indici[i] ][1]-5);
  }
  noFill();
  strokeWeight(1);
  stroke(255, 0, 0, 70);
  line(10, 20+points[ indici[0] ][1], width-10, 20+points[ indici[0] ][1]);
  line(points[ indici[0] ][0], 20, points[ indici[0] ][0], height-10);
  strokeWeight(2);
  stroke(255, 0, 0);
  ellipse(points[ indici[0] ][0], 20+points[ indici[0] ][1], 7, 7);
  popStyle();
}



////////////////////////////////////////////////////////////////
// vengono generati NVALUES randomici
void inizializza() {
  
  points = new float[NVALUES][2];
  for(int i = 0; i < points.length; i++) {
    points[i][0] = random(10, width-10);
    points[i][1] = random(20, height-30); 
  }
  
  sorter.init(points);
  ordinato = sorter.getOrderedArray();
  indici   = sorter.getOrderedIndex();
  
  // *** stampa **************************************************
  /*
  print("\n         indici =  ");
  for(int i = 0; i < NVALUES; i++) print( i+"  ");
  
  print("\n         valori = ");
  for(int i = 0; i < NVALUES; i++) print( (int)values[i]+" ");

  //print("\n       ordinati = ");
  //for(int i = 0; i < NVALUES; i++) print( (int)ordinato[i]+" ");

  print("\n       ordinati = ");
  for(int i = 0; i < NVALUES; i++) print( (int)values[ indici[i] ]+" ");
  
  print("\nindici ordinati =  ");
  for(int i = 0; i < NVALUES; i++) print(indici[i]+"  ");
  */
  
}

void keyPressed() {
  switch(key) {
    case ' ':
    if(counter == 0) {
      sorter.riOrdina(0, NVALUES-1);
      ordinato = sorter.getOrderedArray();
      indici   = sorter.getOrderedIndex();
    } else {
      inizializza();
      //ordinato = sorter.getOrderedArray();
      //indici   = sorter.getOrderedIndex();
    }
    counter = (counter + 1)%2;
    break;
    default:
    break;
  }
  
}






class Sorter {
  float[][] aux; 
  float[][] b;
  int[] iAux; 
  int[] iB;
  boolean bOrdinato;
  
  // *** CONSTRUCTOR **********************************************************************************
  Sorter() {
    // non fare nulla
  }

  // *** INIT *****************************************************************************************
  void init(float[][] original) {
    // se l'arrayènullo non fare nulla e ritorna al chiamante
    if (original == null) {
      println("array di partenza vuoto");
      return;
    }
    
    // in caso contrario costruisci 4 nuovi array di supporto
    aux = new float[original.length][2];
    b   = new float[original.length][2];
    iAux= new int[original.length];
    iB  = new int[original.length];
    for(int i = 0; i< original.length; i++) {
      aux[i][0] = original[i][0];
      aux[i][1] = original[i][1];
      iAux[i] = i;
    }
    bOrdinato = false;
  }
  
  // *** GETTERS **************************************************************************************
  // ottieni in uscita l'array con gli elementi ri-ordinati
  float[][] getOrderedArray() {
    if(bOrdinato) {
      println("valori ordinati");
    } else {
      println("valori NON ordinati");
    }
    return aux;
  }
  
  // ottieni in uscita l'array con gli indici degli elementi originari, ri-ordinati
  int[] getOrderedIndex() {
    if(bOrdinato) {
      println("indici ordinati");
    } else {
      println("indici NON ordinati");
    }
    return iAux;
  }
  
  
  // *** MERGE FUNCTIONS ******************************************************************************
  void riOrdina(int left, int right) {
    // effettuo il primo ordinamento
    mergeSort(aux, left, right);
    bOrdinato = true;
  }
  
  void mergeSort (float[][] a, int left, int right) {
      if (left < right ) {
        int center = floor((left + right) / 2);
        mergeSort(a, left, center);
        mergeSort(a, center+1, right); 
        merge(a, left, center, right); 
      } 
  }
  
  void merge (float[][] a, int left, int center, int right) {
    int i = left;
    int j = center+1;
    int k = left;
    
    while ( (i <= center) && (j <= right) ) {
      
      if (a[i][1] == a[j][1]) { 
        // i punti hanno le stesse coordinate
        // comincio con quella che ha la 'x' minore
        if(a[i][0] <= a[j][0]) {
          b[k][0] = a[i][0];
          b[k][1] = a[i][1];
          iB[k] = iAux[i];
          i++;
        } else {
          b[k][0] = a[j][0];
          b[k][1] = a[j][1];
          iB[k] = iAux[j];
          j++;
        }
      } else if (a[i][1] < a[j][1]) {
        b[k][0] = a[i][0];
        b[k][1] = a[i][1];
        iB[k] = iAux[i];
        i++;
      } else {
        b[k][0] = a[j][0];
        b[k][1] = a[j][1];
        iB[k] = iAux[j];
        j++;
      }
      k ++;
    }
  
    while (i <= center) {
      b[k][0] = a[i][0];
      b[k][1] = a[i][1];
      iB[k] = iAux[i];
      i ++;
      k ++;
    }
  
    while (j <= right) {
      b[k][0] = a[j][0];
      b[k][0] = a[j][1];
      iB[k] = iAux[j];
      j ++;
      k ++;
    }
  
    for (k = left; k <= right; k++) {
      a[k][0] = b[k][0];
      a[k][1] = b[k][1];
      iAux[k] = iB[k];
    }
  }
}





