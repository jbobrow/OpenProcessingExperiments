
// Ex03_06

size(600, 200);
smooth();
background(255,255,200);
strokeWeight(5);

rectMode(CORNER);//default
rect(60, 60, 80, 80);

rectMode(CENTER);
fill(200,100,100);
rect(300, 100, 80, 80);

rectMode(CORNERS);
stroke(240,150,100);
noFill();
rect(460, 60, 540, 140);
