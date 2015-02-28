
float x = 100, y = 100;
float xSpeed = random(2,4);
float ySpeed = random(2,4);
float PlayerScore = 0;
PImage img;

void setup() {

size(300, 300);
noStroke();
noCursor();
img = loadImage("up.jpg");
}
void draw() {
background(0);
image(img, 0, 0, 300, 300); 
fill(255);
ellipse(x, y, 10, 10);
rect(mouseX-30, height-40, 60, 10);
text("PlayerScore : " +PlayerScore, 20, 20, 50);
textAlign(LEFT);
textSize(12);


x = x + xSpeed;
y = y + ySpeed;

if (x > width-5 || x < 5) {
xSpeed = -xSpeed;
}
if (y > height-5 || y < 5) {
ySpeed = -ySpeed;
}
if (y > height-30 && x > (mouseX-30) && x < (mouseX+30) ) {
ySpeed = -ySpeed; 
if (y > height-30 && x > (mouseX-30) && x < (mouseX+30) )
PlayerScore = PlayerScore + 10;
}

}

