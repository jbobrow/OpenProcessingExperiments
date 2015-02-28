
size(400, 400);
background(0);

ellipseMode(CENTER);
fill(255);
//noStroke(155);

float x = 10;
float y = 10;
float w = 10;

for (int i = 0; i < 6; i++) {
  w = sin( (100 - x) / 100) * 10 + 50; 
    for (int j = 0; j < 40; j++) {
      y = j * 10 + 60;
      ellipse(x, y-55, w, 10);
    }
    x = x + w + 30;
  }
  
noStroke();
fill (0, 90);
ellipse(200, 200, 300, 300);

noStroke();
fill (0, 90);
ellipse(100, 100, 200, 200);

noStroke();
fill (0, 90);
ellipse(300, 300, 200, 200);
