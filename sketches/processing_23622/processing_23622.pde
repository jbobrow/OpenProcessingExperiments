
//x and Y is 100,70

float earR;
float earG;
float earB;

int x = 100;
int y = 120;
int speed = 5;
int state = 0;

void setup() {
size(200,200);
smooth();
}

void draw() {
background(0);  
ellipseMode(CENTER); 
rectMode(CENTER); 

if (state == 0) {
x = x + speed;
if (x > width-10) {
x = width-10;
state = 1;
}
} 
else if (state == 1) {
y = y + speed;
if (y > height-10) {
y = height-10;
state = 2;
}
} 
else if (state == 2) {
x = x - speed;
if (x < 0) {
x = 0;
state = 3;
}
} 
else if (state == 3) {
y = y - speed;
if (y < 0) {
y = 0;
state = 0;
}
}

//body
earR = random(255);
earG = random(255);
earB = random(255);
fill(earR,earG,earB);
stroke(0); 
ellipse(x,y+30,28,40); 

//head
earR = random(255);
earG = random(255);
earB = random(255);
fill(earR,earG,earB);
ellipse(x,y,60,60); 

//hands
fill(150); 
ellipse(x-7,y+40,8,8);
ellipse(x+8,y+40,8,8);

//nose
fill(0); 
ellipse(x,y+20,8,4); 

//eyes
fill(0); 
ellipse(x-10,y+10,8,16); 
ellipse(x+10,y+10,8,16); 
fill(255); 
noStroke();
ellipse(x-11,y+7,4,8); 
ellipse(x+9,y+7,4,8); 

//feet
earR = random(255);
earG = random(255);
earB = random(255);
fill(earR,earG,earB);
ellipse(x-13,y+52,25,15); 
ellipse(x+14,y+52,25,15);

//ears
earR = random(255);
earG = random(255);
earB = random(255);
fill(earR,earG,earB);
ellipse(x-19,y-35,16,32); 
ellipse(x+19,y-35,16,32); 
stroke(0);
fill(150);
ellipse(x-18,y-25,8,16); 
ellipse(x+18,y-25,8,16); 

println("I come in peace!");
 

}

void mousePressed() {
stroke(0);
fill(255);
rectMode(CENTER);
rect(mouseX,mouseY,50,50);
}

void keyPressed() {
background(255);
}

