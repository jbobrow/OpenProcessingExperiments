
size(400, 400);
background(0, 0, 0);

rectMode(CORNERS);

noStroke();

fill(20, 20, 20);
rect(0, 0, 107, 250);

fill(50, 50, 50);
rect(0, 250, 257, 400);

fill(80, 80, 80);
rect(107, 0, 400, 250);

fill(110, 110, 110);
rect(257, 250, 400, 400);

fill(255, 238, 0);
stroke(255, 238, 0);

strokeWeight(12);
for(int x = 50; x < 300; x = x+50) {
  line(0+x, 0, 100+x, 400);
}


