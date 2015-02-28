
void setup(){
size (displayWidth,displayHeight);
smooth();
}
void draw(){
noStroke();
background(0);
rect(100,100,100,100);
for(int yPos = 0; yPos <displayHeight; yPos += 50){
for(int xPos = 0; xPos < displayWidth; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
rect(xPos,yPos,50,50);
}
}
delay(200);
}
