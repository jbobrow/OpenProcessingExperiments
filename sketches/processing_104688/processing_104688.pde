
size(200,200);
background(10,5,20);
int x;
int y;
int kankaku;

kankaku=5;
for(x=0; x<=200; x=x+kankaku) {
  for(y=0; y<=175; y=y+kankaku) {
    fill(int(random(255)),int(random(255)),int(random(255)));
    rect(x,y,kankaku,kankaku);
  }
}
fill(254,2,20);
stroke(143,252,213);
rect(80,90,40,20);
triangle(50,50,80,50,50,70);
triangle(50,70,80,50,80,80);
triangle(50,70,80,80,50,100);
triangle(50,100,80,80,80,150);
triangle(50,100,80,150,50,150);
triangle(120,50,150,50,150,70);
triangle(120,80,120,50,150,70);
triangle(120,80,150,100,120,150);
triangle(120,80,150,70,150,100);
triangle(120,150,150,100,150,150);
fill(143,252,213);
text("by Ten  Matsuzato",70,190); 
save("sougou2-H.jpg");

