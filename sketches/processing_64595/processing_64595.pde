
float StartX = 0;
float StartY = 0;
float EndX = 0;
float EndY = 0;

void setup() {
size(250,250);
}

void draw() {
stroke(0,0,0);
line(StartX,StartY,EndX,EndY);
StartX = random(0,250);
StartY = random(0,250);
EndX = random(0,250);
EndY = random(0,250);
}

