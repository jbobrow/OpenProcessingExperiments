
/*
Day 01 Homework_By Eliana Xue Feng
*/

size(800,600);

//Draw the Panda head
fill(253,252,255);
ellipse(400,300,250,200);

//Draw the Panda eyes
fill(0,0,3);
ellipse(340,285,50,50);
ellipse(460,285,50,50);

//Draw the Panda eyeballs
stroke(255);
strokeWeight(8);
point(340,285);
point(460,285);

//Draw the Panda nose
stroke(0);
point(400,320);

//Draw the Panada nose
strokeWeight(4);
line(400,320,400,340);

//Draw the Panda mouth
noFill();
bezier(360, 340,  370, 350,  380, 360,  400, 340);
bezier(400, 340,  420, 360,  430, 350,  440, 340);
fill(242,22,62);
bezier(380, 355,  390, 370,  400, 400,  420, 355);

//Draw the Panda ears
fill(0,0,3);
ellipse(300,200,60,60);
ellipse(500,200,60,60);





