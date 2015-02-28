
size(385, 450);
background(255);
noStroke();

//red (top to bottom)
fill(200,25,40);
rect(0,210,5,15);
rect(0,275,5,45);

//yellow
fill(240,180,5);
rect(190,330,145,95);

//blue
fill(50,90,180);
rect(275,155,110,110);

//vertical lines (left to right)
fill(0);
stroke(0);
strokeWeight(10);
line(10,0,10,450);
line(30,270,30,325);
line(185,0,185,450);
line(270,0,270,450);
line(340,0,340,450);

//horizontal lines (top to bottom)
line(0,10,385,10);
line(0,150,385,150);
line(270,220,385,220);
line(0,270,385,270);
line(0,325,385,325);
line(270,380,385,380);
line(185,430,385,430);

//fat horizontal line
strokeWeight(15);
line(0,380,5,380);

