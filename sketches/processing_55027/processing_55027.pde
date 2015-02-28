
//Arrays zum speichern der daten
String[]sorten;
int[]anzahlen;

PFont schrift;
String txt = "";


void setup(){
  scale(0.9);
  size(1050,500);
  schrift=loadFont("ami.vlw");
  textFont(schrift);
  
 String[] zeilen = loadStrings("input_clean_sorted.csv");

//arrays anlegen
sorten = new String[zeilen.length];
anzahlen= new int[zeilen.length];


  for (int i =0; i < zeilen.length; i++){
    //pro Zeile:
    
    //spalten trennen:
    String[]spalten = splitTokens(zeilen[i], ";");
 
   //werte einlesen
   String sorte = spalten[0]; //sorte
   int anzahl = int (spalten[1]); //azahl
   
   
   sorten[i]=sorte; //eingelesene sorte speichern
   anzahlen[i] = anzahl; // eingelesene anzahl speichern
   
   
   println(sorte + ":" + anzahl);
   
  
  }
 
}


void draw(){
  
 background(255);

for (int j=0; j<sorten.length; j++){

 int x=j*10;
 
 if(mouseX>x&&mouseX<x+7){
 fill(242,233,44);
 text(sorten[j], 400,450);
 }
 else
  fill(222,69,110);

rect(x, 0, 7, anzahlen[j]/10);


}
}




