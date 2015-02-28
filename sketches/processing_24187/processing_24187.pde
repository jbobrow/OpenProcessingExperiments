
void setup () {
  size(300, 300);
}

void draw() {
 
if (mousePressed==false) {
  background(234, 221, 109);
} else {
  background(109, 159, 234);
}

 
int x=mouseX;
int y=mouseY;

// bg
line(0, 270, 300, 270);
 
// head and eyes
fill(82, 192, 28);
smooth();
ellipse(x-50, y-50, 75, 175);
fill(0, 0, 0);

if (mousePressed==false) {
  ellipse(x-60, y-10, 10, 10);
  ellipse(x-20, y-10, 10, 10);
} else {
  //black
  ellipse(x-60, y-10, 25, 25);
  ellipse(x-20, y-10, 25, 25);
  //white left
  fill(255);
  ellipse(x-57, y-8, 14, 14);
  ellipse(x-61, y-15, 5, 5);
  //white right
  ellipse(x-17, y-8, 14, 14);
  ellipse(x-21, y-15, 5, 5);
} 
 
// mouth
fill(224, 243, 14);
ellipse(x-40, y+10, 50, 18);
fill(0);
if (mousePressed==true) {
   ellipse(x-40, y+10, 30, 2);
}

// body
fill(82, 192, 28);
ellipse(x-50, y+63, 50, 50);
 
// shoes
fill(0, 0, 0);
ellipse(x-70, y+90, 40, 15);
ellipse(x-30, y+90, 40, 15);
}


