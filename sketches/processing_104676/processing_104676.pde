
//円の色をランダムに(auto15)
size(200,200);
fill(255,0,0);
noStroke();
smooth();

background(255,255,255);

int x;
int y;
int kankaku;

kankaku=2;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    fill(random(7),random(215),random(255));
    ellipse(x,y,kankaku,kankaku);
  }
}
size(200,200);
fill(255,255,255);
stroke(0,0,0);
triangle(50,20,50,60,100,115);
triangle(50,20,100,75,100,115);
triangle(150,20,100,75,100,115);
triangle(150,20,150,60,100,115);
rect(20,20,30,170);
rect(150,20,30,170);
fill(255,218,3);//
text("By sakura",70,195);
save("sougou2-M.jpg");

