
size(800, 800);
int y = height/2;
int d = width/2;

noStroke();
smooth();
background(#ffffff);

fill(0, 0, 100);
ellipse(390, 140, 16, 32);

fill(0, 0, 100);
ellipse(410, 140, 16, 32);

stroke(#3B3B39);
noFill();
strokeWeight(2);
strokeCap(SQUARE);
arc(y, 176, 100, 10, PI*-0, PI*1.0);

//Teeth
line(390, 180, 395, 195);
line(395, 195, 400, 180);

line(400, 180, 405, 195);
line(405, 195, 410, 180);

//body
line(400, 220, 400, 350);

//legs
line(400, 350, 425, 375);
line(400, 350, 375, 375);

//arms
line(400, 250, 425, 225);
line(400, 250, 375, 225);

println("Take me to your leader!");









