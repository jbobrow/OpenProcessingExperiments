
/**
 *    SVGs laden mit PShape
 *
 *    http://processing.org/reference/loadShape_.html
 *    http://processing.org/reference/shape_.html
 *
 *    http://en.wikipedia.org/wiki/Scalable_Vector_Graphics
 *
 *    fjenett 20081101
 */
PShape al;
PShape ar;

void setup() {
    size(800,600);
    background(255); 
    smooth();
    frameRate(10);
    al = loadShape( "al.svg" );
    ar = loadShape( "ar.svg" );
   
}

void draw() {
  int posy = int(random(80,120)); // position y als random zwischen 80 und 120 für arme
  int posf = int(random(190,210)); // position y als random für gesicht zwischen ....

     for (int i = 0; i< 20;i++) { // 20 mal hoch und runter bewegen, als random unendlich
       background(255); // dass die arme immer nur ein mal zu sehen sind
       shape(ar, 20, posy); // arm links zeichnen mit y random werten
       shape(al, 250, posy); // das gleich mit arm rechts
       
     }

}
    



