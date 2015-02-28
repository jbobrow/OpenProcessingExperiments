
size(800, 800);
background(255);

colorMode(RGB);
for (int i = 0; i < 400; i++) {
  float r = 6 + (i*0.8);
  float g = 142 + (i*0.18);
  float b = 193 - (i*1.03);
  stroke(r, g, b);
  line(i, 0, i, 400);
}

for (int i = 0; i < 800; i++) {
  float r = 196 - (i*0.35);
  float g = 122 - (i*0.28);
  float b = 164 + (i*0.3);
  stroke(r, g, b);
  line(i+400, 0, i+400, 400);
}

for (int i = 0; i < 400; i++) {
  float r = 200 - (i*0.25);
  float g = 140 + (i*0.23);
  float b = 110 + (i*0.3);
  stroke(r, g, b);
  line(i, 400, i, 800);
}

for (int i = 0; i < 800; i++) {
  float r = 204 + (i*0.05);
  float g = 250 - (i*0.03);
  float b = 3 + (i*1.2);
  stroke(r, g, b);
  line(i+400, 400, i+400, 800);
}

//here are the RGB values for part 1

ellipseMode(CENTER);
noStroke();
fill(255, 100);
ellipse(width/2, height/2, 200, 200);

fill(255, 25, 7, 70);
ellipse(width/2+50, height/2+50, 100, 100);

fill(255, 25, 7, 70);
ellipse(width/2-50, height/2-50, 100, 100);

fill(20, 216, 119, 70);
ellipse(width/2+50, height/2-50, 100, 100);

fill(20, 216, 119, 70);
ellipse(width/2-50, height/2+50, 100, 100);

//Here are the HEX values for part 2
rectMode(CENTER);
fill(#FF2E2E, 70);
rect(150, 150, 150, 150);

fill(#FF932E, 70);
rect(width-150, 150, 150, 150);

fill(#32FF05, 70);
rect(150, height-150, 150, 150);

fill(#920AC4, 70);
rect(width-150, height-150, 150, 150);



