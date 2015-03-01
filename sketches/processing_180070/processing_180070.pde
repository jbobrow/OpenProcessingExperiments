
/*
self portrait
*/

size(100,100);
background(255,255,255);

//neck
noStroke();
fill(250,230,100);
rect(50,50,20,50);
// set the face structure
fill(250,230,150);
ellipse(50,50,75,75);
ellipse(15,50,20,20);// nose

//set the hair
noFill();
stroke(0,0,0);
strokeWeight(5);
arc(50,50,75,75,PI+QUARTER_PI,TWO_PI);
fill(0,0,0);
quad(30,20,55,13,75,15,85,50);

//set the eye
stroke(0,0,0);
strokeWeight(1);
fill(255,255,255);
ellipse(35,40,15,5);
//inside of the eye
fill(0,0,0);
ellipse(35,40,5,5);
// eyebrow
strokeWeight(2);
line(25,30,45,30);

// set the ear
noFill();
strokeWeight(1);
arc(70,50,20,20,PI+QUARTER_PI,TWO_PI+QUARTER_PI);

//set the mouth
fill(255,0,0);
noStroke();
arc(23,75,15,15,PI+QUARTER_PI,TWO_PI+HALF_PI);


