
void setup(){
size (500,500);
smooth();
frameRate(20);
}
 
void draw(){
noStroke();
background(0);
ellipseMode(CORNER);
for(int yPos = 0; yPos <height; yPos += 50){
for(int xPos = 0; xPos < width; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,50,50);
}
}
delay(100);
for(int yPos = 10; yPos <height; yPos += 50){
for(int xPos = 10; xPos < width; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
rect(xPos,yPos,30,30);
}
}
for(int yPos = 15; yPos <height; yPos += 50){
for(int xPos = 15; xPos < width; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,20,20);
}
}
}
