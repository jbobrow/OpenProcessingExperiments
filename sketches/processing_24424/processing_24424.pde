
//Written by Levi Berge 21/03/2011

//import processing.pdf.*;

void setup () {

  
  size (500, 1000);
  frameRate (1);
  //beginRecord(PDF, "FireFinal3.pdf");
  background(0, 0, 0);
  smooth ();
  noStroke(); 
}

void draw () {

    float currentlyAt = 1;
    float space = 1;
    color start = color(255, 255, 0, 80);
    color end = color(255, 0, 0, 130);

while (currentlyAt < 10) {

    float vx1 = 250;        
    float vy1 = 1000;
    float vx2 = 175;
    float vy2 = 500;
    float vx3 = 250;
    float vy3 = 1000;

    float ax1 = 350;
    float ay1 = 800;
    float ax2 = 150;
    float ay2 = 650;
    float ax3 = 100;
    float ay3 = 700;
    float ax4 = 250;
    float ay4 = 850;

    fill (lerpColor (end, start, space/currentlyAt));
 
    beginShape();
    vertex(vx1, vy1);
    bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
    bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
    endShape();

float randomX = random(-200, 350);
float randomY = random(-450, 450);

      vx1 = vx1+randomX;        
      vx2 = vx2+randomX;
      vx3 = vx3+randomX;
      ax1 = ax1+randomX;     
      ax2 = ax2+randomX;
      ax3 = ax3+randomX;      
      ax4 = ax4+randomX;

      vy1 = vy1+randomY; 
      vy2 = vy2+randomY;      
      vy3 = vy3+randomY;
      ay1 = ay1+randomY;     
      ay2 = ay2+randomY;
      ay3 = ay3+randomY;      
      ay4 = ay4+randomY;
      
      beginShape();
      vertex(vx1, vy1);
      bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
      bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
      endShape();

  rotate(0.1*currentlyAt);
  
      fill (lerpColor (start, end, space/currentlyAt));
      beginShape();
      vertex(vx1, vy1);
      bezierVertex(ax1, ay1, ax2, ay2, vx2+50, vy2);
      bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
      endShape();

  rotate(-0.1*currentlyAt);
 
currentlyAt = currentlyAt+1;
      
}
}
//void keyPressed(){
//if(key == 's' || key == 'S')
//{
//endRecord();
//}
//}

