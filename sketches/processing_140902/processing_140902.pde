
//First name
//Last name
//What shape is this?

size(800, 800); //Window size. Try making it smaller or larger.

stroke(0, 255, 0); //Color of the line. Try changing the first 0 to 255.

fill(255, 0, 0); //Color of the shape. Try changing it to yellow or purple.
beginShape();
line (90,80,50,30); 
line (10,80,50,30);
line (90,80,10,80);
line (23,75,50,40);
line (78,75,50,40);
line (77,75,23,75);
endShape();

beginShape();
vertex(700, 100); // Top
vertex(750, 150); // Right
vertex(700, 200); // Bottom
vertex(650, 150); // Left
endShape();

line (45,20,73,50);
line (45,20,20,50); 
line (20,50,45,80);
line (73,50,45,80);
