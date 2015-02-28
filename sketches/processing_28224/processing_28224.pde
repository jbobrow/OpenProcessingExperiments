
void setup () {
   size (500, 500);
   
  smooth();
}



void draw() {
  background (0);
  randomSeed (mouseX);
  
  // randomSeed(0); bedeutet der zufällige random wert ist immer der selbe
  
  //die schleifen wie folgt: (i ist bloß eine beliebige variable) for heißt "so lange"
  //heißt variable i ist 0 und soll solange sie kleienr ist als 100 zeichnet sie sich immer wieder
  
  // NUMMER 1   int count = 100;
  
   //NUMMER 1   for(int i = 0; i < count; i++ ) {
     
        // man könnte auch statt i++ schreiben: i=i+1
    // oder: int count = 30;
    //for(int i = 0; i < count; i++) {
    //ellipse(200,height/count*i,10,10); hierbei ist count "das ganze" an das es angepasst wird
    
      
    
    //ellipse (200+random(-100,100),i*20,50,50); //ein beispiel mit random wäre das sie sich pro auftauchen zufällig verschieben
    
   // NUMMER 1 ellipse (200,height/count*i,height/count,height/count); } }


int count = 20;

 for(int j = 0; j <count+1; j++ ) { //hier: count+1 um den gesammt bildbereich nach rechts und links zu füllen
 
 for(int i = 0; i <count+1; i++ ) {

   stroke (random (100));
   fill (random (200));
   rect (width/count*j,height/count*i,random (10),random (90));
  // rect (mouseX, mouseY, mouseX, random (90));
 }
 }
 
}

