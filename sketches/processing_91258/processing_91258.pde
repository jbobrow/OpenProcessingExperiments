





float x = 0.0;
float y = 0.0;
float angle = 0;
float speed = 0;

void setup() {    
  
  size (440, 440);
                          smooth();
randomSeed(90);
noCursor();

}

void draw(){
  
  background( 180);
  noFill();
  float x = mouseX;
  float y = mouseY;
  angle += random(-0.001, -0.001);
  x += cos(angle) * speed;
  y += sin(angle) * speed;
  translate(x, y);
  rotate(angle);
  stroke(16, 67, 175, 100);
  strokeWeight( random( 400 ) );

ellipse(30, 48, 36, 36);
ellipse(30, 48, 36, 36);

stroke (255);
  strokeWeight( random( 400 ) );
ellipse(30, 48, 26, 26);

ellipse(30, 48, 26, 26);
}





/* "La geometría está seca, vieja.
__________Vi surgir una línea de otro modo. 
_________________Una línea que surge mata las teorías, 
_________________________y no hay otra necesidad más que la 
_____________________________________aventura en la vida de las líneas."
Tristan Tzara
*/

