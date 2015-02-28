
void setup(){
size(400,600);
background(255);
}

void mousePressed() { 
   background(255);
  int BildHoehe = 600;
  int BildBreite = 400;
  Teiler(0,0, BildHoehe, BildBreite,0);
}

void Teiler( int StartX, int StartY, int Hoehe, int Breite, int Tiefe)
{

if(Tiefe>1){
  ZeichneFlache( StartX, StartY, Hoehe, Breite);
}

if(Tiefe<=1){
int TeilungsArt = int(random(2));

switch( TeilungsArt ){
  
  case 0: WagerechteTeilung( StartY, StartX, Hoehe, Breite, Tiefe ); break;
  case 1: SenkrechteTeilung( StartY, StartX, Hoehe, Breite, Tiefe ); break;
}
}
}

void draw(){
}

void WagerechteTeilung(int StartY, int StartX, int Hoehe, int Breite, int Tiefe)
{
  int Anzahl = int(random(3));
  switch( Anzahl )
  {  
  case 0: ZeichneFlache(StartX, StartY, Breite, Hoehe); break;
  case 1: WT2(StartX, StartY, Breite, Hoehe, Tiefe); break;
  case 2: WT3(StartX, StartY, Breite, Hoehe, Tiefe); break;
  }
}

void WT2( int StartX, int StartY, int Breite, int Hoehe, int Tiefe)
{
  Teiler(StartX, StartY, Breite / 2, Hoehe, Tiefe + 1);
  Teiler(StartX + Breite/ 2, StartY, Breite / 2, Hoehe, Tiefe + 1);
  
} 

void WT3( int StartX, int StartY, int Breite, int Hoehe, int Tiefe)
{
  Teiler(StartX, StartY, Breite / 3, Hoehe, Tiefe + 1);
  Teiler(StartX + Breite / 3, StartY, Breite / 3, Hoehe, Tiefe + 1);
  Teiler(StartX + Breite / 3 * 2, StartY, Breite / 3, Hoehe, Tiefe + 1);
}

void SenkrechteTeilung(int StartY, int StartX, int Hoehe, int Breite, int Tiefe )
{
  int Anzahl = int(random(3));
  switch( 2 )
  {  
  case 0: ZeichneFlache(StartX, StartY, Breite, Hoehe); break;
  case 1: ST2(StartX, StartY, Breite, Hoehe, Tiefe); break;
  case 2: ST3(StartX, StartY, Breite, Hoehe, Tiefe); break;
  }
}

void ST2( int StartX, int StartY, int Breite, int Hoehe, int Tiefe)
{
  Teiler(StartX, StartY, Breite, Hoehe/ 2, Tiefe + 1);
  Teiler(StartX, StartY + Hoehe / 2, Breite, Hoehe / 2, Tiefe + 1);
  
} 

void ST3( int StartX, int StartY, int Breite, int Hoehe, int Tiefe)
{
  Teiler(StartX, StartY, Breite, Hoehe / 3, Tiefe + 1);
  Teiler(StartX, StartY + Hoehe / 3, Breite, Hoehe / 3, Tiefe + 1);
  Teiler(StartX, StartY + Hoehe / 3 * 2, Breite, Hoehe / 3, Tiefe + 1);
}

void ZeichneFlache(int StartX, int StartY, int Breite, int Hoehe){
  int Farbe = int(random(4));
  print(Farbe);
  switch(Farbe)
  {
    case 0: fill(255,255,255); break;
    case 1: fill(255,0,0); break;
    case 2: fill(0,255,0); break;
    case 3: fill(0,0,255); break;
  }
 
  rect( StartX, StartY, Breite, Hoehe);
  fill(0,0,0);
  
  int Starke = int(random(min(Breite, Hoehe)/6));
  rect(StartX, StartY, Starke, Hoehe);
  
  Starke = int(random(min(Breite, Hoehe)/6));
  rect(StartX+Breite-Starke, StartY, Starke, Hoehe);
  
  Starke = int(random(min(Breite, Hoehe)/6));
  rect(StartX, StartY, Breite, Starke);
  
  Starke = int(random(min(Breite, Hoehe)/6));
  rect(StartX, StartY+Hoehe-Starke, Breite, Starke);
  
}
