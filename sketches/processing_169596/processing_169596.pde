

void setup() {
background(255);
size(500,500);
frameRate(10);
}

void draw() {


if (keyPressed==true && key=='s') {
fill( random (255),random(255),random(153));
rect(random(250),random(200),80,80);
} 


if (keyPressed==true && key=='c') {
fill(random(255),random(255), random(33));
hue(50);
ellipse(random(400),random(400),50,50);
}

if (keyPressed==true && key=='l') {
stroke(random(255));
strokeWeight (3);
line(random(100),random(100), random(500),random(500));
}


if (keyPressed==true && key=='e') {
fill(random(205),random(255), random(53));

ellipse(random(300),random(300),20,70);
}

}

