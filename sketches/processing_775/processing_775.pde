
// import processing.serial.*;

/*  Das Prinzip : Eine grosse Stange dreht sich um ihre Mitte (Nabe, Drehpunkt);
 also wie eine Wippe, die sich ganz um sich selbst drehen kann; um ihr eines 
 Ende (als Nabe) dreht sich eine zweite Stange; ihr Drehpunkt ist jedoch nicht 
 ihre Mitte, sondern ihr Drehpunkt teilt sie KleinLangTeiler (alte Version: 
 bei 2/3 zu 1/3).        */


/*  Zu den Namen siehe "InitProc" :       */
int GrossMitteX, GrossMitteY           ;  /*  Thema 1 Wo ist der Drehpunkt der grossen Stange ?           */
int GrossMitteAddX, GrossMitteAddY     ;

int GrossLang, KleinLang                ;  /*  Thema 2 Wie lang sind beide Stangen jeweils?                */
int GrossLangAdd, KleinLangAdd          ;

int KleinLangTeiler;                       /* Thema 2a: An welcher Stelle wird KleinLang geteilt?   */

int KleinLangTeilerAdd; 

int GrossDir, KleinDir                  ;  /*  Thema 3 In welche Richtung weisen beide Stangen jeweils?    */
int GrossDirAdd, KleinDirAdd            ;

int getMittex, getMittey                ;  /*  Thema 4 Wo ist die Mitte des Bildschirms            */

// int quitwish                            ;  /*  Thema 5 Möchte Anwender verlassen ja oder nein ?    */

boolean boolBildAutomatischNeuAufbauen = true;    /*  Thema 6 Bildaufbau  ?    */
int ArtDesBeziers;                                // Form des Beziers / der  Ausgabe

int TurtleX;                                      /*  Thema 7 Turteldaten    */
int TurtleY;
int dir;    // Direction 

color GlobalColor;           // Turtlefarbe
boolean StiftHoch =  true;   // bestimmt, ob die Turtle malt oder sich bewegt, ohne zu malen                    

float Pi_durch_180;                                 /*  Thema 8 Konstante  */

/* =====================     TOOLS            ================================ */

void setup() 
{
  size(600 , 600 );
  background(110);
  // Konstante setzen 
  Pi_durch_180 = PI / 180;
  smooth();
  InitProc();
}

void InitProc (){ 

  TurtleX = width / 2; 
  TurtleY = height / 2; 
  dir = 0 ;   // Richtung 

  // Farbe setzen 
  GlobalColor = color( 0, 255, 0 );  
  color (GlobalColor);    
  stroke (GlobalColor);    

  getMittex   = width / 2;
  getMittey   = height / 2;
  GrossMitteX        = getMittex;       /*  Wo ist Nabe der grossen Stange ? X    */
  GrossMitteY        = getMittey;       /*     Y                                  */
  GrossMitteAddX     = int ( random ( 7 ));     /*  Wohin wandert sie ?  X  ("wandern" per Addendum zur Position)   */
  GrossMitteAddY     = int ( random ( 8  ));    /*                       Y                    */

  GrossDir      = int(random(360));               /*  Wo schaut die grosse Achse hin ? "Dir" für Directory = Richtung   */
  KleinDir      = int(random(360));               /*  Wo schaut die kleine Achse hin ?    */
  GrossDirAdd   = int(random(-16,16));            /*  In welche Richtung und wie schnell verändert sich der Winkel der grossen Achse  */
  KleinDirAdd   = int(random(-16,16));            /*  ....und der kleinen Achse            */

  GrossLang     = int(random(460));             /*  Wie lang ist grosse Nabe ?          */
  KleinLang     = int(random(460));
  ;            /*  Wie lang ist kleine Nabe ?          */
  KleinLangTeiler = 2; 

  GrossLangAdd  = 1;               /*  Wie verändern sich die Längen ?     */
  KleinLangAdd  = -1;

  ArtDesBeziers = int ( random ( 0, 12 ) ) ;   // Form der Ausgabe / des Beziers 

} 

boolean Zufall1(int grenze){
  /*  Zufallsentscheidung; "Grenze" gibt die Wahrscheinlichkeit
   an, je höher desto unwahrscheinlicher, 5000 ist jedes zweite Mal;
   10 000 ist konstant                     */

  boolean Zufall1a;

  if (random ( 10000 ) > grenze)
  { 
    Zufall1a  = true; 
  }
  else 
  {
    Zufall1a  = false; 
  }
  return Zufall1a; 
} 

void huepfzu ( int a,  int b   ) 
{
  TurtleX = a;
  TurtleY = b;
}

