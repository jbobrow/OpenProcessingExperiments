
char letter;
String words = "";
float bendAmount = 60;



void setup() {
size(640, 640);
fill(0, 150, 255, 100);
noStroke();
frameRate(20);
}

void draw() {


if (keyPressed) {
if (key == ' ') {

fill(random(255));
rect(0,320,320,320);

fill(random(255));
rect(320,0,320,320);
fill(random(255));
rect(320,320,320,320);

fill(random(255));
rect(0,0,320,320);
}
} else {
background(0);
}



for (int i = 0; i < 360; i++) {
float x = width/2+sin(radians(i)) * 150;
float y = height/2+cos(radians(i)) * 150;


float d = map(dist(mouseX, mouseY, x, y), -150, 150, -bendAmount/2+3, bendAmount/2);


if (keyPressed) {
if (key == ' ') {
fill(random(255));
pushMatrix();
translate(x, y);
float angle = atan2(mouseX-x, mouseY-y);
rotate(radians(90)-angle); 
ellipse(-bendAmount, 0, d, d);
popMatrix();
fill(random(255),random(255),random(255));
}
} else {
fill(random(255),random(255),random(255));
pushMatrix();
translate(x, y);
float angle = atan2(mouseX-x, mouseY-y);
rotate(radians(90)-angle); 
ellipse(-bendAmount, 0, d, d);
popMatrix();
fill(random(255),random(255),random(255));
}


if (keyPressed) {
if (key == ' ') {
fill(random(255));
textAlign(CENTER, CENTER);
textSize(100);
text(letter, 320, 320);
}
} else {
fill(random(255),random(255),random(255));
textAlign(CENTER, CENTER);
textSize(100);
text(letter, 320, 320);
}



}
}


void keyPressed() {
if ((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
letter = key;
println(key);
}
}


