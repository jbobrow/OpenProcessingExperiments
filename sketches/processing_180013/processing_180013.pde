
size(100,100);
background(249, 246, 237);

fill(0, 0, 0, 0);
stroke(0, 0, 0, 500);

ellipse(50,60,50,60); //face

ellipse(40,50,10,10); //left eye
ellipse(60,50,10,10); //right eye

fill(0, 0, 0, 100);
ellipse(40,51,4,4); //left eyeball
ellipse(60,51,4,4); //right eyeball

line(48,60,46,66); // left nose line
line(52,60,54,66); // right nose line
line (46,66,54,66); //nose underline

noFill();
arc(50, 65, 30, 30, 0.7, 2); // lips

noStroke();
fill(0, 0, 0, 999);

/* Hair peices */
quad(31,39,35,39,29,29,29,29);
quad(35,37,39,37,33,27,33,27);
quad(39,35,43,35,37,25,37,25);
quad(43,35,47,35,41,25,41,25);
quad(47,35,51,35,45,25,45,25);
quad(51,35,55,35,49,25,49,25);
quad(55,35,59,35,53,25,53,25);
quad(59,37,63,37,57,27,57,27);
quad(63,39,67,39,61,29,61,29);







