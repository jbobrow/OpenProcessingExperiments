
int thirdX = 127;
boolean toLeft = True;

void setup() {
size(400, 300);
background(0, 255, 127);
}



void draw() {

background(0, 255, 127);

ellipse(187, 100, 20, 100);

ellipse(247, 100, 100, 20);

ellipse(thirdX, 100, 100, 20);

ellipse(187, 40, 100, 20);


fill(10, 200, 67);

rect(150, 150, 75, 75);

if (thirdX == 0) {
toLeft = False;
}

if (thirdX > 127) {
toLeft = True;
}
if (!toLeft) {
thirdX = thirdX + 1;
}

if (toLeft) {
thirdX = thirdX - 1;
}


}

