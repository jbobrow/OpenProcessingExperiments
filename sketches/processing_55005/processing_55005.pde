
size(100,100);
smooth();
strokeWeight(2);
background(204);
ellipseMode(CENTER);

//Neck
stroke(0,255,252);
line(42,40,42,50);
line(44,42,44,50);
line(38,40,38,50);
line(36,42,36,50);

//Leg
ellipse(40,78,20,20);
noStroke();
fill(25,1,255);
ellipse(40,92,15,15);

//Body
fill(78,77,84);
noStroke();
rectMode(CENTER);
rect(40,66,30,30);   //main body
noStroke();
fill(255,175,104);
rect(32,62,10,10);    //arms
rect(48,68,10,10);
fill(25,1,255);
stroke(0,255,252);
strokeWeight(1);
ellipse(34,64,7,7);   //hands
ellipse(50,70,7,7);


//Head
noStroke();
fill(255,234,0);
ellipse(40,30,30,30);
fill(255,0,6);
ellipse(42,32,20,20);  //eyeball
fill(255,255,255);
ellipse(46,34,10,10);   //eyepupil
noStroke();
fill(25,1,255);
triangle(26,24,26,38,5,30);
triangle(26,38,36,44,6,62);
triangle(50,20,68,10,56,30);
triangle(56,30,70,30,54,36);






