
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

void setup(){
  size(720, 720);
  frameRate(60);
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


  }

  //++ aggiungere eventuali inizializzazioni  o preimpostazioni grafiche
  stroke(255);

}

void draw(){
  
  //change color in tempo
    if(frameCount%180 <= 90){
      float tempo = norm(frameCount%180, 0, 90);
      color UPP = lerpColor(UP1, UP2, tempo);
      color MIDD = lerpColor(MID1, MID2, tempo);
      color DOWNN = lerpColor(DOWN1, DOWN2, tempo);
      //change color up to down
      for (int i = 0; i < height-height/3; i++) {
        float changeColor = norm(i, 0, height-height/3);
        color UPP_MIDD = lerpColor(UPP, MIDD, changeColor);
        stroke(UPP_MIDD);
        line(0, i, width, i);
      }
      for (int i = height-height/3; i <= height; i++) {
        float changeColor = norm(i, height-height/3, height);
        color MIDD_DOWNN = lerpColor(MIDD, DOWNN, changeColor);
        stroke(MIDD_DOWNN);
        line(0, i, width, i);
      }
    }
  
    else if(frameCount%180 > 90){
      float tempo = 1.0-norm(frameCount%180, 90, 180);
      color UPP = lerpColor(UP1, UP2, tempo);
      color MIDD = lerpColor(MID1, MID2, tempo);
      color DOWNN = lerpColor(DOWN1, DOWN2, tempo);
      //change color up to down
      for (int i = 0; i < height-height/3; i++) {
        float changeColor = norm(i, 0, height-height/3);
        color UPP_MIDD = lerpColor(UPP, MIDD, changeColor);
        stroke(UPP_MIDD);
        line(0, i, width, i);
      }
      for (int i = height-height/3; i <= height; i++) {
        float changeColor = norm(i, height-height/3, height);
        color MIDD_DOWNN = lerpColor(MIDD, DOWNN, changeColor);
        stroke(MIDD_DOWNN);
        line(0, i, width, i);
        }
      }

  
  
  // CODICE D'ESEMPIO CON cinetismi interattivi
   
  //++ ridefinire, in parte o completamente, il codice che segue
  //   mantenendo la progressivita' o introducendo cinetismi automatici o interattivi
 
  //position of stars
  for (int i=0; i<bikesID.length; i++) {   
    float x = bikesX[i];
    float y = bikesY[i];
    float distanza = dist(mouseX,mouseY,x,y);
    if (distanza < 100) {
      strokeWeight(2);
      stroke(255,255-distanza*3);
      line(x,y,mouseX,mouseY);
    }
    strokeWeight(3);
    stroke(255);
    point(x+random(-0.5,0.5),y+random(-0.5,0.5));
    strokeWeight(2);
    noFill();    
    ellipse(x,y, cerchio[i]*1.2+random(-2, 2), cerchio[i]*1.2+noise(-2,2) );
  }
  
  
  
  println(frameCount);


}



