
//正方形を敷き詰めてランダムな色に(pro22)
fill(255,0,0);
noStroke();
smooth();

background(0,0,0);

int x;
int y;
int kankaku;

kankaku=10;
for(x=0; x<=99; x=x+kankaku) {
  for(y=0; y<=99; y=y+kankaku) {
    fill(random(255),random(255),random(255));
    rect(x,y,kankaku,kankaku);
  }
}
