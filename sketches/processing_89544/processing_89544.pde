
void setup(){ 
size(480,210); 
smooth(); 
} 

void draw(){ 
//background(255,10); 
if (mousePressed){ //change the color when i click the mouse 
ellipse(mouseX,mouseY,30,30); 
fill(random(0,255),random(0,255),random(0,255),120); 
} 

}
