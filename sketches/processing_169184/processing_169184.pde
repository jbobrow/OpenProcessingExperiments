
float x= 0;
float speedX = 1;
float y= 0;
float speedY = 2;

void setup () {
  size (500, 500, P3D);
}

void draw() {
  /*se non metti background (200); l'ellisse farà la coda, 
   cioè si vedranno i cosi dietro.
   */
   //background (200);
   
  ellipse (x, y, 20, 20);
  fill(255,5);
  rect (0, 0, width, height);
  x = x + speedX;
  y = y + speedY;

fill(0);
rect (mouseX, 0, width, height);
rect (0, mouseY, width, height);


  //bounce off right border
  if (x>mouseX-10) {
    speedX = -random(5);
  }

  //bounce off top border
  if (y < 10) {
    speedY = random(5);
  }

  //bounce off left border
  if (x<10) {
    speedX = random(3);
  }

  //bounce off down border
  if (y> mouseY - 10) {
    speedY = -random(5);
  }

  /*se definisci senza intl x= 0 non succederà niente all'elisse, 
   perchè devi definire la variabile di x, 
   cioè il significato di quella lettera
   */

  /* x=x+1; if (x >= width/2) {x=width/2;} questo può essere un modo 
   per stoppare l'ellisse al centro, ma quello più corretto è: */

  //puoi anche mettere x++ oppure x += 1
  /* quindi la indicazione x =x+1; 
   ti permette di muovere l'ellisse. 
   se aumenti il valore, la velocità aumenta.
   */
}



