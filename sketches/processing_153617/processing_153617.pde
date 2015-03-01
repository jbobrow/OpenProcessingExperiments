
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
  
  
float[] cerchiDiamBase ; // diametri di riferimento
float[] cerchiDiam ;      // diametri correnti (o degli aloni)
float[] cerchiDiamVel ;
 
 
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
  String[] records = loadStrings("bikes-mi.tsv");
  // Crea e riempi gli array
  int recordsCount = records.length-1;      // -1 per escludere la prima riga di intestazione
  bikesID = new int[recordsCount];
  bikesX = new float[recordsCount];
  bikesY = new float[recordsCount];
  bikesCount = new int[recordsCount];
  bikesAddress = new String[recordsCount];
  bikesYear = new int[recordsCount];
  bikesType = new String[recordsCount];
   
  cerchiDiamBase = new float[recordsCount];  // diametri di riferimento
  cerchiDiam = new float[recordsCount];      // diametri correnti (o degli aloni)
  cerchiDiamVel = new float[recordsCount];
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
     
    cerchiDiamBase[iRecord] =  bikesCount[iRecord]/1+1;     // diametro base a caso
    cerchiDiam[iRecord] = cerchiDiamBase[iRecord];    // diametro corrente uguale a diametro base
    cerchiDiamVel[iRecord] = 0; 
  }
   
   
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  stroke(255);
}
  
void draw()
{
  // CODICE D'ESEMPIO CON cinetismi interattivi
    
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi
  

  centerX = width/2;
  centerY = height/2;

  background(0);
 
   
  for (int i=0; i<bikesID.length; i++) { 
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 80) {
      stroke(160,255-distanza*2);
      strokeWeight (1);
      line(x,y,mouseX,mouseY);
         
    }
    
     ellipse(mouseX, mouseY, 21, 21);
     stroke(180,130,150);
     fill(255,255-distanza*2);

    
   ellipse(x,y,25,25);

     fill(240,mouseY,180,120);

  
  }
}



