

void setup (){
size(300,300);
background(0,150,250);
noStroke();
frameRate(5);
}
void draw() {


noFill();
ellipse(mouseX, mouseY,40,40);
stroke(mouseX,93 , mouseY);
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
float maxStroke = 30;
strokeWeight(maxStroke - constrain(distance, 20, maxStroke));
ellipse(pmouseX, pmouseY, mouseX, mouseY);

 
}

