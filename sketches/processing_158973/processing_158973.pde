
float circRad; 
void setup(){ 
size(600,600); 
} 
void draw(){ 
background(255-mouseY/2,255-mouseY/2,255);
circRad = dist(width/2,height/2,mouseX,mouseY); 
fill(150,0,150); 
ellipse(width/2,height/2,circRad*2,circRad*2);
} 
