
float R;
float G;

void setup () {
size (500, 500);
}

void keyPressed() { background(0);
}

void draw () {
  
rectMode(CENTER);
   
R = random(255);
G = random(255);

smooth();

//face

fill (0);
beginShape();
vertex(113,185);
vertex(83, 230);
vertex(81, 240);
vertex(100, 255);
vertex(100, 265);
vertex(90, 275);
vertex(92, 290);
vertex(95, 295);
vertex(98, 300);
vertex(92, 305);
vertex(96, 315);
vertex(108, 320);
vertex(108, 330);
vertex(113, 340);
vertex(118, 350);
vertex(160, 360);
vertex(170, 360);
vertex(180, 357);
vertex(200, 355);
vertex(220, 350);
vertex(230, 340);
vertex(240, 325);
vertex(245, 315);
vertex(250, 300);
vertex(252, 280);
vertex(253, 250);
vertex(255, 200);
vertex(230, 180);
vertex(210, 150);
vertex(180, 100);
vertex(170, 80);
vertex(130, 70);
vertex(125, 70);
vertex(120, 80);
vertex(115, 90);
vertex(110, 100);
vertex(105, 120);
vertex(105, 130);
vertex(108, 140);
vertex(110, 170);
vertex(113, 185);
endShape(CLOSE);

// eye

fill(0);
beginShape();
vertex(120, 165);
vertex(118, 185);
vertex(130, 188);
vertex(140, 185);
endShape(CLOSE);

// neck

fill(0);
beginShape();
vertex(260, 200);
vertex(258, 300);
vertex(230, 350);
vertex(225, 355);
vertex(220, 360);
vertex(230, 370);
vertex(240, 380);
vertex(250, 400);
vertex(260, 420);
vertex(280, 440);
vertex(360, 350);
vertex(365, 300);
vertex(340, 270);
vertex(337, 250);
vertex(330, 230);
vertex(320, 215);
vertex(322, 205);
vertex(321, 195);
vertex(310, 180);
vertex(290, 176);
endShape(CLOSE);

// hair

fill(0);
beginShape();
vertex(113, 50);
vertex(130, 60);
vertex(180, 75);
vertex(240, 180);
vertex(255, 188);
vertex(270, 180);
vertex(290, 165);
vertex(320, 173);
vertex(323, 180);
vertex(326, 190);
vertex(330, 210);
vertex(335, 205);
vertex(338, 220);
vertex(345, 250);
vertex(346, 265);
vertex(370, 290);
vertex(380, 290);
vertex(390, 265);
vertex(388, 200);
vertex(395, 190);
vertex(403, 200);
vertex(430, 190);
vertex(440, 170);
vertex(439, 150);
vertex(434, 120);
vertex(436, 100);
vertex(420, 60);
vertex(400, 58);
vertex(380, 65);
vertex(370, 66);
vertex(350, 75);
vertex(345, 58);
vertex(330, 30);
vertex(250, 23);
vertex(200, 20);
endShape(CLOSE);

//changing bars

noStroke();
fill(R,G);
rect(mouseX, mouseY,700,10);

}


