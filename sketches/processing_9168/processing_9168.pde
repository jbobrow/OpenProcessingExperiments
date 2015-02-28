
int CE;
int LE;
int RE;
int colour= 125;

void setup(){
  smooth();
size(400,400);
}
void draw() {
//Document background
background(0,0,colour);
if (mouseY>200){
colour = colour - 10;
} else if (mouseY < 200) {
 colour = colour + 10; 
}
//body
int BODY = int (random(250,290));
fill(mouseX,mouseY,0);
stroke(255);
strokeWeight(4);
quad(mouseX-60,BODY-22, mouseX+60, BODY-22, mouseX+80, BODY+22, mouseX-80,BODY+22);
rectMode(CENTER);
fill(255,255,255);
stroke(255);
strokeWeight(4);
rect(mouseX,BODY, 120, 20);
noFill();
//Center Eye
mouseY = constrain (mouseY, 0, 250);
line(mouseX,BODY-22, mouseX, mouseY-80);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-80, 80, 80);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-80, 40, 40);
fill(int(random(1,255)));
ellipse(mouseX, mouseY-80, 20, 20);
//Left eye
frameRate(6);
int LE = int (random(60,120));
line(mouseX-40,BODY-22, LE, 70);
fill(mouseY,mouseX,0);
ellipse(LE, 70, 60, 60);
fill(mouseX,mouseY,0);
ellipse(LE,70, 40, 40);
fill(mouseY,mouseX,0);
ellipse(LE, 70, 20, 20);
//Right Eye
int RE = int (random(280,360));
line(mouseX+40,BODY-22, RE, 70);
ellipse(RE, 70, 60, 60);
fill(mouseX,mouseY,0);
ellipse(RE,70, 40, 40);
fill(mouseX,mouseY,0);
ellipse(RE, 70, 20, 20);
//Left Leg
line(mouseX, BODY, 180, 340);
stroke(0,180,0);
line(180,340, 165,350);
line(180,340, 180,360);
line(180,340, 195,350);
//Right Leg
stroke(255);
line(mouseX, BODY, 220, 340);
stroke(0,180,0);
line(220,340, 235,350);
line(220,340, 220,360);
line(220,340, 205,350);
//Tongue
fill(200,0,0);
noStroke();
ellipse(mouseX, BODY+10, 25, 45);
//Antenna
int ANTL = int (random(170,190));
int ANTR = int (random(210,230));
stroke(255,150);
line(mouseX,mouseY-123, ANTL,mouseY-160);
line(mouseX,mouseY-123, ANTR,mouseY-160);
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

