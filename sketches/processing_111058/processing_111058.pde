
size(600, 600);


strokeJoin(MITER);
strokeWeight(5);
strokeCap(SQUARE);
noFill();


int len = 20;

for (int x = -10; x<width+10; x+=len) {
  beginShape();
  for (int y=0; y<height+10; y=y+len) {

    vertex(x, y);
    vertex(x+len, y+=len);
  }
  endShape();
}

int yen = 20;
for (int y=0;y<height+10; y+=yen) {
  beginShape();
  for (int x=0; x<width+10; x=x+yen) {
    vertex (x, y); 
    vertex(x+=yen, y+yen);
  }
  endShape();
}



