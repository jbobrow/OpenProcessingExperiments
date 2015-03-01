
void setup () {
size(400,400);
}

void draw () {
frameRate(5);
int randomX = random(0, 400);
int randomY = random(0, 400);
int randomSize = random(20, 200);
background(randomX, randomY, randomSize);
fill(randomY, randomSize, randomX);
ellipse(randomX, randomY, randomSize, randomSize);
fill(randomSize, randomY, randomX);
rect(randomSize, randomY, randomSize, randomX);
fill(randomY, randomX ,randomSize);
triangle(randomSize, randomY, randomSize, randomX, randomX, randomY);
}
