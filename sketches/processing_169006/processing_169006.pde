
size(400,400);

noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}




noStroke();
colorMode(RGB, 130);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}



stroke(0,0,0);
fill(40,40,255,10);
arc(200,220,310,310,0,HALF_PI);
arc(200,220,320,320,HALF_PI, PI);
arc(200,220,330,330,PI, PI+QUARTER_PI);
arc(190,220,340,340,PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(40,255,255,20);
arc(200,220,240,240,0,HALF_PI);
arc(200,220,250,250,HALF_PI, PI);
arc(200,220,260,260,PI, PI+QUARTER_PI);
arc(190,220,270,270,PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(40,40,255,10);
arc(200,220,140,140,0,HALF_PI);
arc(200,220,150,150,HALF_PI, PI);
arc(200,220,160,160,PI, PI+QUARTER_PI);
arc(190,220,170,170,PI+QUARTER_PI, TWO_PI);









