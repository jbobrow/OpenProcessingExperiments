
void setup(){
size (600,600);
noLoop();

}
void draw() {
  background (0); stroke(0);
  color r=color(255,0,0,200); color b = color(5,5,255,200);color b1 = color(5,5,255,100); color bl = color(0,0,0,100);color bl1 = color(255,255,255,255);
  color bl2 = color(0,0,0,200);
 
 stroke(b); line(0,600,600,0); line(0,0,600,600); 
 fill(bl2); triangle(300,300, 0,600, 600,600); triangle(300,300, 150,150, 150,450); triangle(300,300, 150,150, 150,450);
 
 fill(r); rect(150,200,300,200, 10); fill(bl); triangle(300,300, 450,150, 450,450); triangle(300,300, 450,150, 450,450); stroke(bl1); line(250,300,150,150);line (250,300,150,450);
 fill(b1);triangle(250,300, 150,150, 150,450); stroke(bl1); line(0,0,300,300); line(300,300,0,600); 
 fill(bl1);quad(150,150,150,450,0,0,0,600); fill(b1);arc(300,450, 300, 300, 0, PI/1); fill(b1);quad(0,0,600,0,400,200,200,200); fill(bl1); triangle(300,0,400,200,200,200);
 fill(bl2); triangle(599,599,450,300,599,300);fill(r); quad(450,230,450,150,150,450,600,0);
 fill(b1); arc(450,225,450,450,0, HALF_PI); stroke(bl1); line(450,225,599,225);
 
 
}



