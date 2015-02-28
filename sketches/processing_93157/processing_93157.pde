
// this is in void setup \\
import netscape.javascript.*;

float zoogx;
float zoogy;

void setup() {
size(1000, 800);
zoogx = width/2;
zoogy = height + 100;
smooth();
}

void draw() {
background(255);
ellipseMode(CENTER);

fill(150);
stroke(0, 20);
rect(zoogx, zoogy, 100, 205);

// head
fill(#9BB49B);
stroke(0, 20);
ellipse(zoogx+50, zoogy-50, 170, 150);

// ornament
fill(#D69F7F, 100);
noStroke();
ellipse(zoogx+50, zoogy-100, 70, 25);


// eyes
fill(0);
stroke(0);
ellipse(zoogx-5, zoogy-40, 40, 70);

fill(255);
ellipse(zoogx-13, zoogy-53, 13, 12);

fill(0);
ellipse(zoogx+105, zoogy-40, 40, 70);

fill(255);
ellipse(zoogx+97, zoogy-53, 13, 12);

// legs
strokeWeight(4);
stroke(50);
line(zoogx, zoogy+205, zoogx-20, zoogy+230);
line(zoogx+100, zoogy+205, zoogx+120, zoogy+230);

zoogy = zoogy - 1;

}


