
void setup(){
size (400,400);
smooth();
}

int xPos = 0;
int yPos = 0;

void draw(){
noStroke();
background(0);
ellipseMode(CORNER);
for(int yPos = 0; yPos <displayHeight; yPos += 50){
for(int xPos = 0; xPos < displayWidth; xPos += 50){
ellipse(xPos,yPos, 50,50);
fill(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,10,40);
rect(xPos,yPos,10,30);
ellipse(xPos,yPos,70,20);
ellipse(xPos,yPos,40,40);
}
}
delay(100);
}
