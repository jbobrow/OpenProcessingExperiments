
float r = 100;
float g = 150;
float b = 200;
float a = 150;

float diam = 500;
float x = 250;
float y = 250;

float eyes = 100;



void setup() {
size(500, 500);
background(255);
frameRate(24);
smooth();
}

void draw() {
background(0);
stroke(0);
fill(r, g, b, a);
ellipse(x, y, diam, diam);
x = int(random(250, 250));
y = int(random(250, 250));
r = int(random(0, 255));
g = int(random(0, 255));
b = int(random(0, 255));
diam = int(random(2, 500));
stroke(255);
rectMode(CENTER);
//Body
fill(242, 188, 207);
noStroke();
rect(mouseX, mouseY, 100, 200);
//Head
fill(255);
noStroke();
ellipse(mouseX, mouseY-150, 200, 200);
//Mouth
fill(0);
noStroke();
ellipse(mouseX, mouseY-100, 20, 10);
//Eyes
fill(0);
noStroke();
ellipse(mouseX-70, mouseY-155, 50, eyes);
ellipse(mouseX+70, mouseY-145, 50, eyes);
//Legs
stroke(255);
strokeWeight(2);
line(mouseX-50, mouseY+100, mouseX-75, mouseY+150);
line(mouseX+50, mouseY+100, mouseX+75, mouseY+150); 
//Arms
line(mouseX-50, mouseY, mouseX-75, mouseY+50);
line(mouseX+50, mouseY, mouseX+75, mouseY+50);

}

void mousePressed() {
eyes = int(random(0, 100));
}


