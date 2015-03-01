

void setup() {
background(255);
size(500,500);
frameRate(10);
}

void draw() {


if (keyPressed==true && key=='s') {
fill( random (255),random(155),random(153));
rect(random(220),random(200),80,80);
} 


if (keyPressed==true && key=='c') {
fill(random(255),random(255), random(23));
hue(150);
ellipse(random(300),random(300),50,50);
}

if (keyPressed==true && key=='l') {
stroke(random(255));
strokeWeight (6);
line(random(40),random(40), random(500),random(500));
}


if (keyPressed==true && key=='e') {
fill(random(125),random(255), random(53));
hue(20);
ellipse(random(400),random(500),15,60);
}

}

