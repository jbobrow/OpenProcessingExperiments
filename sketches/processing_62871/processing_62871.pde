
int BildBreite = 400;
int BildHoehe = 400;

int Schrit = 400/6;


void setup(){
size(400,400);
}

void mousePressed() { // Erstellungs Routine
{

int Rot;
int Grun;
int Blau;

int Farbe = 0;
int[] NachTrag = { 0,0,0,0,0,0};


int AlteXFarbe = 0;
    int AlteYFarbe = 0;
    int FarbeX = 0;
    for(int i = 0; i <= BildBreite; i = i + Schrit )
    {
     
      AlteXFarbe = FarbeX;
        
        switch( AlteYFarbe)
        {
          case 0: FarbeX = XA(); break;
          case 1: FarbeX = XB(); break;
          case 2: FarbeX = XC(); break;
        }

     
      
    for(int j = 0; j <= BildHoehe; j = j + Schrit )
      {
        AlteYFarbe = Farbe;
        
        int Position = j / (400/3);
        
        switch( AlteYFarbe)
        {
          case 0: Farbe = YA(NachTrag[Position] ); break;
          case 1: Farbe = YB(NachTrag[Position] ); break;
          case 2: Farbe = YC(NachTrag[Position] ); break;
        }
         Malen(Farbe, i, j, Schrit);
        
        NachTrag[Position] = Farbe;
      }
  }
}
}

int YA( int Wert)
{
  int R = 0;       
  int Auswahl = int (random(10));
   switch ( Wert )
      {
        
        case 0:
          if(Auswahl <= 1 ) { R = 0;}
          if( ( Auswahl > 1 ) & ( Auswahl < 7 )) { R = 1; }
          if(Auswahl >= 7 ) { R = 2; }
          break;
          
        case 1:
          if(Auswahl <= 1 ) { R = 1;}
          if( ( Auswahl > 1 ) & ( Auswahl < 5 )) { R = 0; }
          if(Auswahl >= 5 ) { R = 2; }
          break;
          
        case 2:
          if(Auswahl <= 4 ) { R = 0;}
          if(Auswahl > 4) { R = 2;}
          break;
          
      }
     return R;
   }

int YB(int Wert )
{
  int R = 0; 
  int Auswahl = int(random(10));
   switch ( Wert )
      {
                
        case 0:
          if(Auswahl <= 1 ) { R = 0;}
          if( ( Auswahl > 1 ) & ( Auswahl < 7 )) { R = 1; }
          if(Auswahl >= 7 ) { R = 2; }
          break;
          
        case 1:
          if(Auswahl <= 1 ) { R = 1;}
          if( ( Auswahl > 1 ) & ( Auswahl < 5 )) { R = 0; }
          if(Auswahl >= 5 ) { R = 2; }
          break;
          
        case 2:
          if(Auswahl <= 4 ) { R = 0;}
          if(Auswahl > 4) { R = 2;}
          break;
      }
  return R;
}

int YC(int Wert)
{ 
  int Auswahl = int(random(10));
  int R = 0;

  switch ( Wert )
      {
         
        case 0:
          if(Auswahl <= 4 ) { R = 0; }
          if(Auswahl > 4 ) { R = 2; }
          break;
          
        case 1:
          if(Auswahl <= 4 ) { R = 0; }
          if(Auswahl > 4 ) { R = 2; }
          break;
          
        case 2:
          if(Auswahl <= 2 ) { R = 0; }
          if(Auswahl > 2 ) { R = 2; }
          break;
      }
   return 0;
}

int XA( )
{
   int Auswahl = int(random(2));
   int R = 1;
   
   switch( Auswahl )
   {
     case 0: R = 1; break;
     case 1: R = 2; break;
}
    return R;
}

int XB()
{
   int Auswahl = int(random(3));
   int R = 1;
   
   switch( Auswahl )
   {
     case 0: R = 0; break;
     case 1: R = 2; break;
}
return R;
}

int XC()
{ 
   return 0;
}

void draw(){
}

void Malen( int Farbe, int i, int j, int Schrit )
{
  switch( Farbe )
        {
          case 0: fill(255,0,0); break;
          case 1: fill(0,255,0); break;
          case 2: fill(0,0,255); break;
          
        }
        
        rect(i,j,Schrit,Schrit);
        
}
