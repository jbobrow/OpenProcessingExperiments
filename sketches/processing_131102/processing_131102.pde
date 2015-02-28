
size(500, 500);

//background box
fill(207, 180, 150);
rect(0, 0, 500, 500);

//background diagonal lines
noStroke();
fill(131, 126, 120);
quad(0, 500, 50, 500, 500, 50, 500, 0);
fill(41, 40, 38);
quad(50, 500, 100, 500, 200, 400, 175, 375);

//top rectangle
fill(41, 40, 38);
rect(25, 25, 25, 250);
fill(197, 193, 194);
quad(25, 275, 0, 300, 25, 300, 50, 275);
fill(244, 235, 228);
quad(25, 275, 0, 300, 0, 50, 25, 25);

//corner square
noStroke();
fill(205, 88, 44);
rect(350, 350, 500, 500);

//corner rectangle
fill(244, 235, 228);
rect(250, 425, 150, 25);
fill(197, 193, 194);
quad(250, 450, 275, 475, 425, 475, 400, 450);
fill(41, 40, 38);
quad(400, 425, 400, 450, 425, 475, 425, 450);

//circle
ellipseMode(CENTER);
fill(205, 88, 44);
ellipse(175, 175, 150, 150);

//triangle + sides
fill(244, 235, 228);
triangle(175, 175, 150, 300, 100, 250);
fill(41, 40, 38);
triangle(175, 175, 150, 325, 150, 300);
fill(197, 193, 194);
quad(100, 250, 100, 275, 150, 325, 150, 300);

//steps
fill(197, 193, 194);
rect(350, 100, 25, 75);
rect(400, 150, 25, 75);
rect(450, 200, 25, 75);


//lines very top most layer
stroke(41, 40, 38);
strokeWeight(2);
line(350, 0, 350, 500);
line(0, 350, 500, 350);
line(75, 50, 275, 150);
line(75, 75, 275, 175);

//My composition is inspired by El Lissitzky, an avante garde russian artist that inspired the constructivist and the Bauhaus. Most of his early work was very minimilist, only containing a few shapes and a strict color pallet of red, tans and grays. I used all of these minimilist ideas to create my own composition following a lot of unseen rules he creates for himself. Most of his work is set on some sort of grid, having each shape line up in a way. He also believes that the most powerful shape is the triangle, as seen in multiple of El Lissitzky’s works, it is suppose to represent strength and prosperity.


