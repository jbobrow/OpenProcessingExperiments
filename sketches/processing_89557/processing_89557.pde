
void setup(){
size (500,500);
smooth();
}

boolean sketchFullScreen() { //a fucntion for making yourcode START in present mode (Sketch>Present)
return true;
}

void draw(){
noStroke();
background(0);
rectMode(CORNER);
for(int yPos = 0; yPos <500; yPos += 50){
for(int xPos = 0; xPos < 500; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
rect(xPos,yPos,50,50);
}
}
delay(200);
}
