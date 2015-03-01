
size(400,100);
background(0);




//PacMan 
//--why does the start have to be zero  and nto any angle ?
noStroke();
fill(255,255,0);
//rotate(.90);   rotated whole canvas
arc(50, 50, 70, 70, .5,5.5,PI);
//eye
fill(0);
ellipse(45,40,8,8);


//dots
// iterate?
fill(255,255,0);
ellipse(100,50,10,10);
ellipse(125,50,10,10);
ellipse(150,50,10,10);
ellipse(175,50,10,10);
ellipse(200,50,10,10);
ellipse(225,50,10,10);
ellipse(250,50,10,10);
ellipse(275,50,10,10);
ellipse(300,50,10,10);
ellipse(325,50,10,10);
ellipse(350,50,10,10);
ellipse(375,50,10,10);



//lines
stroke(0,0,255);
strokeWeight(3);
line (0,5,400,5);
line (0,95,400,95);

