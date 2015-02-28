

void setup(){
  smooth();
size(400,400);
}
void draw() {
//Document background
background(0);
//body
fill(mouseX,mouseY,0);
stroke(255);
strokeWeight(4);
quad(mouseX-60,mouseY-22, mouseX+60, mouseY-22, mouseX+80, mouseY+22, mouseX-80,mouseY+22);
rectMode(CENTER);
fill(255,255,255);
stroke(255);
strokeWeight(4);
rect(200,280, 120, 20);
noFill();
//Center Eye
line(200,255, 200, 200);
ellipse(200,160, 80, 80);
fill(0,0);
ellipse(200, 160, 40, 40);
fill(0);
ellipse(200, 160, 20, 20);
//Left eye
line(140,255, 120, 210);
fill(mouseY,mouseX,0);
ellipse(mouseX-80, mouseY-80, 60, 60);
fill(mouseX,mouseY,0);
ellipse(mouseX-80, mouseY-80, 40, 40);
fill(mouseY,mouseX,0);
ellipse(mouseX-80, mouseY-80, 20, 20);
//Right Eye
line(260, 255, 280,210);
ellipse(mouseX+80, mouseY-80, 60, 60);
fill(mouseX,mouseY,0);
ellipse(mouseX+80, mouseY-80, 40, 40);
fill(mouseX,mouseY,0);
ellipse(mouseX+80, mouseY-80, 20, 20);
//Left Leg
line(180, 300, 180, 340);
stroke(0,180,0);
line(180,340, 165,350);
line(180,340, 180,360);
line(180,340, 195,350);
//Right Leg
stroke(255);
line(220, 300, 220, 340);
stroke(0,180,0);
line(220,340, 235,350);
line(220,340, 220,360);
line(220,340, 205,350);
//Tongue
fill(200,0,0);
noStroke();
ellipse(200, 295, 25, 45);
//Antenna
stroke(255,150);
line(200,120, 180,80);
line(200,120, 220,80);
}

