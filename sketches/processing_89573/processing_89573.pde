
void setup(){ 
size (displayWidth,displayHeight); 
smooth(); 
} 

boolean sketchFullScreen() { //a fucntion for making yourcode START in present mode (Sketch>Present) 
return true; 
} 

void draw(){ 
noStroke(); 
background(0); 
//ellipse(500,900,1300,700); 
rectMode(CORNER); 
for(int yPos = 0; yPos <displayHeight; yPos += 50){ 
for(int xPos = 0; xPos < displayWidth; xPos += 50){ 
noStroke(); 
fill(random(0,255),random(0,255),random(0,255)); 
ellipse(xPos,yPos,3,3); 
quad(xPos,yPos,10,10,20,20,30,30); 
fill(0); //(232,219,68); 
strokeWeight(2); 
stroke(255); 
ellipse(0,0,300,300); 
fill(88,160,229); 
ellipse(500,900,1300,700); 
fill(34,167,39); 
ellipse(200,1000, 400,600); 
ellipse(700,900,600,400); 


} 
} 
delay(100);
