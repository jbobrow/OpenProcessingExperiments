
/*

 if
 else
 for
 while
 
*/

int x;                                //integer x initialisieren

void setup() {
  size(400, 400);
  strokeWeight(3);
  x = 0;                              //x den wert 0 zuweisen
}

void draw() {
  background(240);
  
  /* if abfrage (bedinnungen > >= < <= || &&) */
  
  if (x > 400) {                      //wenn x größer als 400 ist dann...
    x = 0;                            //setze x wieder auf 0
  }
  
  /* else bezieht sich auf die vorheriege if abfrage */
  
  else {                              //wenn x kleiner ist dann...
    x++;                              //erhöhe x um 1 wenn die draw schleife am ende ist
  }
  point(x, 100);                      //der punkt wandert da zu x immer um 1 addiert wird
  
  /* for schleife (variable; bedinnungen > >= < <= || && ; variable verändern) */
  
  for(int i = 0; i < 400; i = i + 5){ //i ist null; i muss kleiner als 400 sein; i wird immer um 5 erhöht 
    point(i,200);                     //alle 5 pixel wird ein punkt erzeugt
  }
  
  /* while schleife (bedinnungen > >= < <= || &&) */

  int a;                              //in jedem durchlauf der draw schleife a initialisieren
  a = 0;                              //und a auf 0 setzen
  while(a < 400) {                    //solange a kleiner als 400 ist...
    point(a, 300);                    //erzeuge in einem abstand von a pixel einen punkt
    a = a + 5;                        //a wird um 5 erhöht
  }
}


