
// Esercizio 6.1 BikeSharing3D
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

// Ispirato da un lavoro di Valentina Vanasia



/**
 * SKETCH BASE PER ESERCITAZIONE 6
 * Corso di Computer Graphic 2013/14 prof. A. Belluscio
 *
 * Intervenire nelle parti contrassegnate con //++
 * seguendo le indicazioni riportate in:
 * http://www.exframes.net/cgbrera/lezioni/2013/trasformazioni-visualizzazioni
 *
 * Dati scaricati da: http://www.datiopen.it/it/opendata/Comune_di_Milano_Bike_sharing
 * Fonte originaria: http://dati.comune.milano.it/
 */
   


// DATI SULLE POSTAZIONI DEL BIKE SHARING
int[]    bikesID;       // Numero identificativo
float[]  bikesX;        // Coordinata x (adattata all'area di visualizzazione)
float[]  bikesY;        // Coordinata y (adattata all'area di visualizzazione)
int[]    bikesCount;    // Numero di biciclette
String[] bikesAddress;  // Via (senza numero civico)
int[]    bikesYear;     // Anno collocazione
String[] bikesType;     // Tipo collocazione ("Marciapiede", "Carreggiata" o "Carreggiata pedonale")



// ALTRE VARIABILI GLOBALI
float centerX;          // Centro dell'aera di visualizzazione, coincidente
float centerY;          // con il centro della mappatura (postazione p.zza Duomo)


  
//++ aggiungere variabili globali eventualmente necessarie
float[] shapeBaseDim;
float[] shapeDim;
float[] shapeVelDim;
float[] cubeRotateX;
float[] cubeRotateY;
float[] cubeRotateXVel;
float[] cubeRotateYVel;
float   distMax;
int     strokeColor;



// SETUP  
void setup()
{
  size(720, 720, P3D);
   
  centerX = width/2;
  centerY = height/2;
  distMax = mag(centerX,centerY);
    
  // Leggi tutti i dati
  String[] records = loadStrings("bike-sharing-mi.tsv");
  
  // Crea e riempi gli array
  int recordsCount = records.length-1;      // -1 per escludere la prima riga di intestazione
  bikesID = new int[recordsCount];
  bikesX = new float[recordsCount];
  bikesY = new float[recordsCount];
  bikesCount = new int[recordsCount];
  bikesAddress = new String[recordsCount];
  bikesYear = new int[recordsCount];
  bikesType = new String[recordsCount];
  
  //++ aggiungere altri eventuali valori
  shapeBaseDim = new float[recordsCount];  // diametri di riferimento
  shapeDim = new float[recordsCount];      // diametri correnti (o degli aloni)
  shapeVelDim = new float[recordsCount];
  cubeRotateX = new float[recordsCount];
  cubeRotateY = new float[recordsCount];
  cubeRotateXVel = new float[recordsCount];
  cubeRotateYVel = new float[recordsCount];
  
  // Leggi i dati di ogni postazione
  for (int i=1; i<records.length; i++) {    // i=1 per escludere la prima riga di intestazione
    // Leggi i dati della postazione (usando la tabulazione come separatore)
    String[] fields = split(records[i], '\t');          
    int iRecord = i-1;
    bikesID[iRecord] = int(fields[0]);
    float relativeLon = float(fields[1]) - 9.1889369782;  // Coordinate relative alla
    float relativeLat = float(fields[2]) - 45.4647711397; // postazione di p.zza Duomo
    bikesX[iRecord] = centerX + relativeLon*8000;
    bikesY[iRecord] = centerY - relativeLat*12000;        // - perche' coordinate y invertite
    bikesCount[iRecord] = int(fields[3]);
    bikesAddress[iRecord] = fields[4];
    bikesYear[iRecord] = int(fields[5]);
    bikesType[iRecord] = fields[6];
    
    //++ aggiungere altri eventuali comportamenti
    shapeBaseDim[iRecord] =  bikesCount[iRecord]/1+1;     // diametro base a caso
    shapeDim[iRecord] = shapeBaseDim[iRecord];            // diametro corrente uguale a diametro base
    shapeVelDim[iRecord] = 0;
    cubeRotateX[iRecord] = 0;
    cubeRotateY[iRecord] = 0;
    cubeRotateXVel[iRecord] = 0;
    cubeRotateYVel[iRecord] = 0;
  }
   
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  strokeColor = 255;
  colorMode (HSB,360,100,100,100);
  background(0,0,0,100);
  lights();
  stroke(strokeColor);
  noFill();
}



// DRAW  
void draw()
{
  // CODICE D'ESEMPIO CON cinetismi interattivi
    
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi
  
  background(0,0,0,100);
   
  for (int i=0; i<bikesX.length; ++i) {          // per ogni cerchio ...
    shapeDim[i] += shapeVelDim[i];               // aggiorna diametro
    cubeRotateX[i] += cubeRotateXVel[i];
    cubeRotateY[i] += cubeRotateYVel[i];
    if (shapeDim[i] > shapeBaseDim[i]*5) {       // se il diametro è maggiore di 5 volte il valore iniziale...
      shapeVelDim[i] = -1;                       // inverti velocità (riduzione anziché incremento)
      cubeRotateXVel[i] = -0.1;
      cubeRotateYVel[i] = -0.1;
    } else if (shapeDim[i] < shapeBaseDim[i]) {  // se, invece, il diametro è inferiore a quello iniziale...  
      shapeVelDim[i] = 0;                        // ferma la riduzione
      cubeRotateXVel[i] = 0;
      cubeRotateYVel[i] = 0;
    }
  }
  
  for (int i=0; i<bikesID.length; i++) {  
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    
    //float x = mouseX;
    //float y = mouseY;
    //x = screenX(x, y);
    //y = screenY(x, y);
    
    pushMatrix();
    translate(x, y, 100);
    rotateY(cubeRotateY[i]);
    rotateX(cubeRotateX[i]);
    box(shapeDim[i]);
    popMatrix();
  }
}



// MOUSE MOVED
void mouseMoved() {
  for (int i=0; i<bikesX.length; ++i) {           // per ogni cerchio
    
    float x = bikesX[i];
    float y = bikesY[i];
    float z = 100;
    x = screenX(x, y, z);
    y = screenY(x, y, z);
    
    if (dist(mouseX,mouseY, x,y) < shapeDim[i]/2) {  // se il mouse è sopra il cerchio...
      shapeVelDim[i] = random(2);                 // attiva l'incremento del diametro
      cubeRotateXVel[i] = random(0.1);
      cubeRotateYVel[i] = random(0.1);
    }
  }
}
