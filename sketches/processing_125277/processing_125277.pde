
//Klasse für alle Städte wird erstellt
class City {
  String name;
  String allrecord08;
  String allrecord09;
  String allrecord10;
  String allrecord11;
  String allrecord12;
  String crime108;
  String crime109;
  String crime110;
  String crime111;
  String crime112;
  String crime208;
  String crime209;
  String crime210;
  String crime211;
  String crime212;

  
   City (String _name, String _allrecord08, String _allrecord09, String _allrecord10, String _allrecord11, String _allrecord12, String _crime108, String _crime109, String _crime110, 
   String _crime111, String _crime112, String _crime208, String _crime209, String _crime210, String _crime211, String _crime212){
    name = _name;
    allrecord08 = _allrecord08;
    allrecord09 = _allrecord09;
    allrecord10 = _allrecord10;
    allrecord11 = _allrecord11;
    allrecord12 = _allrecord12;
    crime108 = _crime108;
    crime109 = _crime109;
    crime110 = _crime110;
    crime111 = _crime111;
    crime112 = _crime112;
    crime208 = _crime208;
    crime209 = _crime209;
    crime210 = _crime210;
    crime211 = _crime211;
    crime212 = _crime212;
   }
}

    
    

ArrayList<City> cityListe = new ArrayList<City>();
int j = 2;
boolean mausDa = false;


void setup() {
  size(1024,768);
  background(255);
  dateiLesen("Datensatz1.csv");
  tabelleZeichnen();
  noStroke(); //keine schwarzen Ränder mehr um alles, was gezeichnet wird
  frameRate(7); //frameRate geändert, weil sonst auch bei kurzem Tastendruck mehrmals durch diagramm() gelaufen wird
}



void draw(){
  diagramm();  
}



//Punkte aus Zahlen entfernen
//Hilfe von Maria
String Punktweg (String _str){
  if (_str.indexOf(".") > 0){
  String[] _str2 = split(_str, "."); //Zahl wird an Punkt in zwei Strings gesplittet
  String zusammengefuegt = _str2[0] + _str2[1]; //Zahl wird wieder ohne Punkt zusammengesetzt
  return(zusammengefuegt);
}
  else {
  return(_str);
  }  
}



//Datei als Arrays einlesen
void dateiLesen(String dateiname) {
  String[] alleZeilen = loadStrings(dateiname);
  
  for (int i = 0; i < alleZeilen.length; i++) {
    String[] aktuelleZeile = split(alleZeilen[i], ";");
    // überprüfen, aus welchen Teilen die aktuelle Zeile besteht
    City newCity = new City(aktuelleZeile[0], Punktweg(aktuelleZeile[1]), Punktweg(aktuelleZeile[2]), Punktweg(aktuelleZeile[3]), Punktweg(aktuelleZeile[4]), Punktweg(aktuelleZeile[5]), Punktweg(aktuelleZeile[6]), 
    Punktweg(aktuelleZeile[7]), Punktweg(aktuelleZeile[8]), Punktweg(aktuelleZeile[9]), Punktweg(aktuelleZeile[10]), Punktweg(aktuelleZeile[11]), Punktweg(aktuelleZeile[12]), Punktweg(aktuelleZeile[13]), Punktweg(aktuelleZeile[14]), Punktweg(aktuelleZeile[15])); //newCity wird definiert, Punkte werden aus jeder Zahl entfernt
    cityListe.add(newCity); //es wird ein Array erstellt, aus allen 'newCity'
  }
}



//Mittelwerte berechnen 
Float mittelwertBerechnen(String _m1, String _m2, String _m3, String _m4, String _m5){ //Funktionion bekommt Float mit 5 String Variablen
  float mittelwert = (float(_m1) + float(_m2) + float(_m3) + float(_m4) + float(_m5))/5; //Mittelwert aus diesen 5 Variablen berechnet
  return(mittelwert);
}



