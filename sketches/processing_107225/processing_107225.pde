
void setup()
{
  size(500, 360);
}

void draw()
{
}

class Kadenz
{
  float[] KadenzStruktur = new float[4];
  int Dauer;
  
  float AkkordDiv( float Wert)
  {
    int a = int(random(3));
    Wert = Wert + ((a-1)*0.25);
   
    return Wert;
  }
  
  Kadenz(int Lange)
  {
    Dauer = Lange; 
    float LetzterAkkord = 0;
    float Zufall = 0;
    
    for( int a = 0; a < Lange; a++)
    {
      Zufall = random(a);
    
    int AkkordKlasse = int( LetzterAkkord);
    
    switch( AkkordKlasse ){
    case 0:
      if( Zufall < 0.2) { LetzterAkkord = 0;};
      if( (Zufall > 0.2)  && (Zufall < 0.6)) { LetzterAkkord = 1;};
      if( Zufall >  0.6) { LetzterAkkord = 2;};
      break;
    case 1:
      if( Zufall < 0.2) { LetzterAkkord = 0;};
      if( (Zufall > 0.2)  && (Zufall < 0.4)) { LetzterAkkord = 1;};
      if( Zufall > 0.4) { LetzterAkkord = 2;};
      break;
    case 2:
      if( Zufall < 0.4) { LetzterAkkord = 0;};
      if( (Zufall > 0.4)) { LetzterAkkord = 2;};
      break;
    }
    
    if( a == ( Lange - 1)) { LetzterAkkord = 0; };
      
    
    LetzterAkkord = AkkordDiv( LetzterAkkord );
    
    // int[] KadenzStruktur = new int[4];
       KadenzStruktur[a] = LetzterAkkord;
    }
   
  }
  
  void Zeichne( int x, int y, int dx, int dy )
  {
    for(int i = 1; i <= Dauer; i++)
    {
      float Akkord = KadenzStruktur[i-1];
      int Klasse = int(Akkord+0.5);
      int Divert = int((Akkord * 4)-Klasse*4);
      switch (Klasse){
        case 0:
          switch(Divert){
            case -1:
              fill(200, 0,255);
             
              break;
            case 0:
              fill(0,0,255);
              break;
            case +1:
              fill(0, 200,255);
              break;
          }
          rect( x + ( dx/Dauer*(i-1)), y, (dx/Dauer), dy);
          break;
      
        case 1:
          switch(Divert){
            case -1:
              fill(255,100,0);
              break;
            case 0:
              fill(255,0,0);
              break;
            case +1:
              fill(255,0,100);
              break;
          }
          ellipse(x+ dx/Dauer*i - (dx/(2*Dauer)), y+dy/2, dx/Dauer,dy);
          // ellipse(0+250
          break;
        case 2:
          switch(Divert){
            case -1:
              fill(220,255,0);
              break;
            case 0:
              fill(0,255,0);
              break;
            case +1:
              fill(0, 255, 220);
              break;
          }
          rect( x + ( dx/Dauer*(i-1)), y, (dx/Dauer), dy);
      }
      }
  }
    
}



void keyPressed()
{
  fill(0,0,0);
  rect(0,0,500,360);
  
  // Kadenz Kadenz1 = new Kadenz(3);
  Kadenz[] o = new Kadenz[7];
  
  int GG = 6;
  for(int i = 1; i < GG; i++)
  {
  o[i] = new Kadenz(3);
  }
  if ( GG < 3 ) { GG = 3 ;};
  
  int xa = int( random( 6)) + 1;
  int ya = int( random( 6)) + 1;
  
  for( int i = 1; i <= xa; i++)
  {
    for(int j = 1; j <= ya; j++)
   { 
      int Zu = int(random( 5)+1);
      o[Zu].Zeichne( 500/xa*(i-1), 360/ya*(j-1), 500/xa, 360/ya);
   }
  } 
}
