
/* !do not delete the line above, required for linking your tweak if you upload again */
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

float[] cerchiDiamBase ; // diametri di riferimento
float[] cerchiDiam ;      // diametri correnti (o degli aloni)
float[] cerchiDiamVel ;


// ALTRE VARIABILI GLOBALI
float centerX;          // Centro dell'aera di visualizzazione, coincidente
float centerY;          // con il centro della mappatura (postazione p.zza Duomo)

//++ aggiungere variabili globali eventualmente necessarie
float distMax;
  
  // per draw un cerchio fuori del point
float[] cerchio ;

 
//the color of sfondo
color UP1 = color(204, 51, 204);
color UP2 = color(0, 51, 255);
color MID1 = color(86, 42, 78);
color MID2 = color(0, 255, 204);
color DOWN1 = color(232, 95, 123);
color DOWN2 = color(211, 242, 97);


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
  
   cerchio = new float[recordsCount];

  
  cerchiX = new float[recordsCount];  // coordinate x iniziali (e a cui tornare)
  cerchiXVel = new float[recordsCount];   // velocitÃ  di spostamento sull'asse orizzontale (0=fermo; valori positivi=movimento verso destra; valori negativi=movimenti verso sinistra)
  cerchiY = new float[recordsCount];  // coordinate y iniziali (e a cui tornare)
  cerchiYVel = new float[recordsCount];   // velocitÃ  di spostamento sull'asse verticale (0=fermo; valori positivi=movimento verso il basso; valori negativi=movimenti verso l'alto)
  
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
    
    cerchio[iRecord] =  bikesCount[iRecord]/1+1;     // diametro base a caso
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

  background(45,0,255);
for (int i=0; i<bikesX.length; ++i) {             // per ogni cerchio ...
    cerchiDiam[i] += cerchiDiamVel[i];               // aggiorna diametro
    if (cerchiDiam[i] > cerchiDiamBase[i]*5) {       // se il diametro Ã¨ maggiore di 5 volte il valore iniziale...
      cerchiDiamVel[i] = -1;                         // inverti velocitÃ  (riduzione anzichÃ© incremento)
    } else if (cerchiDiam[i] < cerchiDiamBase[i]) {  // se, invece, il diametro Ã¨ inferiore a quello iniziale...  
      cerchiDiamVel[i] = 0;                          // ferma la riduzione
    }
  }
  
  for (int i=0; i<bikesID.length; i++) {  
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 85) {
      //stroke
      fill(255,255-distanza*3);
      //fill(0,255,255-distanza*3);
       
      //fill(random(348,360);
      //random (60,82)
      //random (64,100);
       
      
       
    } else {
    stroke(255);
    }
     
     
    ellipse(x,y, cerchiDiamBase[i], cerchiDiamBase[i] );
    noFill();
     
   noStroke();                                      // disegna cerchio base bianco semitrasparente
    
    stroke(255,180);                                 // disegna alone bianco semitrasparente
    noFill();
    ellipse(x, y,cerchiDiam[i], cerchiDiam[i]);
  }
}
 
void mouseMoved()                                    // A OGNI SPOSTAMENTO DEL MOUSE ...
{
  for (int i=0; i<bikesX.length; ++i) {             // per ogni cerchio
    if (dist(mouseX,mouseY, bikesX[i],bikesY[i]) < cerchiDiam[i]/2) {  // se il mouse Ã¨ sopra il cerchio...
      cerchiDiamVel[i] = 2;                          // attiva l'incremento del diametro
    }
  }
    for (int i=0; i<bikesID.length; i++) {   
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 85) {
      stroke(255,255-distanza*3);
      line(x,y,mouseX,mouseY);
    }
    stroke(255);
    point(x,y);
  }
}




