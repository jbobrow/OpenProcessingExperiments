
size(600, 600);

smooth();

strokeWeight(2);

background(127 , 255 , 212);

ellipseMode(RADIUS);

// Neck



// Antennae

//line(276, 155, 246, 112); // Small

line(276, 155, 306, 56); // Tall

line(276, 155, 342, 170); // Medium

// Body

noStroke(); // Disable stroke

fill(102); // Set fill to gray

ellipse(264, 377, 33, 33); 
ellipse(159, 377, 33, 33); 
fill(200);
ellipse(159, 377, 25, 25); 
ellipse(264, 377, 25, 25);

fill(100); 

ellipse(219, 257, 90, 90);//body

fill(102); // Set fill to gray

//rect(175, 274, 90, 15); // Gray stripe

// Head

fill(102); // Set fill to black

rect(266, 145, 90, 45); // Head


fill(255); // Set fill to white

ellipse(288, 150, 14, 14); // Large eye

fill(0); // Set fill to black

ellipse(288, 150, 3, 3); // Pupil

fill(153); // Set fill to light gray

//ellipse(263, 148, 5, 5); // Small eye 1

//ellipse(296, 130, 4, 4); // Small eye 2

//ellipse(305, 162, 3, 3); // Small eye 3
fill(255,51,51);
beginShape();
vertex(266, 190);
vertex(85, 20);
vertex(85, 75);
vertex(30, 75);
endShape();



