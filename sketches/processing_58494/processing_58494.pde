
// Declare variables for body colour - Andrew

float bodyR;
float bodyG;
float bodyB;



size (300,300);

ellipseMode(CENTER);

ellipse(150,60,50,50);



line(150,60,165,65);

line(150,70,165,65);

line(150,65,165,65);

fill(0);

ellipse(140,50,8,8);

ellipse(160,50,8,8);

fill(255);

ellipse(150,180,80,170);

// Add random colour body segments - Andrew
stroke (0);
bodyR = random(255);
bodyG = random(255);
bodyB = random(255);
fill(bodyR,bodyG,bodyB);
ellipse (127,180,20,130);

stroke (0);
bodyR = random(255);
bodyG = random(255);
bodyB = random(255);
fill(bodyR,bodyG,bodyB);
ellipse (173,180,20,130);

line(125,68,112,150);

line(175,68,188,150);

line(112,150,70,150);

line(188,150,230,150);

line(112,190,112,270);

line(188,190,188,270);
