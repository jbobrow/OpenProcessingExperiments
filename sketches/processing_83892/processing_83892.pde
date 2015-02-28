
int blocksize;

void setup() {

size(600,400);

blocksize = 10;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,104),random(0,108), random(533), 50);
noStroke();
ellipse(x,y,80,80);

}

}

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);
{
strokeWeight(5);
fill (116,75,0);
quad(specialX+50,200,specialX+200,200,specialX+250,130,specialX,130);
fill (238,226,203);
triangle(specialX+20,65,specialX+100,110,specialX+100,35);
fill (116,75,0);
rect(specialX+100,30,10,100);
stroke(0);
fill(0,142,22);
ellipse(300,350,1400,150);
fill(108,66,3);
rect(150,150,20,190);
fill(36,96,42);
ellipse(160,190,120,100);
fill(108,66,3);
rect(300,190,20,190);
fill(36,96,42);
ellipse(310,220,120,100);
fill(108,66,3);
rect(400,220,20,190);
fill(36,96,42);
ellipse(410,240,120,100);
fill(36,96,42);
ellipse(560,420,120,100);
}

}

