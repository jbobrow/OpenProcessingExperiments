
//linea aleatoria 
int a=height/2;
float b= height / 2 ;
int rojo=0;
int azul=0;
int verde=0;
int tama=30;

void setup () {
  size (600, 300);
  background (0);
  smooth ();
}


void draw () {
  stroke(random(255),random(a),random(b),random(255));//
  strokeWeight (random(5));
  line (mouseX, mouseY, a, b);
  line (a, b, mouseX, mouseY);
  if (mousePressed == true ) {
    a = mouseX; 
    b = mouseY;
  }
  else if (a==mouseX && b==mouseY) {
    ++b;}
   else {++a;}
    
  noStroke ();
  fill (random (20), random(20));
  ellipse (mouseX, mouseY, tama, a );
  
  
  
  }

