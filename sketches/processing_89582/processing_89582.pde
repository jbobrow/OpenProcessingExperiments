
void setup(){
size (400,400);
smooth();

}


void draw(){
background(100,255,200);
ellipseMode(CORNER);
for(int yPos = 0; yPos <400; yPos += 30){
for(int xPos = 0; xPos < 400; xPos += 30){
fill(random(0,255),random(0,255),random(0,255));
strokeWeight (5);
stroke(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,25,25);
}
}
rectMode(CORNER);
for(int yPos = 0; yPos <800; yPos += 30){
for(int xPos = 0; xPos < 800; xPos += 30){
fill(random(0,255),random(0,255),random(0,255));
stroke(random(0,255),random(0,255),random(0,255));
rect (xPos,yPos,15,15);
}
}
delay(100);
}
