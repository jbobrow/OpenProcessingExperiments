
import processing.pdf.*;
boolean salvar=false;

int value = 0;

void setup () {
  size (500, 500);
  background (255);
}  

void draw () {
  if (salvar==true) {
beginRecord(PDF, "luxury_###.pdf");
}
  
  background (255);
  
   int f = 0; //fundo colorido
  for (int y=500; y>=0; y=y-1) {
    if (f>=0) {
      f=f+1;
      stroke(mouseX, mouseY, f);
      line(0, y, 500, y);
    }
  }
  
  noStroke (); //grama
  fill (161-mouseX/5, 198, 128-mouseY/5);
  rect (0, 450, 500, 50);
  
  fill (mouseX, mouseY, 129); //prédio
  quad (100, 460, 200, 470, 200, 30, 100, 70);
  fill (mouseX, 141, 87);
  quad (200, 470, 400-mouseX/5, 460, 400-mouseX/5, 70, 200, 30); 
  
  stroke (255); //luzes
  strokeWeight (2);
  line (110, 100, 200, 250);
  line (110, 450, 200, 370);
  line (140, 400, 200, 100);
  line (140, 70, 200, 100);
  
  line (200, 250, 300-mouseX/5, 435);
  line (200, 370, 400-mouseX/5, 200);
  line (200, 100, 350-mouseX/5, 440);
  line (250, 435, 400-mouseX/5, 250);
    
 noStroke (); //prédio
 fill (209, 205, 198);
  quad (100, 460, 150, 465, 150, 60, 100, 80);
  
  stroke (mouseX, mouseY, 170);
  strokeWeight (7);
  line (101, 440, 200, 435);
  line (200, 435, 399-mouseX/5, 440);
  
 
 noStroke(); //grama 
fill(49, 98, 33, 235);
 ellipse (5, 470, 45, 45);
 ellipse (50, 465, 40, 40);
 ellipse (75, 490, 50, 50);
 ellipse (100, 480, 40, 40);
 ellipse (125, 470, 40, 40);
 ellipse (130, 490, 50, 50);
 ellipse (150, 480, 50, 50);
 ellipse (175, 470, 40, 40);
 ellipse (205, 490, 40, 40);
 ellipse (230, 480, 50, 50);
 ellipse (250, 470, 40, 40);
 ellipse (280, 490, 40, 40);
 ellipse (300, 480, 30, 30);
 ellipse (325, 470, 50, 50);
 ellipse (350, 490, 40, 40);
 ellipse (375, 475, 30, 30);
 ellipse (410, 470, 40, 40);
 ellipse (430, 490, 40, 40);
 ellipse (450, 475, 30, 30);
 ellipse (475, 480, 40, 40);
 ellipse (490, 470, 50, 50);
 
fill(125, 185, 20, 100);
 ellipse (35, 495, 40, 40);
 ellipse (110, 475, 40, 40);
 ellipse (190, 495, 50, 50);
 ellipse (270, 480, 30, 30);
 ellipse (400, 500, 55, 55);
 ellipse (490, 490, 30, 30);

 if (salvar==true) {
endRecord();
salvar=false;
}

}

void mousePressed() {
  salvar = true;
}
