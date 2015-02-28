
//Written by Levi Berge 21/03/2011

//import processing.pdf.*;

void setup () {
  
  size (500, 1000);
  background(0, 0, 0);
  frameRate (1);
  //beginRecord(PDF, "NatureFinal.pdf");
  smooth ();
  noStroke();
}

void draw () {

    float currentlyAt = 0;
    float space = 5;
    color start = color(0, 255, 0);
    color end = color(0, 120, 0);

    float vx1 = 0;        
    float vy1 = 1000;
    float vx2 = 175;
    float vy2 = 300;
    float vx3 = 0;
    float vy3 = 900;

    float ax1 = 350;
    float ay1 = 700;
    float ax2 = 50;
    float ay2 = 500;
    float ax3 = 30;
    float ay3 = 450;
    float ax4 = 250;
    float ay4 = 680;

    beginShape();
    vertex(vx1, vy1);
    bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
    bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
    endShape();

    while (currentlyAt < space) {

      beginShape();
      vertex(vx1, vy1);
      bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
      bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
      endShape();

      fill (lerpColor (end, start, space/currentlyAt));

      vx1 = vx1-1;        
      vx3 = vx3+1;
      ax1 = ax1-0.75;     
      ax2 = ax2-0.75;
      ax3 = ax3+0.5;      
      ax4 = ax4+1;

      beginShape();
      vertex(vx1, vy1);
      bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
      bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
      endShape();

      float incx = 300;
      float incy = -80;

      beginShape();
      vertex(vx1+incx, vy1+incy);
      bezierVertex(ax1+incx, ay1+incy, ax2+incx, ay2+incy, vx2+incx, vy2+incy);
      bezierVertex(ax3+incx, ay3+incy, ax4+incx, ay4+incy, vx3+incx, vy3+incy);
      endShape();
      rotate(3.80);

      float count2 = 0;
      float amt = 10;
      float divide = 100;
      while (count2<amt) {

        incx = -50;
        incy = -500;
        incx = incx+random(-250, 250);
        incy = incy+random(-500, 700);

        beginShape();
        vertex(vx1+incx, vy1+incy);
        bezierVertex(ax1+incx, ay1+incy, ax2+incx, ay2+incy, vx2+incx, vy2+incy);
        bezierVertex(ax3+incx, ay3+incy, ax4+incx, ay4+incy, vx3+incx, vy3+incy);
        endShape();
        rotate(random(0, 2*PI)); 	
        count2 = count2+0.2;
      }
      //float deg = 220.0;
      //float rad = radians(deg);
      //println(deg + " degrees is " + rad + " radians");

      beginShape();
      vertex(vx1, vy1);
      bezierVertex(ax1, ay1, ax2, ay2, vx2, vy2);
      bezierVertex(ax3, ay3, ax4, ay4, vx3, vy3);
      endShape();

      currentlyAt = currentlyAt+0.1;
      }
}

//void keyPressed(){
//if(key == 's' || key == 'S')
//{
//endRecord();
//}
//}

