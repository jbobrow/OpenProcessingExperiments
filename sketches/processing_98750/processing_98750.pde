
float a = 255;
float b = 255;
float c = 255;
float d = 255;

void setup() {
size(200, 200);
}

void draw() {
background(0);
stroke(255);
line(0, width/2, height, width/2);
line(width/2, 0, width/2, height);

// top left rectangle
if (mouseX < 100 && mouseY < 100) {
fill(a);
rect(0, 0, 100, 100);
a = 255;
} else if (mouseX > 0 && mouseY > 0) {
fill(a = a - 1);
rect(0, 0, 100, 100);
}

//top right rectangle
if(mouseX > 100 && mouseY < 100) {
fill(b);
rect(100, 0, 100, 100);
b = 255;
} else if (mouseX < 200 && mouseY > 0) {
fill(b = b - 1);
rect(100, 0, 100, 100);
}

// bottom left
if (mouseX < 100 && mouseY > 100) {
fill(c);
rect(0, 100, 100, 100);
c = 255;
} else if (mouseX < 200 && mouseY < 200) {
fill(c = c - 1);
rect(0, 100, 100, 100);
}

// bottom right
if (mouseX > 100 && mouseY > 100) {
fill(d);
rect(100, 100, 100, 100);
d = 255;
} else if (mouseX > 0 && mouseY > 0) {
fill(d = d - 1);
rect(100, 100, 100, 100);
}
}


