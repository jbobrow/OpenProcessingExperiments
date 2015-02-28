
//文字を入れる(auto22)

size(200,200);
int x;
int y;
int kankaku;

background(0,0,0); // 背景は白

kankaku=5;
for(y=0; y<=200; y=y+kankaku) {
// stroke(int(random(255)),int(random(255)),int(random(255)));
 line(0,y, 200,y);
}
for(x=0; x<=200; x=x+kankaku) {
 stroke(int(random(255)),int(random(255)),int(random(255)));
 line(x,0, x,200);
}

stroke(7,62,59);
triangle(15,35,35,15,85,100);
triangle(100,75,85,100,115,100);
triangle(115,100,85,100,100,75);
triangle(35,15,85,100,100,75);
triangle(100,75,115,100,165,15);
triangle(165,15,185,35,115,100);
rect(85,100,30,100);
fill(250,250,250);
text("By Nao",150,180);
save("sougou2-Y.jpg");



