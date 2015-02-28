
void setup(){
size(250, 250);
background(250,200,160);
 
}
 
 
 
void draw(){
stroke(255, random(200), random(200));
ellipse(0, 0, mouseX, mouseY);
ellipse(0, 250, mouseX, mouseY);
ellipse(250, 0, mouseX, mouseY);
ellipse(250,250, mouseX, mouseY);
//SPLIT USING MOUSE
 
}

