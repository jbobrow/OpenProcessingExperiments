
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
 float[] cerchiX; // coordinate x iniziali (e a cui tornare)
float[] cerchiXVel;   // velocitÃ  di spostamento sull'asse orizzontale (0=fermo; valori positivi=movimento verso destra; valori negativi=movimenti verso sinistra)
float[] cerchiY;  // coordinate y iniziali (e a cui tornare) 
float[] cerchiYVel;   // velocitÃ  di spostamento sull'asse verticale (0=fermo; valori positivi=movimento verso il basso; valori negativi=movimenti verso l'alto)
// ALTRE VARIABILI GLOBALI
float centerX;          // Centro dell'aera di visualizzazione, coincidente
float centerY;          // con il centro della mappatura (postazione p.zza Duomo) 
 
//++ aggiungere variabili globali eventualmente necessarie
float distMax;
 
void setup()
{
  size(720, 720);
  centerX = width/2;
  centerY = height/2;
  distMax = mag(centerX,centerY);
  println(distMax);
   
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
  cerchiXVel = new float[recordsCount];   // velocitÃ  di spostamento sull'asse orizzontale (0=fermo; valori positivi=movimento verso destra; valori negativi=movimenti verso sinistra)
  cerchiY = new float[recordsCount];  // coordinate y iniziali (e a cui tornare)
  cerchiYVel = new float[recordsCount];   // velocitÃ  di spostamento sull'asse verticale (0=fermo; valori positivi=movimento verso il basso; valori negativi=movimenti verso l'alto)  // Leggi i dati di ogni postazione
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
    cerchiXVel[iRecord] = 0;                     // velocitÃ  iniziale sull'asse delle x uguale a 0 (nessun movimento)
    cerchiY[iRecord] = bikesY[iRecord];           // coordinata y corrente uguale a coordinata y iniziale
    cerchiYVel[iRecord] = 0;                     // velocitÃ  iniziale sull'asse delle y uguale a 0 (nessun movimento)
  }
  
   
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  
}
 
void draw()
{
  colorMode (RGB, 255);
  background (0, 0, 80);
  // CODICE D'ESEMPIO CON cinetismi interattivi
   
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi
 
   for (int i=0; i<cerchiX.length; ++i) {         // per ogni cerchio ...
    cerchiX[i] += cerchiXVel[i];                 // aggiorna coordinata x
    cerchiY[i] += cerchiYVel[i];                 // aggiorna coordinata y
    float distMouse = dist(mouseX,mouseY,cerchiX[i],cerchiY[i]);  // calcola la distanza del cerchio dal mouse
    if (distMouse < 60) {                        // se la distanza dal mouse Ã¨ inferiore a 60 pixel ...
      cerchiXVel[i] = (cerchiX[i]-mouseX) / 10;  // calcola l'entitÃ  del movimento in direzione opposta
      cerchiYVel[i] = (cerchiY[i]-mouseY) / 10;
    } else if (distMouse < 60) {                 // se, invece, la distanza Ã¨ inferiore a 60 ...
        cerchiXVel[i] = 0;                       // ferma i movimenti
        cerchiYVel[i] = 0;
    } else {                                     // negli altri casi (distanza dal mouse di 60 pixel e oltre) ...
      float distBase = dist(cerchiX[i],cerchiY[i], bikesX[i],bikesY[i]);  // calcola distanza dalle coordinate iniziali 
      if (distBase > 1) {                        // se la distanza Ã¨ superiore a un pixel ...
        cerchiXVel[i] = (bikesX[i]-cerchiX[i]) / 1;  // calcola l'entitÃ  del movimento verso la posizione iniziale
        cerchiYVel[i] = (bikesY[i]-cerchiY[i]) / 1;
      } else {                                   // altrimenti (il cerchio Ã¨ giÃ  tornato alla posizione iniziale) ...
        cerchiXVel[i] = 0;                       // ferma i movimenti
        cerchiYVel[i] = 0;
      }
    } 
  }
  for (int i=0; i<cerchiX.length; i++) {   
    float x = cerchiX[i];
    float y = cerchiY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 60); 
    stroke(255, 250, 200);
    strokeWeight(1);
    line(x+random(-1.5, 1.5),y+random(-1.5, 1.5), 360, 360);
    
    
   

  }
}


