
size(200,200);
background(0);
noStroke();
colorMode(RGB, 200);
for (int i = 100; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i, j, 0);
    point(i, j);
  }
}
fill(237,163,50);
strokeWeight(2);
arc(72,57,20,20,0,TWO_PI);
fill(82,55,13);
quad(60,60,70,70,40,110,30,100);
line(40,110,60,130);
line(60,130,40,150);
line(40,150,60,150);
line(30,100,60,100);
line(60,100,80,120);
line(80,120,90,100);
line(60,60,40,50);
line(40,50,20,50);
line(70,70,70,90);
line(70,90,100,90);
fill(0,0,0);
stroke(0);
arc(120,130,20,20,0,TWO_PI);
quad(115,115,135,125,160,90,150,80);
line(135,125,150,130);
line(150,130,140,150);
line(130,125,140,140);
line(140,140,110,150);
line(150,80,150,50);
line(150,50,120,30);
line(120,30,130,20);
line(160,90,175,60);
line(175,60,150,30);
line(150,30,170,20);


