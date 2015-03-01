
//circlegrow3
//circleSizeX = circleSizeX + dist(pmouseX,pmouseY,mouseX,mouseY)/10;

float circleSizeX = 0;
 
 
 
void setup () {
size (200,200);
}


void draw () { 
  background (255);
stroke (0);
fill (175);
ellipse (mouseX, mouseY, circleSizeX, circleSizeX);
circleSizeX = circleSizeX + dist(pmouseX,pmouseY,mouseX,mouseY)/10;
}




