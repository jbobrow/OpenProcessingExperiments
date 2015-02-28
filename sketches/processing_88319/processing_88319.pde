
//Ex03_01

size(800, 200);
smooth();
background(125, 255, 255);
strokeWeight(15);
point (20, 20);

stroke(255, 255);
strokeWeight(3);
line(80, 20, 80, 180);

ellipse(150, 100, 50, 150);

// form: arc(x, y, width, height, start, stop); 
noFill();
arc ( 250, 100, 75, 75, 0, PI);

rect(350, 50, 50, 100);
rect(450, 100, 40, 40);

curve(550, 100, 550, 50, 650, 75, 750, 175);
