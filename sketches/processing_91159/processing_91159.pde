
int yPos = 50; 

void setup(){ 
size (400,400); 
smooth(); 
} 

boolean sketchFullScreen() { //a fucntion for making yourcode START in present mode (Sketch>Present) 
return true; 
} 

void draw() { 
yPos = mouseY; 

stroke(100,8,3); 
background(10); 
ellipseMode(CORNER); 
for(int yPos = 0; yPos <displayHeight; yPos += 50){ 
for(int xPos = 0; xPos < displayWidth; xPos += 50){ 
fill(random(0,255),random(0,255),random(0,255)); 
if (mousePressed) { 
rect(xPos,yPos,90,90); 
} else { 
rect(xPos,yPos,10,10); 
} 
} 
} 
delay(100); 
}
