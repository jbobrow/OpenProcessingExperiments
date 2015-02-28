
size(200,200);
int x;
int y;
int kankaku;

background(255,255,255); // 背景は白

kankaku=5;
for(y=0; y<=200; y=y+kankaku) {
 stroke(int(random(255)),int(random(255)),int(random(255)));
 line(0,y, 200,y);
}
for(x=0; x<=200; x=x+kankaku) {
 stroke(int(random(255)),int(random(255)),int(random(255)));
 line(x,0, x,200);
}


size(200, 200);
smooth();
fill(255,255,255);
ellipse(80, 60, 80, 80);
ellipse(80,60,40,40);
line(55, 100, 120, 180);
line(40, 115, 90, 180);
line(120,180,90,180);
line(20,20,20,180);
line(20,180,40,180);
line(40,115,40,180);
line(20,20,80,20);
line(55,100,80,100);
line(40,40,40,80);
line(40,40,80,40);
line(40,80,80,80);
fill(255,255,255);
noStroke();
rect(21,21,19,159);
rect(40,21,39,19);
rect(40,81,40,19);
strokeWeight(20);
stroke(255);
line(40,99,109,185);
strokeWeight(1);
stroke(0,0,0);
line(120,180,90,180);
noStroke();
fill(201,201,201);
//rect(91,181,50,60);
fill(0);
text("By Ryuki Maruyama",90,195);
save("sougou2-R.jpg");

