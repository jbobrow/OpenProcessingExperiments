
size(400,400); //size of the canvas

//head of monster
fill(255, 0, 0);
rect(100,100, 200, 200); 

//eyes of monster
fill(255);
ellipse(150, 170, 60, 60);
ellipse(250, 170, 60, 60);
fill(0);
ellipse(150, 170, 40, 20);
ellipse(250, 170, 40, 20);

//mouth of monster
strokeWeight(5);
line(120, 240, 280, 240);
strokeWeight(1);
fill(150);
triangle(120, 240, 160, 240, 140, 260);
triangle(240,240, 280, 240, 260, 260);


