

//線の色を変える
size(200,200);
int x;
int y;
int kankaku;

background(0,0,0); 
stroke(40,240,40); // 緑線

kankaku=5;
for(y=0; y<=200; y=y+kankaku) {
 line(0,y, 200,y);
}
for(x=0; x<=200; x=x+kankaku) {
 line(x,0, x,200);
}


int a;
int b;
int kankaku2;


kankaku2=5;
for(a=0; a<=200; a=a+kankaku2) {
  for(b=0; b<=200; b=b+kankaku) {
    fill(int(random(80)),int(random(80)),int(random(80)));
    rect(a,b,kankaku2,kankaku2);
  }
}

stroke(0,0,0);


fill(252,252,252);

rect(40,20, 120,20);
rect(40,90, 100,20);
rect(40,160, 120,20);
rect(40,20, 20,160);

noStroke();

fill(252,252,4);
ellipse(145,85,10,10);
fill(4,252,252);
ellipse(165,15,10,10);
fill(252,4,252);
ellipse(165,155,10,10);
fill(4,4,4);
ellipse(35,15,10,10);
fill(4,252,4);
ellipse(35,185,10,10);


rect(100,185,60,200);

fill(252,0,0);
text("@RioClare",100,195);
save("sougou2-E.jpg");

