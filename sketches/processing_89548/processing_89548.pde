
void setup(){ 
size (1000,1000); 
smooth(); 
} 

boolean sketchFullScreen() { //a fucntion for making yourcode START in present mode (Sketch>Present) 
return true; 
} 

void draw(){ 
noStroke(); 
background(0); 
rectMode(CORNER); 
for(int yPos = 25; yPos <1000; yPos += 100){ 
for(int xPos = 25; xPos < 1000; xPos += 100){ 
fill(random(0,255),random(0,255),random(0,255)); 
rect(xPos,yPos,50,50); 
} 
} 
delay(200); 
}
