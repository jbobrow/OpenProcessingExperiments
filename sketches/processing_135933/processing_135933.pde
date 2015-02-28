
size(400, 800);
background(50);

for (int y = 20; y <= 950; y+=18) {
  for (int x=20; x <= 400; x +=18) {
    noStroke();
    fill(255, 15);
    ellipseMode(CENTER);
    ellipse(x, y, 100, 100);
    }
  }

strokeWeight(3);
stroke(225, 206, 0, 145);
  for (int y = 0; y <= 950; y += 50) {
    for (int x = 0; x <= 450; x += 50) {
      if ((x % 100) == 0) {
        line(x, y, x+50, y-50);
      } else {
        line(x, y, x+50, y+50);
      }
    }
  }
  

for (int y = 0; y <= 950; y+=50 ) {
  for (int x= 0; x <= 450; x +=50) {
    noStroke();
    fill(126, 85, 255, 45);
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
    }
  }