void vw(int Strecke){

  // vorwärts gehen 

  int xNeu;
  int yNeu;
  float WinkelBogenmass;

  // umrechnen 
  WinkelBogenmass = dir * Pi_durch_180;

  // neue Position errechnen 
  xNeu = int( TurtleX + (Strecke * cos(WinkelBogenmass)));
  yNeu = int( TurtleY + (Strecke * sin(WinkelBogenmass)));

  // Wenn der Stift nicht oben ist
  if (!StiftHoch)
  {   
    // dann malen: 
    stroke (GlobalColor);
    // strokeWeight(2); 
    line ( TurtleX, TurtleY, xNeu, yNeu );
  }

  // neue Position setzen 
  TurtleX = xNeu;
  TurtleY = yNeu;

}

void Ausgabe1 (){ 

  int x1,y1,x2,y2,x3,y3,x4,y4  ;  
  int Zufall; 

  // Turtle positionieren
  huepfzu ( GrossMitteX, GrossMitteY );

  // Farbe setzen 
  GlobalColor = color(255, 0, 0 );  
  color (GlobalColor);  

  // Richtung setzen 1
  dir  = GrossDir;

  // Große Achse: erstes Ende
  vw ( GrossLang / 2 ); 
  // Position speichern 1
  x1 = TurtleX;
  y1 = TurtleY;

  // Große Achse: zweites Ende     
  vw ( -GrossLang );
  // Position speichern 2 
  x2 = TurtleX ;  
  y2 = TurtleY ;

  // Farbe setzen  
  GlobalColor = color(0 , 255, 0);  
  color (GlobalColor);

  // Richtung setzen 2
  dir  = KleinDir;

  // Kleine Achse: erstes Ende
  vw ( KleinLang / KleinLangTeiler ); 
  // Position speichern 3
  x3 = TurtleX; 
  y3 = TurtleY; 

  // Kleine Achse: zweites Ende     
  vw ( -KleinLang );
  // Position speichern 4
  x4 = TurtleX;
  y4 = TurtleY; 

  noFill();
  smooth(); 

  // Welche Form des Beziers oder des Outputs? 
  switch( ArtDesBeziers ) {
  case 0: 
    // Bezier 1
    bezier ( x1,y1, x2,y2, x3,y3, x4,y4);
    break;
  case 1:      
    // Bezier 2
    bezier ( x1, y1, x4,y4, x3,y3, x2,y2);
    break;
  case 2:
    // zwei Beziers zusammen:
    // GlobalColor = color(0 , 255, 0);  
    // stroke (GlobalColor);
    bezier ( x1,y1, x2,y2, x3,y3, x4,y4);
    // GlobalColor = color(255, 0, 0 );  
    // stroke (GlobalColor); 
    bezier ( x1,y1, width-x2,y2, x3,y3, x4,y4);
    break;        
  case 3:   
    bezier ( x1, y1, x2,y2, x3,y3 , x1, y1);
    break;        
  case 4:            
    bezier ( x1, y1, x2,y2, x4,y4 , x3, y3);     // sehr gut 
    break;        
  case 5:   
    bezier ( x1, y1, x2,y2, x1,y1 , x3, y3);     // sehr gut 
    break;        
  case 6:
    bezier ( x1, y1, x2,y2, x3,y3 , x1, y1);
    break;        
  case 7:
    // zwei Linien zusammen 1 (die beiden Achsen):
    GlobalColor = color(0 , 255, 0);  
    stroke (GlobalColor);
    line ( x1,y1, x2,y2 );
    GlobalColor = color(255, 0, 0 );  
    stroke (GlobalColor); 
    line ( x3,y3, x4,y4 );           
    break;               
  case 8:
    // zwei Linien zusammen 2 (die beiden Achsen "gemischt"):
    GlobalColor = color(0 , 255, 0);  
    stroke (GlobalColor);
    line ( x1,y1, x3,y3 );
    GlobalColor = color(255, 0, 0 );  
    stroke (GlobalColor); 
    line ( x2,y2, x4,y4 );      
    break;                          
  case 9:
    // Quadrat:
    quad ( x1,y1, x4,y4, x2,y2, x3,y3 );
    break;                         
    /*case 10:           
     ellipse ( x1,y1, x3-y3, x4-y4 );    
     break;      
     case 11:           
     ellipse ( (x1 + x3) / 2 , (y1 + y3 ) / 2 , ( x3+y3) / 3, (x4+y4) / 3 );    
     break;                 */
  default:
    // sonst: wie Nr. 4
    bezier ( x1, y1, x2,y2, x4,y4 , x3, y3);     
    break;
  }  // Ende switch 

} 

/* -------------------------    Checks    ----------------------------------- */

void CheckGrossMitteXundCo(){

  int Abst = 280;

  /*  Ränder  */  /*  wenn Wert zu gross, dann in Zukunft negativer Wert (=Subtraktion) Wert wird kleiner  */
  if ( GrossMitteX >= width/ 2 + Abst ) { 
    GrossMitteAddX = - abs(GrossMitteAddX); 
  }  /*  Wert zu gross   */
  if ( GrossMitteY <= height/ 2 - Abst ) { 
    GrossMitteAddY =  abs(GrossMitteAddY);
  }   /*  zu klein  */
  if ( GrossMitteX <= width/2  - Abst ) { 
    GrossMitteAddX =  abs(GrossMitteAddX);
  }    /*  zu klein  */
  if ( GrossMitteY >= height/ 2 + Abst ) { 
    GrossMitteAddY = - abs(GrossMitteAddY);
  }  /*  zu gross  */

  GrossMitteX += GrossMitteAddX ;
  GrossMitteY += GrossMitteAddY ;
} 

