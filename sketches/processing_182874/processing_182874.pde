
void setup() {
size (1000,1000);
}

void draw() {

fill (255) ;
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    rect (20*i, 20*j, 10, 10);
  }}
  
  ellipse (10,10,10,10) ;
  fill(#0DFF37);
ellipse(500, 500, 600, 600);
fill (#FF00EF);
ellipse (300,419, 300,30);
fill(#FA8508);
ellipse (620, 419, 80, 80);

stroke(10);
ellipse (300,300,50,50);
fill (255);
arc(450, 600, 300, 300, 0, PI / 2.0);
text(mouseX + ", " + mouseY, 30,30) ;
}

