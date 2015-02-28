
//円を全面に敷き詰める(auto14)
size(200,200);
fill(255,0,0);
noStroke();
smooth();

int x;
int y;
int kankaku;

kankaku=10;
for(x=5; x<=200; x=x+kankaku) {
  for(y=5; y<=200; y=y+kankaku) {
    ellipse(x,y,kankaku,kankaku);
  }
}

size(200,200); 
fill(255,255,255);
rect(50,20,85,20);//1
rect(50,20,20,160);//2
rect(50,88,85,20);//3
rect(50,160,85,20);//4

fill(255,255,255);
text("By Suzuki Reiji",110,198);
save("sougou2-E.jpg");

