
/*@pjs preload="Ocean.jpg";*/

size(800, 500);

PImage img = loadImage("Ocean.jpg");
image(img, 0,0);

//FISH 1
//tail
fill(0, 255, 0);
triangle(100, 300, 100, 200, 150, 250);

//body
fill(0, 255, 0);
bezier(150, 250, 200, 175, 300, 175, 350, 250);
bezier(150, 250, 200, 325, 300, 325, 350, 250);

//smile
bezier(350, 250, 330, 265, 320, 265, 300, 250);

//eyes
fill(0, 0, 0);
ellipseMode(CORNER); 
ellipse(300, 225, 10, 10); 

//fin
line(230, 250, 200, 260); 
line(200, 260, 230, 270);
//END FISH 1


//FISH 2
//tail
fill(255, 0, 0);
triangle(400, 400, 400, 300, 450, 350);

//body
fill(255, 0, 0);
bezier(450, 350, 500, 275, 600, 275, 650, 350);
bezier(450, 350, 500, 425, 600, 425, 650, 350);

//smile
bezier(650, 350, 630, 365, 620, 365, 600,350);

//eyes
fill(0, 0, 0);
ellipseMode(CORNER); 
ellipse(600, 325, 10, 10); 

//fin
line(530, 350, 500, 360); 
line(500, 360, 530, 370);
//END FISH 2

//FISHING HOOK

//fishing line
line(400, 0, 400, 200);

//fishing bate
stroke(255, 255, 255);
fill(86, 100, 103);
rect(395, 200, 10, 25);

//fishing hook
noFill(); 
arc(395, 225, 15, 15, 0, PI+QUARTER_PI, OPEN); 


