
//tracy's make the circle grow with movement of mouse
int circleSizeX = 0;
int circleY = circleSizeX;



void setup () {
size (200,200);
}

void draw () {
background (255);
stroke (0);
fill (175);
ellipse (mouseX, mouseY, circleSizeX, circleY);
circleSizeX = circleSizeX+abs(mouseX-pmouseX)/10;
circleY = circleSizeX;
}


