
// DATI SULLE POSTAZIONI DEL BIKE SHARING
int[]    bikesID;       // Numero identificativo
float[]  bikesX;        // Coordinata x (adattata all'area di visualizzazione)
float[]  bikesY;        // Coordinata y (adattata all'area di visualizzazione)
int[]    bikesCount;    // Numero di biciclette
String[] bikesAddress;  // Via (senza numero civico)
int[]    bikesYear;     // Anno collocazione
String[] bikesType;     // Tipo collocazione ("Marciapiede", "Carreggiata" o "Carreggiata pedonale")
float[] cerchiX; // coordinate x iniziali (e a cui tornare) 
float[] cerchiXVel;   // velocità di spostamento sull'asse orizzontale (0=fermo; valori positivi=movimento verso destra; valori negativi=movimenti verso sinistra)
float[] cerchiY;  // coordinate y iniziali (e a cui tornare)  
float[] cerchiYVel;   // velocità di spostamento sull'asse verticale (0=fermo; valori positivi=movimento verso il basso; valori negativi=movimenti verso l'alto)

// ALTRE VARIABILI GLOBALI
float centerX;          // Centro dell'aera di visualizzazione, coincidente
float centerY;          // con il centro della mappatura (postazione p.zza Duomo)
//++ aggiungere variabili globali eventualmente necessarie
void setup()
{
  size(720, 720);
  centerX = width/2;
  centerY = height/2;
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
  cerchiX = new float[recordsCount];  // coordinate x iniziali (e a cui tornare)
  cerchiXVel = new float[recordsCount];   // velocità di spostamento sull'asse orizzontale (0=fermo; valori positivi=movimento verso destra; valori negativi=movimenti verso sinistra)
  cerchiY = new float[recordsCount];  // coordinate y iniziali (e a cui tornare)
  cerchiYVel = new float[recordsCount];   // velocità di spostamento sull'asse verticale (0=fermo; valori positivi=movimento verso il basso; valori negativi=movimenti verso l'alto)
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
    cerchiX[iRecord] = bikesX[iRecord];           // coordinata x corrente uguale a coordinata x iniziale
    cerchiXVel[iRecord] = 0;                     // velocità iniziale sull'asse delle x uguale a 0 (nessun movimento)
    cerchiY[iRecord] = bikesY[iRecord];           // coordinata y corrente uguale a coordinata y iniziale
    cerchiYVel[iRecord] = 0;                     // velocità iniziale sull'asse delle y uguale a 0 (nessun movimento)
  }
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  noStroke();
}
void draw()
{
  colorMode (RGB, 255);
  background (0, 103, 77);
  // CODICE D'ESEMPIO CON CREAZIONE PROGRESSIVA DELLA MAPPATURA
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi

  for (int i=0; i<cerchiX.length; ++i) {         // per ogni cerchio ...
    cerchiX[i] += cerchiXVel[i];                 // aggiorna coordinata x
    cerchiY[i] += cerchiYVel[i];                 // aggiorna coordinata y 
    float distMouse = dist(mouseX,mouseY,cerchiX[i],cerchiY[i]);  // calcola la distanza del cerchio dal mouse
    if (distMouse < 80) {                        // se la distanza dal mouse è inferiore a 80 pixel ...
      cerchiXVel[i] = (cerchiX[i]-mouseX) / 20;  // calcola l'entità del movimento in direzione opposta
      cerchiYVel[i] = (cerchiY[i]-mouseY) / 20;
    } else if (distMouse < 90) {                 // se, invece, la distanza è inferiore a 90 ...
        cerchiXVel[i] = 0;                       // ferma i movimenti 
        cerchiYVel[i] = 0;
    } else {                                     // negli altri casi (distanza dal mouse di 90 pixel e oltre) ... 
      float distBase = dist(cerchiX[i],cerchiY[i], bikesX[i],bikesY[i]);  // calcola distanza dalle coordinate iniziali  
      if (distBase > 1) {                        // se la distanza è superiore a un pixel ... 
        cerchiXVel[i] = (bikesX[i]-cerchiX[i]) / 20;  // calcola l'entità del movimento verso la posizione iniziale
        cerchiYVel[i] = (bikesY[i]-cerchiY[i]) / 20;
      } else {                                   // altrimenti (il cerchio è già tornato alla posizione iniziale) ...
        cerchiXVel[i] = 0;                       // ferma i movimenti
        cerchiYVel[i] = 0;
      }
    }  
  }
 
  // DISEGNA I CERCHI
  for (int i=0; i<cerchiX.length; ++i) {   // per ogni cerchio ...  
    float x = cerchiX[i];
    float y = cerchiY[i];
    int diam = bikesCount[i]/2+1;  // +1 perche' esiste una postazione con 0 bici
    colorMode (HSB, 360, 100, 100);
    fill (21+i, 0+i, 90+i, 240);
    rect(x, y, diam, diam);
  }
  }


