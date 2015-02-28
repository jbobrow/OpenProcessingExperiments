
size(600, 600);

for (int bkg = 0; bkg <= 255; bkg += 10) {
  for(int a = 0; a <= 600; a += 10) {
    for(int b = 0; b <= 600; b += 10) {
      
  noStroke();
  fill(a, b * 0.6, a + b * 2);
  rect(a * 3, b * 3, a + 600, b + 600);
  
    }
  }
}

stroke(0);
line(width * 0.5, 0, width * 0.5, height);
line(0, height * 0.5, width, height * 0.5);

//for(int x = 30; x <= 255; x += 10) {
  
  int t = 30;
  noStroke();
  fill(255);

rect(210, 30, t, t);
rect(360, 30, t, t);
rect(90, 270, t, t); 
rect(90, 300, t, t);
rect(60, 330, t, t);
rect(60, 360, t, t);
rect(60, 390, t, t);
rect(120, 330, t, 60);
rect(120, 240, t, t);
rect(150, 210, t, t);
rect(150, 270, t, t);
rect(180, 180, t, t);
rect(210, 150, t, t);
rect(180, 210, t, 120);
rect(210, 330, t, t);
rect(240, 60, t, 90);
rect(270, 150, 60, t);
rect(330, 60, t, 90);
rect(360, 150, t, t);
rect(390, 180, t, 150);
rect(360, 330, t, t);
rect(width * 0.5 - 60, height * 0.5 - 90, t, t);
rect(width * 0.5 + 30, height * 0.5 - 90, t, t);
rect(240, 360, t, t);
rect(330, 360, t, t); 
rect(270, 390, 60, t);
rect(240, 420, 120, t);
rect(210, 450, t, 90);
rect(360, 450, t, 90);
rect(270, 480, 60, 90);
//rect(330, 510, t, t);
//rect(240, 510, t, t);
rect(270, 300, 60, t);
rect(420, 210, t, t);
rect(420, 270, t, t);
rect(450, 240, t, t);
rect(480, 270, t, 60);
rect(450, 330, t, 60);
rect(510, 330, t, 90);

//}

text("adrian trevino", 500, 590);



