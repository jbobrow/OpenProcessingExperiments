
/*@pjs preload="test.png";*/

int eSize = 10;
int iSize = 2;

size(600, 300);
background(255);
noStroke();
fill(0);

for (int y =0; y <=600; y += 10) {
  for (int x = 0; x <= 600; x += 10) {
    fill(100-x, 200-y, 600-y, 100);
    rect(x, y, eSize, eSize);
  }
}

for (int y =0; y <=600; y += 10) {
  for (int x = 0; x <= 600; x += 10) {
    fill(100-x, 200-y, 600-y, 100);
    line(x, y, eSize, eSize);
  }
}

for (int y =0; y <=600; y += 10) {
  for (int x = 0; x <= 600; x += 10) {
    fill(100-x, 200-y, 600-y, 100);
    ellipse(x, y, iSize, iSize);
  }
}

stroke(400, 400, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 270, 270);

stroke(350, 350, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 210, 210);

stroke(300, 300, 400, 10);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 150, 150);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 150, 150);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 90, 90);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 60, 60);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
rect(150, 150, 30, 30);

//kokokaramigi

stroke(400, 400, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 270, 270);

stroke(350, 350, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 210, 210);

stroke(300, 300, 400, 10);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 150, 150);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 150, 150);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 90, 90);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 60, 60);

stroke(300, 300, 400, 127);
strokeWeight(5);
rectMode(CENTER);
noFill();
ellipse(450, 150, 30, 30);

//kokokarasenn

strokeWeight(3);
stroke(88, 144, 255);
line(0, 150, 350, 150);

strokeWeight(3);
line(350, 150, 360, 100);

strokeWeight(3);
line(360, 100, 370, 190);

strokeWeight(3);
line(370, 190, 380, 80);

strokeWeight(3);
line(380, 80, 390, 210);

strokeWeight(3);
line(390, 210, 400, 50);

strokeWeight(3);
line(400, 50, 410, 170);

strokeWeight(3);
line(410, 170, 420, 120);

strokeWeight(3);
line(420, 120, 430, 150);

strokeWeight(3);
line(430, 150, 600, 150);

//kokokaramaru

stroke(300, 300, 400, 127);
noStroke();
fill(255, 255, 255, 127);
ellipse(500, 55, 100, 100);

stroke(300, 300, 400, 127);
noStroke();
fill(255, 255, 255, 127);
ellipse(530, 150, 70, 70);

stroke(300, 300, 400, 127);
noStroke();
fill(255, 255, 255, 127);
ellipse(500, 230, 40, 40);

//migihannbunn

for (int y = 0; y <= 300; y += 10) {
  for (int x = 0; x <= 300; x += 10) {
    stroke(0, 101, 255, 20);
    line(300,300,300+x*5,y*5);
  }
}


