
int py;
float px;
void setup() {
    size (540,360);
    smooth();
   py=0;
   frameRate(30);
}
void draw()  {
  background(111, 195, 211);
  if (mousePressed) {
  background(117, 151, 157);
  }
fill(250, 255, 0);
ellipse(500, 25, 30, 30);//solzin//
line(0, 240, 540, 240);//chão//
fill(116, 116, 116);
stroke(0);
triangle(350, 240, 400, 180, 450, 240);//base do tubo//
noStroke();
quad(325, 212, 400, 212, 400, 225, 320, 220);//plataforma//
quad(300, 205, 327, 212, 327, 212, 300, 207);//rampa//
fill(155, 155, 155);
stroke(0);
ellipse(400, 180, 120, 120);//tubão//
fill(214, 214, 214);
ellipse(400, 180, 110, 110);
line(356, 212, 445, 212);
line(354, 150, 445, 150);
fill(255, 21, 21);
quad(300, 140, 310, 140, 310, 205, 300, 205);//portaDoOnibus//
quad(300, 205, 327, 212, 327, 212, 300, 207);//rampa//
fill(80, 80, 80);
rect(205, 220, 10, 20, 7);//pneu//
rect(285, 220, 10, 20, 7);//pneu//
fill(255, 21, 21);
rect(200, 120, 100, 110, 7);//onibus//
fill(255, 155, 19);
rect(205, 205, 05, 10, 5);//faról//
rect(290, 205, 05, 10, 5);//faról//
fill(224, 224, 224);
rect(210, 130, 80, 45, 5);
fill(85, 85, 85);
quad(0, 241, 540, 241, 540, 360, 0, 360);
textSize(7);
fill(0, 0, 0);
text("CURITIBA", 235, 220);
textSize(10);
text("CR022", 262, 190);
noStroke();
fill(170, 170, 170);
quad(0, 70, 35, 50, 35, 240, 0, 240);//predio1(lado)//
fill(203, 203, 203);
quad(35, 50, 70, 70, 70, 240, 35, 240);//predio1(frente)//
stroke(0);
line(80, 85, 80, 240);
fill(86, 167, 108);
quad(70, 85, 80, 85, 80, 240, 70, 240);//predio2//
quad(80, 85, 120, 105, 120, 240, 80, 240);//predio//
stroke(0);
line(35, 50, 35, 240);
noStroke();
  if (mousePressed){
  for (py = 0; py < 360; py++){
    float px = random(540);  
    fill(9, 12, 126);
  ellipse(px, py, 1, 6);
  }
  fill(113, 113, 113);
  ellipse(10, 5, 40, 40);//nuvem//
ellipse(30, 5, 40, 40);//nuvem//
ellipse(50, 5, 40, 40);//nuvem//
ellipse(70, 5, 40, 40);//nuvem//
ellipse(90, 5, 40, 40);//nuvem//
ellipse(110, 5, 40, 40);//nuvem//
ellipse(130, 5, 40, 40);//nuvem//
ellipse(150, 5, 40, 40);//nuvem//
ellipse(170, 5, 40, 40);//nuvem//
ellipse(200, 5, 40, 40);//nuvem//
ellipse(230, 5, 40, 40);//nuvem//
ellipse(260, 5, 40, 40);//nuvem//
ellipse(290, 5, 40, 40);//nuvem//
ellipse(320, 5, 40, 40);//nuvem//
ellipse(350, 5, 40, 40);//nuvem//
ellipse(380, 5, 40, 40);//nuvem//
ellipse(400, 5, 40, 40);//nuvem//
ellipse(420, 5, 40, 40);//nuvem//
ellipse(440, 5, 40, 40);//nuvem//
ellipse(460, 5, 40, 40);//nuvem//
ellipse(480, 5, 40, 40);//nuvem//
ellipse(500, 5, 40, 40);//nuvem//
ellipse(520, 5, 40, 40);//nuvem//
ellipse(540, 5, 40, 40);//nuvem//
}
  smooth();
  }
