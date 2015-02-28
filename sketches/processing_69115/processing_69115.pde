
size(200,200);

color bkgrnd = color(255,255,255);
noStroke();
fill(bkgrnd);
rect(0,0,200,200);

//shapes

color triangle1 = color(255,0,0);
fill(triangle1);
stroke(0);
strokeWeight(2.5);
triangle(20, 100, 60, 20, 100, 100);

color arc1 = color(0,255,0);
fill(arc1);
stroke(0);
strokeWeight(2.5);
arc(180, 100, 160, 160, PI, PI+HALF_PI);

color ellipse1 = color(0,0,255);
fill(ellipse1);
stroke(0);
strokeWeight(2.5);
ellipse(140, 125, 80, 50);

color quad1 = color(255,255,0);
fill(quad1);
stroke(0);
strokeWeight(2.5);
quad(20, 100, 180, 200, 75, 200, 20, 175);

//lines

stroke(0);
strokeWeight(2.5);
line(0,20,180,20);

stroke(0);
strokeWeight(2.5);
line(20,0,20,200);

stroke(0);
strokeWeight(2.5);
line(180,0,180,200);

stroke(0);
strokeWeight(2.5);
line(20,100,180,100);

stroke(0);
strokeWeight(2.5);
line(100,100,100,200);

stroke(0);
strokeWeight(2.5);
line(100,150,200,150);


