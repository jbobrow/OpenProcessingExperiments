

void setup() { 
size(500,400); 
smooth(); 
background(255); 
frameRate(30); 
} 
void draw(){ 
stroke(mouseX,0,mouseY); 
float distance=dist(pmouseX,pmouseY,mouseX,mouseY); 
float maxStroke=15; 
strokeWeight(maxStroke-constrain(distance,0,maxStroke)); 
line(pmouseX,pmouseY,mouseX,mouseY); 
} 
void mouseClicked(){ 
rectMode(CENTER); 
fill(mouseY,400,mouseX); 
noStroke(); 
triangle(mouseX,mouseY,30,30,40,50); 
} 
void keyPressed(){ 
background(0); 
}
                
