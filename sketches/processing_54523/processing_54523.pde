
size(500, 550);
background(255); //background white

smooth();
strokeWeight(3);
stroke(0); //outline black
fill(200); //light grey fill
rect(200, 200, 100, 180); //body of the robot
strokeWeight(5); //button line weight
strokeCap(ROUND); //line rounded
line(280, 220, 280, 250); //button detail
stroke(255, 0, 0); //button colour red
point(280, 260); //button detail
stroke(0, 150, 0); //button colour green
point(280, 270); //button detail

strokeWeight(3);
stroke(0); //outline black
fill(150); //darker grey fill
arc(250, 200, 100, 100, radians(180), radians(360)); //semi-circle body-neck

strokeWeight(3);
fill(150); //darker grey fill
strokeJoin(ROUND);
triangle(200, 380, 300, 380, 250, 480); //triangle bottom

strokeWeight(2);
line(250, 100, 100, 100); //anntenna left
strokeWeight(15);
stroke(0, 180, 200); //stroke colour blue/green
point(100, 100);

strokeWeight(2);
stroke(0);
line(355, 100, 400, 120); //anntenna right
strokeWeight(15);
stroke(0, 180, 200); //stroke colour blue/green
point(400, 120);

strokeWeight(2);
stroke(0); // outline black
fill(255, 200, 0); // orange/yellow colour
ellipse(150, 100, 10, 30); //antenna detail left 1

strokeWeight(2);
stroke(0); // outline black
fill(255, 200, 0); // orange/yellow colour
ellipse(350, 100, 10, 30); //antenna detail right 1

strokeWeight(2);
stroke(0); // outline black
fill(100, 205, 0); // apple green colour
ellipse(163, 100, 15, 40); //antenna detail left 2

strokeWeight(2);
stroke(0); // outline black
fill(100, 205, 0); // apple green colour
ellipse(337, 100, 15, 40); //antenna detail right 2

strokeWeight(2);
stroke(0); // outline black
fill(255, 120, 140); // pink colour
ellipse(177, 100, 13, 50); //antenna detail left 3

strokeWeight(2);
stroke(0); // outline black
fill(255, 120, 140); // pink colour
ellipse(323, 100, 13, 50); //antenna detail right 3

strokeWeight(4);
stroke(0); // outline black
fill(200); // fill lighter grey
ellipse(250, 100, 130, 100); //head of robot

strokeWeight(1);
fill(255); // white fill
ellipse(210, 95, 30, 30); //left eye
ellipse(290, 95, 30, 30); //right eye

noStroke(); // no stroke around pupil
fill(80, 0, 130, 180); //purple pupil - slightly transparent
ellipse(210, 100, 20, 20); //left pupil
ellipse(290, 100, 20, 20); //right pupil

strokeWeight(2);
stroke(0); //stroke black
noFill(); //no fill for smile
arc(250, 120, 30, 20, radians(10), radians(100)); //lopsided smile




