
void setup(){
size (400,400);
smooth();
}

void draw(){
noStroke();
background(0);
ellipseMode(CORNER);
for(int yPos = 0; yPos <displayHeight; yPos += 50){
for(int xPos = 0; xPos < displayWidth; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,50,50);
}
}
delay(200);
}
