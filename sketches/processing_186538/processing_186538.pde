

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
   

  stroke(255);
}
 
void draw()
{

 
  background(200,0,0);
 
  for (int i=0; i<bikesID.length; i++) {   
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 40) {
      stroke(50,50-distanza*3);
     strokeWeight(1);
     stroke(0);
      noFill();
      ellipse(x,y,mouseX,mouseY);
    }
    
    stroke(0);
    fill(random(255),random (255),0);
    rect(x,y, 20,20);
  }
}