//Tabelle erstellen
void tabelleZeichnen() {
  for (int i = 2; i < cityListe.size(); i++){ //alle Zeilen der ArrayList werden durchlaufen ab dem zweiten Array
    City cityname = cityListe.get(i);
    City offences = cityListe.get(0);
 
    fill(0);
    textSize(13);
    text("Average crimes from 2008 to 2013", 50, 20);
    text("Cityname", 50, 50);
    text(cityname.name, 50, 50 + (30 * (i-1))); //Koordinaten sind immer abhängig von i, damit alle Namen untereinander in einer Spalte stehen
    text(offences.allrecord08, 250, 50);
    text(offences.crime108, 450, 50);
    text(offences.crime208, 650, 50);
    text("Change from 2008-2013", 850, 50);
    textSize(12);
    text(mittelwertBerechnen(cityname.allrecord08, cityname.allrecord09, cityname.allrecord10, cityname.allrecord11, cityname.allrecord12), 250, 50 + (30 * (i-1))); //hier sind die Koordinaten auch immer von i abhängig, außerdem wird hier die Funktion aufgerufen, die die Mittelwerte berechnet
    text(mittelwertBerechnen(cityname.crime108, cityname.crime109, cityname.crime110, cityname.crime111, cityname.crime112), 450, 50 + (30 * (i-1)));
    text(mittelwertBerechnen(cityname.crime208, cityname.crime209, cityname.crime210, cityname.crime211, cityname.crime212), 650, 50 + (30 * (i-1)));
    text(((float(cityname.allrecord12) - float(cityname.allrecord08))/float(cityname.allrecord12)*100) + "%", 850, 50 + (30 * (i-1)));
    }
}




//Diagramm erstellen
//Code abgeändert von: http://www.openprocessing.org/sketch/93945
void diagramm(){

    if (keyPressed == true) { //bei Tastendruck passiert folgendes
      if (j < cityListe.size()-1){ //wenn eine Taste gedrückt wird, wird j um 1 erhöht -> es werden alle Arrays der ArrayList durchlaufen
      j += 1;
      fill(255);
      rect(0, 400, 1200, 1200); //bei jedem neuen Durchgang wird ein weißes Rechteck über die vorherige Grafik gelegt, damit keine Überschneidungen entstehen
    }  
    else { //wenn das Ende der ArrayList erreicht ist, wird j wieder an den Anfang gesetzt
      j = 2;
      fill(255);
      rect(0, 400, 1200, 1200);
    }
   }
    else {
    }

  
    //mouseClicked(i=+1);
    City cityname = cityListe.get(j); //Array wird geladen
    City cityname2 = cityListe.get(0);
    float num1 = (((float(Punktweg(cityname.allrecord12)) - float(Punktweg(cityname.crime112)) - float(Punktweg(cityname.crime212)))/(float(Punktweg(cityname.allrecord12)))))*360; //prozentualer Anteil von 360° der Werte wird berechnet
    float num2 = float(Punktweg(cityname.crime112))/(float(Punktweg(cityname.allrecord12)))*360;
    float num3 = float(Punktweg(cityname.crime212))/(float(Punktweg(cityname.allrecord12)))*360;
  
    textSize(16);
    fill(0);
    text(cityname.name, width/2, 430);
    textSize(14);
    text("2012-2013", width/2, 450);
    
    textSize(12);
    fill(120, 130, 120);
    arc(width/2 - 100, height/1.3, 250, 250, radians(0), radians(num1)); //Winkel wird gezeichnet mit den prozentualen Anteilen, die vorher berechnet wurden

    fill(190, 10, 45);
    arc(width/2 - 100, height/1.3, 250, 250, radians(num1), radians(num1+num2));

    fill(152,65,89);
    arc(width/2 - 100, height/1.3, 250, 250, radians(num1+num2), radians(360));
   

    if (mouseX > (width/2 - 230) && mouseX < (width/2+25) &&
        mouseY > (height/1.3-125) && mouseY < (height/1.3+125)){ //wenn Mauszeiger über Kreisdiagramm gehalten wird, wird Legende angezeigt
      fill(190, 10, 45);      
      rect(width/2 + 125, 500, 14, 14);
      fill(0);
      text(cityname2.crime108, width/2 + 150, 510);
      fill(152,65,89);
      rect(width/2 + 125, 520, 14, 14);
      fill(0);
      text(cityname2.crime208, width/2 + 150, 530);
      fill(120, 130, 120);     
      rect(width/2 + 125, 540, 14, 14);
      fill(0);
      text("Other offences", width/2 + 150, 550);
      
      mausDa = true; 
      }
      else {
        mausDa = false;
      }
     
     if (mausDa == false){ //wenn Mauszeiger nicht auf Kreisdiagramm, wird wieder ein weißes Rechteck über den Bereich gezeichnet, damit die Legende verschwindet
          fill(255);
          rect(width/2 + 125, 500, 1200, 1200);
        }
        else {
        }
     }
        



