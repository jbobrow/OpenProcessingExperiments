
import processing.pdf.*;



int patternSeperationX = 100;
int patternSeperationY = 100;
 
 
void setup(){
  size(350,700);
   noLoop();
//  beginRecord(PDF, "outside the square 4.pdf"); 
}
void draw(){
  
background(250, 20, 0); 
strokeWeight(5);

line(0, 700, 350, 350);
line(0, 350, 350, 350);
line(0, 0, 350, 350);



fill(254, 125);
ellipse(20, 70, 130, 130);
ellipse(20, 70, 90, 90);
ellipse(20, 70, 50, 50);
ellipse(230, 130, 110, 110);
ellipse(230, 130, 80, 80);
ellipse(230, 130, 50, 50);
ellipse(230, 130, 20, 20);
ellipse(60, 310, 60, 60);
ellipse(60, 310, 40, 40);
ellipse(60, 310, 20, 20);
ellipse(305, 300, 20, 20);
ellipse(90, 198,  20, 20);
ellipse(145, 650, 120, 120);
ellipse(145, 650, 70, 70);
ellipse(145, 650, 20, 20);
ellipse(250, 488, 100, 100);
ellipse(250, 488, 20, 20);
ellipse(40, 500, 100, 100);
ellipse(40, 500, 50, 50);
ellipse(175, 350, 20, 20);
ellipse(255, 260, 50, 50);
ellipse(255, 260, 30, 30);

//endRecord();




}

