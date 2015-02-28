
//円を全面に敷き詰める(auto14)
size(200,200);
noStroke();
smooth();

int x;
int y;
int kankaku;

background(0,0,0);
kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
fill(y,180,100);
    ellipse(x,y,kankaku,kankaku);
  }
}

stroke(150,50,0);
rect(150,50,20,30);
triangle(150,30,150,50,170,50);
rect(50,30,100,20);
triangle(30,50,50,30,50,50);
rect(30,50,20,100);
triangle(30,150,50,150,50,170);
rect(50,150,80,20);
rect(110,130,20,20);
rect(90,115,79,15);
rect(150,130,19,40);
fill(255,255,255);
text("By Akiha Yanagisawa",70,190);
save("sougou2-G.jpg");


