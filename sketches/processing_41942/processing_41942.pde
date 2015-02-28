
int a, b, c, d;
int veloA, veloB, veloC, veloD;
int back, back2, back3;
int dia;

void setup (){
  size (520, 520);
  smooth ();
  a = 40;
  b = 40;
  c = 440;
  d = 440;
  veloA = 2;
  veloB = 3;
  veloC = -4;
  veloD = -5;
  back = 100;
  back2 = 100;
  back3 = 100;
  dia = 20;
}
void draw () {
 background (50);
 for (int x = 0; x <= width; x += dia){
   for (int y = 0; y <= height; y += dia){
     fill (back, back2, back3);
     noStroke();
     ellipse (x, y, dia, dia);
   }
  }
  fill (0); ellipse (a, b, 80, 80);
  fill (255); ellipse (c, d, 120, 120);
  
  a+=veloA;
  b+=veloB;
  c+=veloC;
  d+=veloD;
  
  if ( a > width - 40 || a < 40) {
   veloA *= -1; 
   back = int(random (255)); back2 = int(random (255)); back3 = int(random (255));
  }
  if ( b > height - 40 || b < 40) {
   veloB *= -1; 
   back = int(random (255)); back2 = int(random (255)); back3 = int(random (255));
  }
  if ( c > width - 60 || c < 60) {
   veloC *= -1; 
   dia = 40; 
  }
  if ( d > height - 60 || d < 60) {
   veloD *= -1; 
   dia = 20; 
  }
}

