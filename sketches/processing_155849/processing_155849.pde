
/*
Day01_Assignment_By_Kiyo
*/
void setup(){
size(800, 600);

frameRate(30);
}

void draw() {
  background(255);

//Face part
fill(175, 203, 216);
strokeWeight(3);
rectMode(CENTER);
rect(mouseX, mouseY, 300, 250);

//Mouth part
fill(255, 157, 28);
rect(mouseX, mouseY + 50, 150, 50);

//Ears part
fill(175, 203, 216);
rect(mouseX - 175, mouseY, 50, 70);
rect(mouseX + 175, mouseY, 50, 70);

//Signal part
stroke(0);
line(mouseX, mouseY - 180, mouseX, mouseY - 125);
}

void keyPressed() {
//Eyes part
fill(255, 69, 36);
ellipse(mouseX - 80, mouseY - 50, 70, 70);
ellipse(mouseX + 80, mouseY - 50, 70, 70);
}

void mousePressed() {
//Eyes part
fill(255, 69, 36);
ellipse(mouseX - 80, mouseY - 50, 70, 70);
ellipse(mouseX + 80, mouseY - 50, 70, 70);
}






