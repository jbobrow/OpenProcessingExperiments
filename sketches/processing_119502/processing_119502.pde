
}// Draw the spaceship body
stroke(152, 143, 143);
fill(30, 175, 250);
rect(100,100,20,100);
// Draw the spaceship nose
fill(250, 5, 13);
triangle(90, 50, 100, 20, 110, 50);
//Draw the spaceship window pt 1
fill(255);
ellipse(100,60,10,10);
//Draw the spaceship window pt 2 
fill(0);
ellipse(100,60,5,5);
// Draw the spaceship wing pt 1
fill(250, 5, 13);
triangle(90, 80, 60, 140, 90, 140);
//Draw the spaceship wing pt 2
fill(250, 5, 13);
triangle(110, 80, 140, 140, 110, 140);
// Draw the bottom wings
fill(250, 5, 13);
quad(90, 150, 80, 160, 110, 150, 120, 160);
