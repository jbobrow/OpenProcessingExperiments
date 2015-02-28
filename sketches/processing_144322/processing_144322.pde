
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
  // Leggi i dati di ogni postazione
  for (int i=1; i<records.length; i++) {    // i=1 per escludere la prima riga di intestazione
    // Leggi i dati della postazione (usando la tabulazione come separatore)
    String[] fields = split(records[i], '\t');            
    int iRecord = i-1;
    bikesID[iRecord] = int(fields[0]); 
    float relativeLon = float(fields[1]) - 9.1889369782;  // Coordinate relative alla
    float relativeLat = float(fields[2]) - 45.4647711397; // postazione di p.zza Duomo
    bikesX[iRecord] = centerX + relativeLon*8000;
    bikesY[iRecord] = centerY - relativeLat*12000;        // - perchè coordinate y invertite
    bikesCount[iRecord] = int(fields[3]);
    bikesAddress[iRecord] = fields[4];
    bikesYear[iRecord] = int(fields[5]);
    bikesType[iRecord] = fields[6];
  }
  
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  background(255);
  noStroke();
}

void draw() 
{
  // CODICE D'ESEMPIO CON CREAZIONE PROGRESSIVA DELLA MAPPATURA
  
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita'Â  o introducendo cinetismi automatici o interattivi
  
  if (frameCount-1 < bikesID.length) 
  {
    int i = frameCount-1;
    
    float x = bikesX[i];
    float y = bikesY[i];
    int diam = (bikesCount[i]+1) * 4;  // +1 perche' esiste una postazione con 0 bici 
    
    if (bikesType[i].equals("Marciapiede")) {
      fill(0,255,255,64);
    } else if (bikesType[i].equals("Carreggiata")) {
      fill(255,0,255,64);
    } else {
      fill(255,255,0,64);
    }
    
    ellipse(x,y, diam,diam ); 
  } 
}



