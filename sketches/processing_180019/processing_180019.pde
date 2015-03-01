
/* Donahue_Self Protrait
Practicing drawing basic shapes in processing. */

size(100,100); //size of the window
background(162,181,205); //change background color
 
fill(255,106,106); //color of shirt
noStroke();
rect (33,54,35,39); //draw rect_Shirt 

quad(18, 70, 34, 54, 36, 65, 18, 80); //create shape_left Arm

quad(86, 70, 68, 54, 68, 65, 86, 80); //create shape_right Arm

fill(139,90,43); //color of left side of hair 
noStroke();
rect(33, 23, 8, 45, 3, 5, 7, 10); //shape for left side of hair 

fill(139,90,43); //color of right side of hair
noStroke();
rect(60, 23, 8, 45, 3, 5, 7, 10); //shape of right side of hair

fill(255,239,213); //color of the neck
noStroke();
ellipse(50, 45, 15, 38); //create ellipse_Neck

fill(255,239,213); //color of the face
stroke (197,193,170); //color of the highlight
ellipse(50, 38, 28, 35); //create ellipse_Face

fill(255,255,255); //color of the eye_left eye_outside
noStroke();
ellipse(44, 36, 7, 5); //left eye location_outside

fill(85,107,47); //color of the eye_left eye_inside
noStroke();
ellipse(44, 37, 4, 3); //left eye location_inside

fill(255,239,213); //underskin
noStroke();
ellipse(44, 39, 6, 3); //drawing shape to make eye shape_Left

fill(255,255,255); //color of the eye_right eye_outside
noStroke();
ellipse(54, 36, 7, 5); //right eye location_outside

fill(85,107,47); //color of the eye_right eye_inside
noStroke();
ellipse(54, 37, 4, 3); //right eye location_inside

fill(255,239,213); //underskin
noStroke();
ellipse(54, 39, 6, 3); //drawing shape to make eye shape

fill(238,207,161); //color of the nose
noStroke();
ellipse(49, 42, 2, 2.5); //nose location

fill(255,193,193); //color of the lips
noStroke();
ellipse(49, 47, 8, 2); //size and location of lips

fill(139,90,43); //color of the eyebrows
noStroke();
ellipse(43, 32, 6, .5); //size and location of eyebrows_Left

fill(139,90,43); //color of the eyebrows
noStroke();
ellipse(55, 32, 6, .5); //size and location of eyebrows_right

fill(139,90,43); //color of hair 
noStroke();
ellipse (44,23,20,11); //front of hair_left

fill(139,90,43); //color of front of hair 
noStroke();
ellipse (56,23,20,11);//front of hair_right

fill(139,90,43); //color of front of hair 
noStroke();
ellipse (35,34,4,20); //left side sideburn

fill(139,90,43); //color of front of hair 
noStroke();
ellipse (64,34,4,20); //right side sideburn





