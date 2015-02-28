

size(700, 700);

background(238, 232, 205);

strokeWeight(10);
strokeCap(SQUARE);

//long horizontal lines
line(30, 70, 660, 70);
line(70, 410, 660, 410);
line(30, 500, 700, 500);

//long vertical lines
line(70, 70, 70, 680);
line(400, 20, 400, 660);
line(660, 30, 660, 680);

//additional lines
line(140,20,140,70);
line(30, 250, 70, 250);
line(400,250,660,250);
line(530,250,530,410); 
line(235,400,235,680);
line(235,660,660,660);

//large red box
noStroke();
fill(255, 0, 0);
rect(75, 75, 320, 330);

//small red box
rect(665, 505, 35, 195);

//yellow boxes
fill(255,215,0);
rect(405,0,250,65);
rect(405,75,250,170);
rect(0,505,65,200);

//black boxes
fill(0); 
rect(75,415,160,160);
rect(230,575,166,90);

//blue box
fill(0,0,255);
rect(405,505,251,150);






