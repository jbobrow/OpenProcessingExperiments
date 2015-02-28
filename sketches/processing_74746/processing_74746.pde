
int y = 0;

void setup() {
  size(500, 300);
}

void draw() {
 
 if(mousePressed) {
   background(mouseY, 235, mouseX/2);
   line(0, 240, 500, 240);
   
   if(mouseY < 240) {
     y = mouseY;
   }
   else {
     y = 240;
   }
   //danceLeft
   line(10, y, 20, y-80);
   line(30, y, 35, y-60);
   line(40, y, 50, y-120);
   line(57, y, 67, y-50);
   line(70, y, 70, y-80);
   line(90, y, 100, y-90);
   line(110, y, 100, y-80);
   line(143, y, 133, y-60);
   line(160, y, 150, y-70);
   line(180, y, 170, y-50);
   line(200, y, 190, y-100);
   
   //danceRight
   line(300, y, 290, y-80);
   line(320, y, 330, y-60);
   line(340, y, 320, y-120);
   line(357, y, 347, y-50);
   line(370, y, 390, y-80);
   line(390, y, 370, y-90);
   line(410, y, 400, y-80);
   line(443, y, 453, y-60);
   line(460, y, 470, y-70);
   line(480, y, 470, y-50);
   line(490, y, 500, y-100);
   
   //box
   quad(230, 240, 230, 200, 270, 200, 270, 240);
   ellipse(250, 220, 30, 30);
   ellipse(250, 220, 10, 10);
   
   //sound
   noFill();
   beginShape();
   curveVertex(220, 200);
   curveVertex(220, 200);
   curveVertex(240, 190);
   curveVertex(260, 190);
   curveVertex(280, 200);
   curveVertex(280, 200);
   endShape();
   
 }

  else {
   background(255);
   
   //standLeft
   line(0, 240, 500, 240);
   line(10, 240, 10, 160);
   line(30, 240, 30, 180);
   line(40, 240, 40, 120);
   line(57, 240, 57, 190);
   line(70, 240, 70, 160);
   line(90, 240, 90, 150);
   line(110, 240, 110, 160);
   line(143, 240, 143, 180);
   line(160, 240, 160, 170);
   line(180, 240, 180, 190);
   line(200, 240, 200, 140);
   
   //standRight
   line(300, 240, 300, 160);
   line(320, 240, 320, 180);
   line(340, 240, 340, 120);
   line(357, 240, 357, 190);
   line(370, 240, 370, 160);
   line(390, 240, 390, 150);
   line(410, 240, 410, 160);
   line(443, 240, 443, 180);
   line(460, 240, 460, 170);
   line(480, 240, 480, 190);
   line(490, 240, 490, 140);
   
   //box
   quad(230, 240, 230, 200, 270, 200, 270, 240);
   ellipse(250, 220, 30, 30);
   ellipse(250, 220, 10, 10);
   
  } 
}
