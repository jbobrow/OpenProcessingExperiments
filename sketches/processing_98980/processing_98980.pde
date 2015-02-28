
//background canvas set up
size(720, 480);
smooth();
background(255, 155, 155);

ellipseMode(RADIUS);
rectMode(CENTER);

strokeWeight(2);

//Head
noStroke(); //Disable stroke
fill(255);  //white
ellipse(240, 155, 50, 55);  //Head
fill(0); //black
ellipse(240, 170, 20, 5); // mouth
fill(0); //black
ellipse(240, 154, 3, 3); //nose
fill(92, 139, 196); //light gray
ellipse(220, 148, 10, 10); //left eye
ellipse(260, 148, 10, 2); //right eye 

//Neck
noStroke();
fill(255, 100, 0); //drk. orange
rect(240, 220, 20, 20); //neck
 
//ears
stroke(0);
fill(230, 100, 100);//
ellipse(178, 155, 10, 13); //left
line(168, 155, 188, 155);
fill(253, 80, 80);//
ellipse(301, 155, 10, 20); //right
line(291, 155, 310, 155);
fill(150, 50, 20);//
ellipse(240, 88, 20, 10); //top
line(240, 78, 240, 98);

 
//Body
noStroke(); //Disable stroke
fill(255, 140, 0);  //orange
rect(240, 285, 100, 120);  //Main body

//Arms and hands
stroke(201, 58, 41);
strokeWeight(5);
line(190, 225, 240, 285);
line(290, 225, 370, 255);

fill(201, 58, 41);
ellipse(240, 285, 10, 7);//left hand
ellipse(370, 255, 10, 7);//right hand
//right fingers
strokeWeight(2);
line(370, 255, 370, 235);//thumb

line(370, 255, 397, 250);
line(371, 258, 400, 255);
line(370, 260, 398, 260);
line(370, 262, 395, 263);

//left fingers
line(240, 285, 240, 265);//thumb

line(240, 285, 267, 280);
line(241, 288, 271, 285);
line(240, 290, 268, 290);
line(240, 292, 265, 293);

//Legs and Wheels
noStroke();
fill(201, 58, 41);
rect(210, 360, 5, 30);//left leg
rect(270,360, 5, 30);//right leg
fill(0);  //black
ellipse(210, 377, 20, 20); //left wheel
fill(0);  //black
ellipse(270, 377, 20, 20); //right wheel

//box and bow
fill(255);
rect(399,232,50,40);

ellipse(388, 204, 12, 5);
 
ellipse(410, 204, 12, 5);
 






