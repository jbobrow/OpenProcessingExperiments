
//Zombie eyes solution 
//change these values to suit the position you want for the eyes
int leftEyeX = 270;
int leftEyeY = 225;
int rightEyeX = 400;
int rightEyeY = 225;


void setup() {
size(640, 340);
noStroke();
smooth();
}

void draw() {
background(60);
stroke(#E0B48A);
fill(#FFD3AA);
strokeWeight(9);
ellipse(180,180,100,100);
ellipse(480,180,100,100);
noStroke();
fill(#905014);
strokeWeight(3);
triangle(336,50,356,78,316,78);
triangle(326,60,306,78,316,78);
triangle(346,60,366,78,356,78);
fill(#AF7C13);
ellipse(332,180,300,210);
fill(#E0B48A);
triangle(326,230,280,170,250,200);
triangle(346,230,390,170,420,200);

fill(255);
ellipse(leftEyeX, leftEyeY, 80, 60); //left eye
ellipse(rightEyeX, rightEyeY, 80, 60); //right eye
stroke(#FFEEDE);
fill(#FFD3AA);
ellipse(336,250,70,70);
noStroke();
fill(0);
ellipse(320,230,10,10);
ellipse(352,230,10,10);
fill(255);
ellipse(336,260,50,50);
fill(255,0,  0);//red pupil
stroke(0);
strokeWeight(3);
line(311,260,361,260);
strokeWeight(1);
line(336,235,336,285);
line(316,245,316,275);
line(356,245,356,275);
noStroke();
float pupilLeftX = map(mouseX, 0, width, leftEyeX-15, leftEyeX+15);///adjust the added value to suit
float pupilLeftY = map(mouseY, 0, height, leftEyeY-5, leftEyeY+5);
float pupilRightX = map(mouseX, 0, width, rightEyeX-15, rightEyeX+15);
float pupilRightY = map(mouseY, 0, height, rightEyeY-5, rightEyeY+5);

ellipse(pupilLeftX, pupilLeftY, 30, 50); //left pupil
ellipse(pupilRightX, pupilRightY, 30, 50); //right pupil

}

