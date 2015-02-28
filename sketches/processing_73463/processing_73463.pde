
//Zombie eyes solution 
//change these values to suit the position you want for the eyes
int leftEyeX = 270;
int leftEyeY = 225;
int rightEyeX = 400;
int rightEyeY = 225;


void setup() {
size(640, 480);
smooth();
}

void draw() {
background(0, 38, 145); // blue background color
strokeWeight(5);

fill(170, 150, 114);// face colour
quad(500, 55, 180, 55, 200, 350, 480, 350); //head
rect(200, 415, 280, 60); //jaw

fill(200, 200, 200); //teeth colour
// upper teeth
quad(200, 350, 250, 350, 240, 380, 210, 380);
quad(250, 350, 300, 350, 290, 380, 260, 380);
quad(300, 350, 350, 350, 340, 380, 310, 380);
quad(350, 350, 400, 350, 390, 380, 360, 380);
quad(400, 350, 450, 350, 440, 380, 410, 380);
quad(450, 350, 480, 350, 490, 380, 460, 380);

// lower teeth
quad(200, 415, 230, 415, 220, 390, 190, 390);
quad(230, 415, 280, 415, 270, 390, 240, 390);
quad(280, 415, 330, 415, 320, 390, 290, 390);
quad(330, 415, 380, 415, 370, 390, 340, 390);
quad(380, 415, 430, 415, 420, 390, 390, 390);
quad(430, 415, 480, 415, 470, 390, 440, 390);

noStroke();
fill(255, 66, 0); // blood colour
triangle(490, 390,480, 415,500, 415);
ellipse(490, 415, 20, 20);

stroke(0);
strokeWeight(5);
fill(255);
ellipse(leftEyeX, leftEyeY, 80, 80); //left eye
ellipse(rightEyeX, rightEyeY, 80, 80); //right eye

fill(0, 255, 0);//green pupil

float pupilLeftX = map(mouseX, 0, width, leftEyeX-25, leftEyeX+25);///adjust the added value to suit
float pupilLeftY = map(mouseY, 0, height, leftEyeY-25, leftEyeY+20);
float pupilRightX = map(mouseX, 0, width, rightEyeX-25, rightEyeX+25);
float pupilRightY = map(mouseY, 0, height, rightEyeY-25, rightEyeY+20);

ellipse(pupilLeftX, pupilLeftY, 20, 20); //left pupil
ellipse(pupilRightX, pupilRightY, 20, 20); //right pupil

}

