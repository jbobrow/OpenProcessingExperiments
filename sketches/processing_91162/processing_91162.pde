
void setup(){
size (600,600);
smooth();
}

boolean sketchFullScreen() { //a fucntion for making yourcode START in present mode (Sketch>Present)
return true;
}

void draw(){
stroke(10);
background(40,191,21);
ellipseMode(CORNER);
for(int yPos = 0; yPos <600; yPos += 50){
for(int xPos = 0; xPos < 600; xPos += 50){
fill(random(0,255),random(0,255),random(0,255));
ellipse(xPos,yPos,50,50);
}
}
delay(200);
}
