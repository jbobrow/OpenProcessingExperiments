
// Emanuele Reis - Exercício Reforço 2

void setup (){
size (200,200);
background (#FFDC0F);
strokeWeight (2);
 line (20,10,80,10);
}

void draw (){
  for (int x=10; x<100; x=x+x) {
  stroke (0);
    if (x>30){
      stroke(255);
    }
    line(20, x*2, 80, x+5);
  }
}
