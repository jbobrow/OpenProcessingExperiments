


//feld mit objekten:smilies
//hintergrund verändert farbe beim klicken
//smilies verändern farbe mit mausbewegung
//array & maus & int & ingewikkelt objekt


int [] waardenX = new int[30]; 
int [] waardenY = new int[30]; 
 
int r; //farben
int g;
int b;

 
 
void setup() 
{ size (500,500); //hintergrund größe
  smooth(); 
   
  for(int i=0;i<30;i++) 
  { waardenX[i] = 100*int(random(0,5));  // damit die objekte nicht über das viereck hinaus gehen
    waardenY[i] = 100*int(random(0,5));  //damit die objekte nicht über das viereck hinausgehen
  } 
} 
 
 
void draw () 
{ background(r ,g,b); //farbenwechsel möglich, da alle farben da sind
  stroke(0); 
  strokeWeight(3); //dicke des striches
     
  for(int i=0;i<25;i++) 
  { tekenSmilie(waardenX[i], waardenY[i]); //object smilie
  } 
} 
 
 
void tekenSmilie(int x, int y) 
 {  
    //grundobjekt kreis
    fill(0,100,100); 
    ellipse (x+50,y+50,60,60); 
    
     
    //maus verändert durch bewegung farbe der kreise 
    fill(mouseX,100,mouseY); 
    ellipse (x+50,y+50,60,60); //körper
    ellipse (x+40,y+45,15,15); //linkes auge
    ellipse (x+60,y+45,15,15); //rechtes auge
    fill(0);
    line (x+40,y+65,x+60,y+60); //mund
    
 } 
  
 // hintergrundfarbe veränderung
 void mousePressed()  
 {   
  loop();  
  r = int (random (0,255));  
   g = int (random (0,255)); 
   b = int (random (0,255)); 
 
 }   


