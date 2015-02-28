
Sorter sorter;

int NVALUES = 10;
float[] values;
int counter;

PFont f;
float w;

float[] ordinato;
int[]   indici;

////////////////////////////////////////////////////////////////
void setup() {
  size(600, 200);
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
    fill(120, 80);
    rect(w*i, height-values[ indici[i] ], w, values[ indici[i] ] );
    fill(120);
    text("["+indici[i]+"]", w*i+w/2, height-5);
    fill(0);
    text(values[ indici[i] ], w*i+w/2, height-values[ indici[i] ]-5);
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
  
  sorter.init(values);
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
  float[] aux; 
  float[] b;
  int[] iAux; 
  int[] iB;
  boolean bOrdinato;
  
  // *** CONSTRUCTOR **********************************************************************************
  Sorter() {
    // non fare nulla
  }

  // *** INIT *****************************************************************************************
  void init(float[] original) {
    // se l'arrayènullo non fare nulla e ritorna al chiamante
    if (original == null) {
      println("array di partenza vuoto");
      return;
    }
    
    // in caso contrario costruisci 4 nuovi array di supporto
    aux = new float[original.length];
    b   = new float[original.length];
    iAux= new int[original.length];
    iB  = new int[original.length];
    for(int i = 0; i< original.length; i++) {
      aux[i] = original[i];
      iAux[i] = i;
    }
    bOrdinato = false;
  }
  
  // *** GETTERS **************************************************************************************
  // ottieni in uscita l'array con gli elementi ri-ordinati
  float[] getOrderedArray() {
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
  
  void mergeSort (float[] a, int left, int right) {
      if (left < right ) {
        int center = floor((left + right) / 2);
        mergeSort(a, left, center);
        mergeSort(a, center+1, right); 
        merge(a, left, center, right); 
      } 
  }
  
  void merge (float[] a, int left, int center, int right) {
    int i = left;
    int j = center+1;
    int k = left;
    
    while ( (i <= center) && (j <= right) ) {
      if (a[i] <= a[j]) {
        b[k] = a[i];
        iB[k] = iAux[i];
        i++;
      } else {
        b[k] = a[j];
        iB[k] = iAux[j];
        j++;
      }
      k ++;
    }
  
    while (i <= center) {
      b[k] = a[i];
      iB[k] = iAux[i];
      i ++;
      k ++;
    }
  
    while (j <= right) {
      b[k] = a[j];
      iB[k] = iAux[j];
      j ++;
      k ++;
    }
  
    for (k = left; k <= right; k++) {
      a[k] = b[k];
      iAux[k] = iB[k];
    }
  }
}





