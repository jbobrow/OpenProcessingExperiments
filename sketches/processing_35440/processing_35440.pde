
void setup(){
size(400,400);
smooth();
background(0);
frameRate(40); 
fill(28,188,184); 
stroke(80,203,110); 
strokeWeight(50); 
}
void draw() {
background(0);
stroke(mouseX, 40 , mouseY); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 20;
strokeWeight(maxStroke - constrain(distance, 8, maxStroke));

ellipse(mouseX, mouseY,180,180);
ellipse(mouseX, mouseY,160,160);

ellipse(mouseX, mouseY,110,110);
ellipse(mouseX, mouseY,90,90);
ellipse(mouseX, mouseY,70,70);

ellipse(mouseX, mouseY,20,20);
}
        
