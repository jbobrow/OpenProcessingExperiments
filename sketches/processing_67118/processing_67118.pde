
size(200,200);
fill(255,0,0);
noStroke();
smooth();

background(0,0,0);

int x;
int y;
int kankaku;

kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    fill(random(255),random(255),random(255));
    ellipse(x,y,kankaku,kankaku);
  }
}


fill(255,255,255);
rect(40,20,10,140);
rect(50,20,40,10);
triangle(85,20,100,30,85,30);
triangle(100,30,95,50,90,30);
triangle(90,75,100,30,100,75);
//triangle(50,20,95,50,50,40);

triangle(95,50,90,75,100,75);
rect(50,75,40,10);
triangle(60,85,95,125,50,100);
triangle(95,125,140,150,140,170);

fill(255,255,255);
text("By masato hosoda",70,190);
save("sougou2-R.jpg");



