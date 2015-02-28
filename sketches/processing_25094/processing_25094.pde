
//import processing.pdf.*;

void setup() {
size(350, 700 );
noLoop();
//beginRecord(PDF, "filename.pdf"); 
}



void draw() {
  background(0);
  smooth();
stroke(225, 40, 8, 130);
noFill();
rect(0, 0, 349, 699);

stroke(225, 40, 8, 130);
line(0,0,350,700);
line(0,0,390,700);
line(0,0,310,700);
line(0,0, 350, 350);

line(350,0, 0, 700);
line(350, 0, 0,780);
line(350,0,0,620);
line(350,0,0,350);
line(0,350,350, 350);

line(0,350,175,700);
line(350,350, 175, 700);


stroke(170);
strokeWeight(6);
ellipse(175, 350, 42, 42);

strokeWeight(2);
ellipse(140,320, 30, 30);
ellipse(210, 320, 30, 30);

ellipse(140,380, 30, 30);
ellipse(210, 380, 30, 30);

fill(170);
ellipse(140,330, 10, 10);
ellipse(210,330, 10, 10);

ellipse(140,370, 10, 10);
ellipse(210, 370, 10, 10);

noFill();
stroke(250, 170);
ellipse(175, 350, 200, 200);
stroke(170,170);
ellipse(175, 350, 250, 250);

//endRecord();

}



