
size(200,200);
background(33,36,230);

int x;
int y;
int kankaku;
kankaku=10;
for(y=0; y<=200; y=y+kankaku) {
 stroke(int(random(255)),int(random(255)),int(random(255)));
 line(0,y, 200,y);
}
for(x=0; x<=200; x=x+kankaku) {
 stroke(int(random(255)),int(random(255)),int(random(255)));
 line(x,0, x,200);
}

kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    fill(random(255),random(255),random(255));
    ellipse(x,y,kankaku,152);
  }
}
stroke(0,0,0);
fill(255,255,255);
triangle(90,20,100,30,110,20);
triangle(90,20,85,30,100,30);
triangle(100,30,115,30,110,20);
triangle(85,30,115,30,100,45);
triangle(85,30,100,45,75,60);
triangle(115,30,100,45,125,60);
triangle(75,60,100,45,60,180);
triangle(100,45,125,60,140,180);
triangle(75,60,60,180,30,180);
triangle(125,60,140,180,170,180);
triangle(85,100,115,100,100,125);
triangle(85,100,75,125,100,125);
triangle(115,100,100,125,125,125);

fill(255,255,255);
text("               By Tomoaki Okuma",10,190);
save("sougou2-A.jpg");






