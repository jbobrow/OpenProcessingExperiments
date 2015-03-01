
size(400,400);

noStroke();
colorMode(HSB, 100);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}



stroke(0,0,0);
fill(40,40,255);
arc(200,220,310,310,0,HALF_PI);
arc(200,220,320,320,HALF_PI, PI);
arc(200,220,330,330,PI, PI+QUARTER_PI);
arc(190,220,340,340,PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(40,255,255);
arc(200,220,240,240,0,HALF_PI);
arc(200,220,250,250,HALF_PI, PI);
arc(200,220,260,260,PI, PI+QUARTER_PI);
arc(190,220,270,270,PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(255,255,255);
arc(200,220,140,140,0,HALF_PI);
arc(200,220,150,150,HALF_PI, PI);
arc(200,220,160,160,PI, PI+QUARTER_PI);
arc(190,220,170,170,PI+QUARTER_PI, TWO_PI);



noStroke();
colorMode(RGB, 110);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}


float base = height * 0.75;
float scalar = 0.8;



fill(50);
textSize(50);  
float a = textAscent() * scalar; 

text("P", 180, 230);  
text("r",180,335);
text("o",90,230);
text("c",180,120);
text("e",280,230);
text("s",75,320);
text("s",295,320);
text("i",75,150);
text("n",180,80);
text("g",300,150);


