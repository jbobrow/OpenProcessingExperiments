
background(0,225,225);

size(200,200);
noStroke();
fill(225,225,0);
smooth();

ellipse(165,100,50,50);
stroke(1);
strokeWeight(8);

line(150,20,150,180);
strokeWeight(4);
line(165,20,165,180);
strokeWeight(2);
line(180,20,180,180);
strokeWeight(1);
fill(255,160,0);

pushMatrix();
rotate(-TWO_PI/7);
rect(20,100,110,80);
strokeWeight(2);
stroke(225,0,0);

fill(225);
smooth();
triangle(20,80,130,80,75,20);

