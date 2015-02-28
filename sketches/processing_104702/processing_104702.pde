
//文字を入れる(auto22)

size(200,200);
fill(255,0,0);
noStroke();
smooth();

int x;
int y;
int r,g,b,d;
int kankaku;
int yuragi;

background(0,0,0);
kankaku=10;
kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    r=int(random(255));
    g=int(random(255));
    b=int(random(255));
    d=int(random(20));
    fill(r,g,b);
    ellipse(x,y,d,d);
  }
}

fill(255,255,255);
save("sample.jpg");



