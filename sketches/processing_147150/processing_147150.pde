
void setup() {
  size(600, 600);
  //background(255,255,255);
  println("program start");
  ellipseMode(CORNER);
  rectMode(CENTER);
  //random(value) range 
  println(random(255));
   noCursor();
}


/*void draw() {
 
 // for (int i = 10; i < 100; i = i+10) {
 //    ellipse(10, i, 5, 5);
 // }
 //}
 
 //integer name = value 
 int a = 0; //2, 10000 , -60000
 
 //float name = value 
 float f = 2; //2.523123, -2.5
 
 // boolean name = true/ flase
 boolean debug = false;
 
 //startin name = "my text"
 start txt = "creative coding";
 */

void draw() {

  background(200);

  /* 
   //operation
   println(a / f);
   
   
   for (int i = 0; i < 10; i = i+1) {
   ellipse(20+(i*40), 10, 5, 5);
   */
  // For is a Loop
  //For(declare, condetion, increment)
  /*int space = 10;
   
   for(int x = 0 ; x <= mouseX ; x = x + space ){
   line( x, 0, x, height);
   }
   for(int y = 0 ; y <= mouseY ; y = y + space){
   line( 0, y , width, y);
   }
   }
   */

  int space = 40;

  for (int x = 20 ; x <= mouseX ; x = x + space  ) {
    for (int y = 20 ; y <= mouseY ; y = y + space ) {
      ellipse( x, y, 40, 40);
      fill(random(255),230,210);
      rect( x, y, 20, 20);
      noFill();
    }
  }
}

