
int x = 200;
int y = 200;
int speed = 1;

void setup() {

size(600, 600);
ellipseMode(CENTER);
rectMode(CENTER);
smooth();
}

void draw() {
background(25, 90, 95);
display();
move(mouseX/25);
bounce();
}

void display() {

//Head

fill(50, 80, 25);

ellipse(x, y, 80, 140);

//Eyes

fill(175, 50, 200);

ellipse(x-15, y-30, 15, 20);
ellipse(x+15, y-30, 15, 20);

//Nose

fill(0, 255, 0);
fill(0,200,30);
ellipse(x,210,12,5);
rect(x, y, 15, 15);

//Mouth

fill(190,25,0);
stroke(255);
ellipse(x, y+30, 20,20);

//Ears

fill(255, 255, 0);
rect(x-43, y, 10, 10);
rect(x+43, y, 10, 10);

}


    

//movement

void move(int speedFactor) {

x = x + speed*speedFactor;

}

void bounce() {

if (x>width || x < 5) {
if (y<height || x>0)
speed = speed * -1;
}
}

void mousePressed() {
fill(200,0,0);
}


