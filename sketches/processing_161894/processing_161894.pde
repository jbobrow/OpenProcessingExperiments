
//Prufrock's Ragged Claws, Assignment Two
//by Elan Kesilman-Potter
color seaBlue = #2B0E7C;
color[] palette = {#FFFFFF, #000000, #B5B776, #F5412C, #F5A82C, #AAAAAA};
color[] bubbles = {#09085D, #7E7DD8, #525281, #1B5ABC, #297BFC};
void setup(){
  size(1000, 800);
  background(seaBlue);
}

void draw() {
PFont palatino = loadFont("palatino.vlw");
textFont(palatino);
fill(palette [0]);
textSize(36);
textAlign(CENTER);
text("'I should have been a pair of ragged claws", width/2, height/10);
text("scuttling across the floors of silent seas.'", width/2, height/6.5);

//Ocean floor
stroke(palette [2]);
fill(palette [2]);
rect(0, 600, 1000, 200);

//Hermit crab
stroke(palette [1]);
strokeWeight(2);
line(750, 600, 750, 640);
line(775, 600, 775, 630);
stroke(palette [3]);
fill(palette [3]);
triangle(800, 600, 1000, 700, 800, 700);
arc(725, 680, 40, 60, PI/2, 3*PI/2);
arc(750, 695, 40, 60, PI/2, 3*PI/2);
arc(775, 710, 40, 60, PI/2, 3*PI/2);
arc(800, 725, 40, 60, PI/2, 3*PI/2);
stroke(palette [4]);
fill(palette [4]);
triangle(800, 625, 800, 700, 725, 650);
stroke(palette [0]);
strokeWeight(5);
fill(palette [1]);
ellipse(750, 600, 10, 10);
ellipse(775, 600, 10, 10);

//Regular crab
stroke(palette [1]);
strokeWeight(2);
line(225, 500, 225, 525);
line(275, 500, 275, 525);
stroke(palette [0]);
strokeWeight(5);
fill(palette [1]);
ellipse(225, 500, 15, 15);
ellipse(275, 500, 15, 15);
stroke(palette [3]);
strokeWeight(1);
fill(palette [3]);
rect(175, 525, 150, 100);
stroke(palette [4]);
strokeWeight(1);
fill(palette [4]);
rect(200, 575, 100, 50);
stroke(palette [3]);
strokeWeight(1);
fill(palette [3]);
ellipse(175, 650, 75, 75);
ellipse(325, 650, 75, 75);
strokeWeight(5);
line(75, 575, 175, 575);
line(325, 575, 425, 575);
line(75, 575, 75, 625);
line(425, 575, 425, 625);
line(100, 600, 175, 600);
line(325, 600, 400, 600);
line(100, 600, 100, 625);
line(400, 600, 400, 625);
stroke(palette [2]);
strokeWeight(1);
fill(palette [2]);
triangle(175, 650, 200, 725, 150, 725);
triangle(325, 650, 350, 725, 300, 725);

//Shark
stroke(palette [5]);
fill(palette [5]);
triangle(550, 350, 700, 300, 700, 400);
triangle(700, 300, 700, 400, 900, 350);
triangle(650, 375, 725, 375, 675, 450);
triangle(850, 350, 900, 350, 950, 275);
triangle(850, 350, 900, 350, 925, 400);
triangle(650, 325, 750, 250, 775, 330);
stroke(palette [1]);
line(675, 350, 650, 375);
line(700, 350, 675, 375);
line(725, 350, 700, 375);
stroke(palette [0]);
strokeWeight(3);
fill(palette [1]);
ellipse(600, 350, 10, 10);

//Bubbles
noFill();
strokeWeight(random (5));
stroke(bubbles [0]);
ellipse(random (1000), random (800), 50, 50);
strokeWeight(random (5));
stroke(bubbles [1]);
ellipse(random (1000), random (800), 50, 50);
strokeWeight(random (5));
stroke(bubbles [2]);
ellipse(random (1000), random (800), 50, 50);
strokeWeight(random (5));
stroke(bubbles [3]);
ellipse(random (1000), random (800), 50, 50);
strokeWeight(random (5));
stroke(bubbles [4]);
ellipse(random (1000), random (800), 50, 50);
strokeWeight(random (5));
ellipse(random (1000), random (800), 50, 50);
}