void CheckKleinDirUndCo(){ 
  if ( Zufall1 ( 9900 ) ) { 
    KleinDirAdd  = int(random (14));
    KleinDirAdd -= 7 ;
  } 
  if ( Zufall1 ( 9900 ) ) { 
    GrossDirAdd  = int ( random ( 8 ));
    GrossDirAdd -= 4 ;
  } 
  if ( KleinDirAdd == 0) 
  { 
    KleinDirAdd  = 2 ;
  }
  if ( GrossDirAdd == 0) 
  { 
    GrossDirAdd  = 1 ;
  }

  KleinDir += KleinDirAdd ;
  GrossDir += GrossDirAdd ;
} 

void CheckLangUndCo(){ 

  GrossLang += GrossLangAdd ;
  KleinLang += KleinLangAdd ;

  if ( GrossLang > 330) { 
    GrossLangAdd  =  - abs ( GrossLangAdd ); 
  }  
  if ( GrossLang < 23 ) { 
    GrossLangAdd  =    abs ( GrossLangAdd ); 
  }  

  if ( KleinLang > 330 ){ 
    KleinLangAdd  =  - abs ( KleinLangAdd ); 
  }  
  if ( KleinLang < 23  ){ 
    KleinLangAdd  =    abs ( KleinLangAdd ); 
  }  

  // zu KleinLangTeiler : 
  if (Zufall1(800)) { 
    KleinLangTeilerAdd = KleinLangTeilerAdd * -1; 
  } 
  KleinLangTeiler += KleinLangTeilerAdd ; 
  if ( KleinLangTeiler > 6 ){ 
    KleinLangTeiler  =  6  ; 
    KleinLangTeilerAdd=-1;  
  }  
  if ( KleinLangTeiler < -5  ){ 
    KleinLangTeiler  =  -5; 
    KleinLangTeilerAdd=1; 
  }   

} 

void CheckBildLoeschen () 
{
  if (Zufall1 (9900) )
  {     
    // clear ohne InitProc
    fill (110);
    noStroke(); 
    rect (0,0,width, height);  
    stroke(GlobalColor);
  } 
}

void CheckBildInit () 
{
  if (Zufall1 (9900) )
  {     
    // clear mit InitProc
    fill (110); 
    noStroke();
    rect (0,0,width, height);  
    InitProc();
    stroke(GlobalColor);
  } 
}

void CheckBildNeuAufbauen () 
{
  if (Zufall1 (6100) )
  {     
    CheckBildInit(); 
  } 
  else
  {
    CheckBildLoeschen(); 
  }
}

/* --------------------------------------------------------------------------- */

void LiesKey (){

  // Tastatur lesen 

  switch(key) {
  case 'i': 
    // clear mit InitProc
    fill (110); 
    noStroke();
    rect (0,0,width, height); 
    InitProc();
    stroke(GlobalColor);
    break;
  case 'l': 
    // löschen  ohne InitProc
    fill (110); 
    noStroke();
    rect (0,0,width, height); 
    stroke(GlobalColor);
    break;
  case 's': 
    // Screenshot speichern 
    save("Test1.tif");
    break;    
  case 'p': 
    // pause
    delay (1113);
    int i=0;
    while (true) {
      if (keyPressed == true ) {
        break;
      }
      i = i+1 ; 
      i = i-1 ;
    }
    break;
  case 'q': 
    // quit (auch Escape)
    exit();
    break;
  case 'b': 
    // boolBildAutomatischNeuAufbauen steuern
    boolBildAutomatischNeuAufbauen = true; 
    break;  
  case 'n': 
    // boolBildAutomatischNeuAufbauen steuern
    boolBildAutomatischNeuAufbauen = false;
    break;        
  default:
    break;
  }  // Ende switch 

}

void draw()
{ 

  Ausgabe1();                  /*  Ausgabe                         */

  CheckKleinDirUndCo();        /*  Drehbewegungen                  */
  CheckGrossMitteXundCo();     /*  Wanderbewegungen                */
  CheckLangUndCo();            /*  Längen der beiden Stangen       */

  // Soll das Bild gelöscht werden? 
  if (boolBildAutomatischNeuAufbauen) {
    // Millisekunden einlesen
    float m = millis(); 
    // modulo (ausgedrückt als %-Zeichen)
    if (m%10000 > 6000)   
    {
      CheckBildNeuAufbauen();
      // CheckBildLoeschen();         /*  Ggf. Bild löschen               */
      // CheckBildInit();             /*  Ggf. Bild löschen und neu Init  */
    }
  }

  if ( keyPressed == true )  
  { 
    LiesKey();
  }   
  delay (13);  
}


