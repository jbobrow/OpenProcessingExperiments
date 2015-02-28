
// art inspiration http://designspiration.net/image/1838753683188/
size(600, 600);
background(235, 215, 165);

//blue pattern
noStroke();
fill(92, 158, 153);
int boxblue = 600/7;
rect(0, 0, boxblue, 475);
rect(boxblue * 2, 0, boxblue+5, 475);
rect(boxblue * 4, 0, boxblue+5, 475);
rect(boxblue * 6, 0, boxblue+5, 475);

//red box
fill(249, 189, 127);
rect(0, 490, 600, 50);

//bottom box
fill(173, 201, 165);
rect(0, 557.25, 600, 50);

//center point
fill(83, 115, 116);
ellipse(300, 235, 375, 375);

// 10 light color
fill(236, 215, 165);
rect(230, 100, 40, 265);
rect(317.478, 131, 65.2, 200);
ellipse(350, 131, 65, 65);
ellipse(350, 335, 65, 65);
strokeWeight(3);
stroke(236, 215, 165);
line(0, 515, 280, 515);
line(320,515,600,515);
ellipse(300,515,15,15);

//10 dark color
noStroke();
fill(83, 115, 116);
rect(200, 120, 47, 250);
rect(337.478, 135, 25, 200);
ellipse(350, 135, 25, 25);
ellipse(350, 335, 25, 25);



