
 

size(400, 400);
colorMode(RGB, 256);
background(0);


fill(255,255,0);
ellipse(40,40,200,200);

fill(0,155,0);
ellipse(280,470,400,300);

fill(250,250,210);
rect(220, 240, 100, 90);

fill(255,0,0);
triangle(270, 190, 200, 250,340, 250);

fill(62,201,253);
rect(275,270, 10,10);

fill(62,201,253);
rect(275,284, 10,10);

fill(62,201,253);
rect(287,284, 10,10);

fill(62,201,253);
rect(287,270, 10,10);

fill(102,53,35);
rect(229,270, 30,60);



for (int i=0; i < 400; i++) {
  fill(255,255, 255);
  float size = random(3, 3);
  ellipse(random(width), random(height), size, size);
}


