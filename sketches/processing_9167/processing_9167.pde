
int CE;
int LE;
int RE;

void setup(){
  smooth();
size(400,400);
}
void draw() {
//Document background
background(mouseX,0,mouseY);
//body  
fill(mouseX,mouseY,0);
stroke(255);
strokeWeight(4);
quad(mouseX-60,mouseY-22, mouseX+60, mouseY-22, mouseX+80, mouseY+22, mouseX-80,mouseY+22);
rectMode(CENTER);
fill(255,255,255);
stroke(255);
strokeWeight(4);
rect(mouseX,mouseY, 120, 20);
noFill();
//Center Eye
line(mouseX,mouseY-22, mouseX, mouseY-80);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-120, 80, 80);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-120, 40, 40);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-120, 20, 20);
//Left eye
line(mouseX-40,mouseY-22, mouseX-80, mouseY-80);
fill(mouseY,mouseX,0);
ellipse(mouseX-80, mouseY-80, 60, 60);
fill(mouseX,mouseY,0);
ellipse(mouseX-80, mouseY-80, 40, 40);
fill(mouseY,mouseX,0);
ellipse(mouseX-80, mouseY-80, 20, 20);
//Right Eye
line(mouseX+40,mouseY-22, mouseX+80, mouseY-80);
ellipse(mouseX+80, mouseY-80, 60, 60);
fill(mouseX,mouseY,0);
ellipse(mouseX+80, mouseY-80, 40, 40);
fill(mouseX,mouseY,0);
ellipse(mouseX+80, mouseY-80, 20, 20);
//Left Leg
line(mouseX, mouseY, 180, 340);
stroke(0,180,0);
line(180,340, 165,350);
line(180,340, 180,360);
line(180,340, 195,350);
//Right Leg
stroke(255);
line(mouseX, mouseY, 220, 340);
stroke(0,180,0);
line(220,340, 235,350);
line(220,340, 220,360);
line(220,340, 205,350);
//Tongue
fill(200,0,0);
noStroke();
ellipse(mouseX, mouseY+10, 25, 45);
//Antenna
stroke(255,150);
line(mouseX,mouseY-163, 180,80);
line(mouseX,mouseY-163, 220,80);
}

void mousePressed() {
  noLoop();
    fill(mouseX,0,mouseY);
  ellipse(mouseX, mouseY,40,40);
  fill(mouseX,0,mouseY);
  ellipse(mouseX-5,mouseY,15,15);
  ellipse(mouseX+5,mouseY,15,15);
}

void keyPressed(){
loop();
background(mouseX,mouseY,0);
}

