

//Zombie eyes solution 
//change these values to suit the position you want for the eyes

int leftEyeX = 270;
int leftEyeY = 240;
int rightEyeX = 400;
int rightEyeY = 225;


void setup() {
size(700, 700);
noStroke();
smooth();
}

void draw() {
background(50);

fill(21, 152, 22);
ellipse(330, 300, 300, 400);

fill(255);
ellipse(leftEyeX, leftEyeY, 80, 80); //left eye
ellipse(rightEyeX, rightEyeY, 90, 90); //right eye

fill(188, 0, 0);//red pupil

float pupilLeftX = map(mouseX, 0, width, leftEyeX-25, leftEyeX+25);///adjust the added value to suit
float pupilLeftY = map(mouseY, 0, height, leftEyeY-25, leftEyeY+20);
float pupilRightX = map(mouseX, 0, width, rightEyeX-25, rightEyeX+25);
float pupilRightY = map(mouseY, 0, height, rightEyeY-25, rightEyeY+20);

ellipse(pupilLeftX, pupilLeftY, 20, 20); //left pupil
ellipse(pupilRightX, pupilRightY, 20, 20); //right pupil
rect(250, 440, 200, 50);
fill(21, 152, 22);
rect(230, 200, 80, 20);
ellipse(250, 450, 150, 150);
ellipse(420, 450, 150, 150);
fill(255, 255, 255);
triangle(340, 440, 350, 440, 345, 460);
triangle(320, 440, 330, 440, 325, 460);
triangle(300, 490, 320, 490, 320, 460);
triangle(350, 490, 370, 490, 350, 460);
}

