
void setup () {
size (600,600);
smooth();
background (66,99,22);
}

void draw () {
int x = mouseX;
if (x > width/2) {
  fill (255, 255, 255);
  ellipse (230, 100, 60, 60);
  ellipse (370, 125, 60, 60);
}
if (x < width/2) {
  fill (255, 255, 0);
ellipse (230, 100, 60, 60);
ellipse (370, 125, 60, 60);
}

//lines for eyes
line (300, 280, 300, 200);
line (300, 200, 380, 150);
line (260, 287, 260, 200);
line (260, 200, 230, 100);

//eyes 
ellipse (230, 100, 60, 60);
ellipse (370, 125, 60, 60);
fill (0, 0, 0);
ellipse (230, 100, 40, 40);
ellipse (370, 125, 20, 20);
 
//legs 
line (280, 450, 280, 520);
line (300, 450, 300, 520);

//tummy 
fill (33, 77, 99);
ellipse (300,380,200,200);
 
fill (00, 00, 44);
ellipse (300,380, 150, 150);
 
fill (33,99,77);
ellipse (300, 380, 10, 10);

//shoes
fill (0, 0, 0);
triangle (280, 520, 280, 540, 250, 540);
triangle (300, 520, 300, 540, 330, 540);

}


