
size(1000,500);
smooth();
background(250);
strokeWeight(6);
ellipseMode(RADIUS);

//Robot Male

//Neck
stroke(65);
line(350,230,350,245);

// Head
noStroke();
fill(200);
ellipse(350,150,80,80);
fill(65);
ellipse(350,150, 60, 20);

//left eye
fill(0);
ellipse(325,150, 14,14);
fill(40,192,196); //light blue color
ellipse(325,150, 5,5);

//right eye
fill(0);
ellipse(375,150,14,14);
fill(40,192,196); //light blue color
ellipse(375,150, 5,5);


//Body

//Arms
//Left Hand   
stroke(65);
line(298,300,298,315);
noStroke();
fill(200);
ellipse(298,320,12,12);

//Left Arm
stroke(65);
line(310,250,300,270);
noStroke();
fill(200);
rect(288,270,20,30);



//Right Hand 
stroke(65);
line(402,300,402,315);
noStroke();
fill(200);
ellipse(402,320,12,12);

//Right Arm
stroke(65);
line(390,250,400,270);
noStroke();
fill(200);
rect(392,270,20,30);

//Chest
fill(200);
noStroke();
beginShape();
vertex(300,245);
vertex(400,245);
vertex(380,290);
vertex(320,290);
endShape();


//Heart


//Legs
//Left Leg
stroke(65);
line(340,320,335,350);
noStroke();
fill(200);
rect(330,340,15,50);
fill(65);
beginShape();
vertex(330,390);
vertex(315,420);
vertex(345,420);
vertex(345,390);
endShape();

//Right Leg
stroke(65);
line(360,320,365,350);
noStroke();
fill(200);
rect(355,340,15,50);
fill(65);
beginShape();
vertex(355,390);
vertex(355,420);
vertex(385,420);
vertex(370,390);
endShape();

//Hips
noStroke();
fill(200);
rect(320,290,60,15);
arc(350,305,30,30, radians(0), radians(180));










