
size(200,200);
background(0,0,0);
int x;
int y;
int kankaku=3;

for(x=0;x<=200;x=x+kankaku){
  for(y=0;y<=200;y=y+kankaku){
    fill(int (random(255)),
        int (random(255)),
        int (random(255)));
       rect(x,y,kankaku,kankaku);
  } 
}
kankaku=3;
for(x=0;x<=200;x=x+kankaku){
  stroke(int(random(255)),int(random(255)),int(random(255)));
  line(x,200,x,0);
}
for(y=0;y<=200;y=y+kankaku){
  stroke(int(random(255)),int(random(255)),int(random(255)));
  line(200,y,0,y);
}

stroke(0,0,0);
fill(255,255,255);
size(200,200);
rect(30,30, 30, 140);
triangle(60,30, 60,60, 140,140);
triangle(60,60, 140,140, 140,170);
rect(140,30, 30, 140);


text("                       By Mizuki Watanabe",10,190);
save("sougou2-N.jpg");

