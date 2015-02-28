
//Intro to Creative Programming
//Assignment2
//Sang Un Jeon


void setup() {
  size(800,800);
  smooth();
  noStroke();
}

void draw() {
for (int t = 0; t < 800; t+=80){
   fill(#D5E6DA,50);
  for (int i = 0; i < 800; i+=100) {
   triangle(50+i,0+t,100+i,80+t,0+i,80+t);
  }
  fill(#FFFFFF,50);
 for (int i = -100; i < 800; i+=100) {
   triangle(50+i,0+t,150+i,0+t,100+i,80+t);
  } 
 } 
 
int x = 0;
int y = 0;
int w = 800;
int h = 80;


for (int p = 0; p < 800; p+=80) {
 if ((mouseX > x) && (mouseX < x+w) && (mouseY > y+p) && (mouseY < y+h+p)) {
  fill(#FF8B00,50);

  for (int i = 0; i < 800; i+=100) {
   triangle(50+i,0+p,100+i,80+p,0+i,80+p);
   }
 }

}

 
}
