
//Zombie eyes solution 
//change these values to suit the position you want for the eyes
int leftEyeX = 270;
int leftEyeY = 225;
int rightEyeX = 400;
int rightEyeY = 225;

void setup() {
size(640, 480);
noStroke();
smooth();
}

void draw() {
background(50);
fill(31,131,75);
rect(20,30,600,450);
fill(0,0,0);
rect(270,300,125,40);
rect(220,340,225,80);
rect(220,420,50,70);
rect(395,420,50,70);
fill(0);
rect(220, 180, 100, 80); //left eye
rect(350, 180, 100, 80); //right eye

fill(255, 0, 0);//red pupil

float pupilLeftX = map(mouseX, 0, width, leftEyeX-25, leftEyeX+25);///adjust the added value to suit
float pupilLeftY = map(mouseY, 0, height, leftEyeY-25, leftEyeY+20);
float pupilRightX = map(mouseX, 0, width, rightEyeX-25, rightEyeX+25);
float pupilRightY = map(mouseY, 0, height, rightEyeY-25, rightEyeY+20);

ellipse(pupilLeftX, pupilLeftY, 30, 30); //left pupil
ellipse(pupilRightX, pupilRightY, 30, 30); //right pupil

}

