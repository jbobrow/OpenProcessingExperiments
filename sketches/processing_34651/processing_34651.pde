
void setup(){
size(400,400);
smooth();
background(78);
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
frameRate(88);
}
void draw(){
stroke(mouseX, 20 , mouseY); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 50;
strokeWeight(maxStroke - constrain(distance, 8, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}
                
                
