
size(400, 400);
smooth();

//left arm
fill(200); //light grey
triangle(145, 187, 148, 205, 100, 250); //arm
quad(98, 235, 120, 244, 106, 264, 95, 258); //hand

//legs
triangle(140, 260, 160, 270, 155, 320); //left 
triangle(230, 290, 255, 280, 245, 340); //right

//body
fill(200); //light grey
quad(144, 187, 229, 190, 240, 300, 135, 275); //main
fill(80); //dark grey
quad(229, 189, 265, 160, 280, 246, 240, 300); //side
quad(150, 200, 205, 205, 208, 275, 148, 260); //door
fill(180); //lighter grey
ellipse(198, 240, 10, 10); //door handle

//antenna
line(190,110, 210, 70); //longest
line(210, 70, 195, 60); //middle
line(195, 60, 199, 48); //shortest
fill(155); //light grey
ellipse(202, 40, 17, 17); //tip


//robot head
fill(200); //light grey
quad(100, 100, 260, 90, 260, 190, 110, 185); //main
fill(80); //dark grey
quad(260, 90, 300, 120, 300, 160, 260, 190); //side

//right arm
fill(200); //light grey
triangle(240, 195, 260, 190, 300, 260); //arm
quad(285, 255, 305, 245, 305, 266, 293, 275); //hand

//eyes
fill(30); //dark grey
ellipse(145, 132, 50, 50); //bigger eye
ellipse(220, 136, 28, 28); //smaller eye

//mouth
fill(255); //white
quad(135, 160, 225, 158, 227, 189, 137, 186);

//teeth
line(170, 160, 172, 187); //first
line(208, 159, 210, 188); //second

