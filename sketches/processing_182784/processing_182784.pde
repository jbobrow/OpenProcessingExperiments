
/* @pjs preload="bici.png,sfondo.jpg"; */

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
 PImage bici;

 String letters= " ̧.-~yYzWaEg@";
int fontW= 7;
int fontH=10;
float lettDiv = 255.0/letters.length();

 
void setup()
{
  size(720, 720);
  background(0);
fill(255);
textFont(loadFont("Consolas-10.vlw"));
textAlign(LEFT,TOP);
  
  
  
  bici = loadImage("bici.png");
  centerX = width/2;
  centerY = height/2;
  
  
  
PImage foto= loadImage ("sfondo.jpg");
 foto.resize(foto.width/fontW, foto.height/fontH);
for(int y=0; y<foto.height; y++){
 for(int x=0; x<foto.width; x++){
  color col= foto.get(x,y);
  float pixelBright= brightness(col)/lettDiv;
  char letter = letters.charAt(int(pixelBright));
 text(letter, x*fontW, y*fontH);
 } 
}
   
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
    bikesY[iRecord] = centerY - relativeLat*12000;        // - perche' coordinate y invertite
    bikesCount[iRecord] = int(fields[3]);
    bikesAddress[iRecord] = fields[4];
    bikesYear[iRecord] = int(fields[5]);
    bikesType[iRecord] = fields[6];
  }
   
  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
 
}
 
 
void draw()
{
  // CODICE D'ESEMPIO CON CREAZIONE PROGRESSIVA DELLA MAPPATURA
   
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi


for (int i=0; i<bikesID.length; i++) {  
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    
    if (distanza < 1000) {
     
      stroke(255,255-distanza*1);
      line(x,y,mouseX,mouseY);

      if (bikesAddress[i].equals("P.za Duomo")) {
      
      fill(255,0,0);
    } 
    }
   
    stroke(255);
    
    triangle(x-4,y+3, x,y-3,   x+4,y+3);
    fill(90,100);   
    ellipse(x,y, 30,30);
  }
   
   if(mouseX < 720) {
    cursor(bici,15,15);
  } else {
    cursor(HAND);
  }

}



