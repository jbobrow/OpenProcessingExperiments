
// Erzeugen der Leinwand
// Achtung wird unter Bild Eigenschaften wieder holt
// Explizite Angabe ist wegen Java-Apllet nötig

void setup(){
size(400,600);
background(255);
}

// Bild Eigenschaften
 int BildHoehe = 600;
 int BildBreite = 400;
 int Satz = 3;
 
// Dies ist eine Dummy Prozedure die Processing braucht
void draw(){
}

// Hier beginnt die Erstellung des Bildes
// Es wird das erste mal  die Teilung Durch geführt
void mousePressed() { 
 int Zahler = 0; 
 background(255);
 Teiler(0,0, BildHoehe, BildBreite, Zahler);
}

//  Dies ist der Teiler der Rekursiv über einen Umweg aufgerufen wird
// Er selber stellt fest in welcher Richtung das Bild geteilt wird
// Und über gibt die Daten zur Teilung
 
void Teiler( int StartX, int StartY, int Hoehe, int Breite, int Zahler){
 Zahler = Zahler + 1;
 print(Zahler);
if(Zahler >= Satz)
{
  ZeichneFlache(StartX, StartY, Breite, Hoehe);
}
if(Zahler < Satz)
{

 { int TeilungsArt = int(random(2));

 
switch( TeilungsArt ){
  
  case 0: WagerechteTeilung( StartY, StartX, Hoehe, Breite, Zahler ); break;
  case 1: SenkrechteTeilung( StartY, StartX, Hoehe, Breite, Zahler ); break;
}
}
}
}


//Dies ist der Wagerechte Teiler
//Er stellt Fest wie oft Das Bild geteilt wird
//Und ruft nun abschließend die Teilung auf 


void WagerechteTeilung(int StartY, int StartX, int Hoehe, int Breite, int Zahler)
{
  int Anzahl = int(random(3));
  switch( Anzahl )
  {  
  case 0: ZeichneFlache(StartX, StartY, Breite, Hoehe); break;
  case 1: WT2(StartX, StartY, Breite, Hoehe, Zahler); break;
  case 2: WT3(StartX, StartY, Breite, Hoehe, Zahler); break;
  }
}

// Dies ist der Wagerecht Halbierer
// Er halbiert den Bild Bereich und ruft für jede Hälfte wieder den Teiler auf 
void WT2( int StartX, int StartY, int Breite, int Hoehe, int Zahler)
{
  Teiler(StartX, StartY, Breite / 2, Hoehe, Zahler);
  Teiler(StartX + Breite/ 2, StartY, Breite / 2, Hoehe, Zahler);
  
} 

// Dies ist der Wagerecht Teiler
// Er Teilt das Bild in drei Bereiche auf und ruft für jeden Teil den Teiler auf 
void WT3( int StartX, int StartY, int Breite, int Hoehe, int Zahler)
{
  Teiler(StartX, StartY, Breite / 3, Hoehe, Zahler);
  Teiler(StartX + Breite / 3, StartY, Breite / 3, Hoehe, Zahler);
  Teiler(StartX + Breite / 3 * 2, StartY, Breite / 3, Hoehe, Zahler);
}


//Dies ist der Senkrecht Teiler
//Er stellt Fest wie oft Das Bild geteilt wird
//Und ruft nun abschließend die Teilung auf 

void SenkrechteTeilung(int StartY, int StartX, int Hoehe, int Breite, int Zahler)
{
  int Anzahl = int(random(3));
  switch( 2 )
  {  
  case 0: ZeichneFlache(StartX, StartY, Breite, Hoehe); break;
  case 1: ST2(StartX, StartY, Breite, Hoehe, Zahler); break;
  case 2: ST3(StartX, StartY, Breite, Hoehe, Zahler); break;
  }
}

// Dies ist der Senkrecht Halbierer
// Er halbiert den Bild Bereich und ruft für jede Hälfte wieder den Teiler auf 

void ST2( int StartX, int StartY, int Breite, int Hoehe, int Zahler)
{
  Teiler(StartX, StartY, Breite, Hoehe/ 2, Zahler);
  Teiler(StartX, StartY + Hoehe / 2, Breite, Hoehe / 2, Zahler);
  
} 

// Dies ist der  Senkrecht Teiler
// Er Teilt das Bild in drei Bereiche auf und ruft für jeden Teil den Teiler auf
void ST3( int StartX, int StartY, int Breite, int Hoehe, int Zahler)
{
  Teiler(StartX, StartY, Breite, Hoehe / 3, Zahler);
  Teiler(StartX, StartY + Hoehe / 3, Breite, Hoehe / 3, Zahler);
  Teiler(StartX, StartY + Hoehe / 3 * 2, Breite, Hoehe / 3, Zahler);
} 


// Dies ist die Eigentliche Zeichen Funktion
// Sie ermittelt Zufällig eine Farbe in der Gemalt wird 
// Und malt damit die Fläche aus 

void ZeichneFlache(int StartX, int StartY, int Breite, int Hoehe){
  int Farbe = int(random(4));
      print("Hallo hier:");
      print (Farbe);
  switch(Farbe)
  {
    case 0: fill(255,255,255); break;
    case 1: fill(255,0,0); break;
    case 2: fill(0,255,0); break;
    case 3: fill(0,0,255); break;
  }
 
 rect( StartX, StartY, Breite, Hoehe);
 
 fill(0);
 rect(StartX, 0, 10, BildHoehe);
 rect(StartX-10+Breite, 0, 10, BildHoehe);
 rect(0, StartY, BildBreite, 10);
 rect(0, StartY+Hoehe, BildBreite, 10); 
}
