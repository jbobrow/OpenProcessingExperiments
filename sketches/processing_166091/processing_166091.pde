
float rX = 50.0; // X-coordinate
float rY = 50.0; // Y-coordinate
float rRadius = 15.0; // Radius of the circle
float rSpeedX = 7.0; // Speed of motion on the x-axis
float rSpeedY = 1.7; // Speed of motion on the y-axis
int rDirectionX = 1; // Direction of motion on the x-axis
int rDirectionY = -1; // Direction of motion on the y-axis

float bX = 20.0; // X-coordinate
float bY = 20.0; // Y-coordinate
float bRadius = 15.0; // Radius of the circle
float bSpeedX = 2.0; // Speed of motion on the x-axis
float bSpeedY = 2.4;
int bDirectionX = 1; // Direction of motion on the x-axis
int bDirectionY = -1; // Direction of motion on the y-axis


void setup() {
size(400, 400);
noStroke();
ellipseMode(RADIUS);
}
void draw() {
fill(0, 12);
rect(0, 0, width, height); //background for trail

fill(240,90,70); //red ball
ellipse(rX, rY, rRadius, rRadius);
rX += rSpeedX * rDirectionX;
if ((rX > width-rRadius) || (rX < rRadius)) {
rDirectionX = -rDirectionX; // Change direction
}
rY += rSpeedY * rDirectionY;
if ((rY > height-rRadius) || (rY < rRadius)) {
rDirectionY = -rDirectionY; // Change direction
}

fill(70,170,240); //blue ball
ellipse(bX, bY, bRadius, bRadius);
bX += bSpeedX * bDirectionX;
if ((bX > width-bRadius) || (bX < bRadius)) {
bDirectionX = -bDirectionX; // Change direction
}
bY += bSpeedY * bDirectionY;
if ((bY > height-bRadius) || (bY < bRadius)) {
bDirectionY = -bDirectionY; // Change direction
}

}


