
// Meep from Mars
size(200,200); //Window size
background(162,7,224); //Color of Background
smooth(); //smoothes out the edges

//Set ellipses and rectangles to center mode
rectMode(CENTER); //all rectangles will be drawn from center point
ellipseMode(CENTER);//all ellipses will be drawn from center point

//Draw Meeps body
stroke(0); //line drawn in this color
fill(150);// color of the inside of the oobject
rect(100,100,20,100); //Meeps Body

//Draw Meeps head
stroke(0);
fill(17,247,57);
ellipse(100,70,80,60); //Meepss Head

//Draw Meeps Eyes
stroke (255,0,0);
fill(255,0,0);
ellipse(81,70,8,32); //left eye
ellipse(119,70,8,32); //right eye

//Draw Meeps Mouth
stroke(0); 
fill(0);
ellipse(100,90,10,4);

//Draw Meeps Legs
stroke(0);
strokeWeight(5);
line(90,150,70,170); //left leg
line (110,150,130,170); //right leg

//Draw Meeps Arms
stroke(0);
strokeWeight(2);
line(90,120,70,120);
line(110,120,130,120);
println("Meep meep meep Meep Meep meep");
println("Translation");
println("You there, Take me to your leader");







