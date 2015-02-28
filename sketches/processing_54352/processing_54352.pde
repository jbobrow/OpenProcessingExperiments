
size(720, 480); 
smooth(); 
strokeWeight(2); 
background(204); 
ellipseMode(RADIUS);

// Neck 
fill(255,265,0);
ellipse(306, 255, 20, 20); //middle

// Antennae 
fill(220,20,60);
line(276, 155, 306, 100); //tall
line(276, 155, 306, 80); //tall
line(276, 155, 306, 20); //tall
ellipse(306,100,3,3);
ellipse(306,80,3,3);
ellipse(306,20,3,3);


// Body 
fill(212); //set fill to grey
fill(220,20,60);//set fill to black
ellipse(306,325, 50, 50); //main body
fill(102); //set fill to gray


// Head 
fill(0); //set fill to black
rect(266, 150, 100, 100); //head
fill(255); //set fill to white
ellipse(340, 170, 14, 14); //large eye
fill(0); //set fill to black
ellipse(340, 170, 3, 3); //pupil
fill(153); //set fill to light gray 
fill(255); //set fill to white
ellipse(320, 170, 14, 14); //large eye2
fill(0); //set fill to black
ellipse(320, 170, 3, 3); //pupil
fill(220,20,60);
ellipse(330,195,8,8); 

