
void setup ()
{
  size(360,500);
}

void draw()
{
}

int Farben(int Farbe)
{
  if ( random(1) > 0.5)
  {
  Farbe = Farbe + 1;
  if( Farbe > 2) { Farbe = 0;};
  
  if(Farbe == 0)
   {
     int ra = int(random(3));
     if( ra == 0 ) { fill(125, 0,255);};
     if( ra == 1 ) { fill(0,0,255);};
     if( ra == 2 ) { fill(0,125,255);};
   }
   
  if(Farbe == 1)
   {
     int ra = int(random(3));
     if( ra == 0 ) { fill(255,125,0);};
     if( ra == 1 ) { fill(255,0,0);};
     if( ra == 2 ) { fill(255,0,125);};
   } 
 
  if(Farbe == 2)
   {
     int ra = int(random(3));
     if( ra == 0 ) { fill(125,255,0);};
     if( ra == 1 ) { fill(0,255,0);};
     if( ra == 2 ) { fill(0,255,125);};
   }
 
  }
  return Farbe;
}

int Zeichne(int a, int i, int Farbe)
{
  Farbe = Farben(Farbe);
  rect(360/a*i, 0, 360/a, 500);
  return Farbe;
}

void RhythmusGitter()
{
 
 int a = int(random(36)+3);
 
 int Farbe = 0;
 
 for( int i = 0; i < a ; i = i + 2)
 {
  Farbe = Zeichne( a, i, Farbe );
 }
}


void keyPressed()
{
  fill(0,0,0);
  rect(0,0,360,500);
  fill(0,0,255);
  RhythmusGitter();
}
