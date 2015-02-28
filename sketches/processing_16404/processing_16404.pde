


void setup(){
size(600,600);
background(175); 
smooth();
}

void draw(){   
noStroke();
fill(random(0,255),random(0,255),random(0,255),50);
rectMode(CENTER);
rect(mouseX,mouseY,random(50,150), random(50,150));
}


