
boolean doIt; 

//void drawMouth1(){

void setup () {
  size (500, 400);
  background (150);
  noStroke ();
  smooth ();
  doIt = true;
}

void draw () {
  if (doIt) {
    for (int x=50; x<=500; x+=100) {
      for (int y=50; y<=400; y+=100) {
        float topx=random (45, 70);
        float topy=random (40, 80);
        float botx= random (40, 70);
        float boty=random(40, 50);
        float colorz= random (198, 223);
        float nosel=random (15, 22);
        float nosew=random (5, 10);
        float browh=random (10, 15);
        float broww=random (2, 6);
        float lipp=random (-7, 8);
        float lip2=random (-5, 5);
        //        intx=random(flkjadlfkj);
        noStroke ();
        fill (255, colorz, 198);
        ellipse (x, y, topx, topy);
        ellipse (x, y+15, botx, boty);

        //mouth
        noFill();
        stroke (193, colorz-120, 78);
        beginShape();
        curveVertex(x-20, y+25);
        curveVertex(x-15, y+25-(lip2));
        curveVertex(x-5, y+25-(lipp));
        curveVertex(x+5, y+25-(lipp));
        curveVertex(x+15, y+25-(lip2));
        curveVertex(x+20, y+25);
        endShape();

        noStroke();
        fill (255, colorz+40, 198);
        quad(x-5, y, x+5, y, x+nosew, y+nosel, x-nosew, y+nosel);

        strokeWeight (3);
        stroke (255);
        fill (255);
        ellipse (x-10, y, topx/7, topy/7);
        ellipse (x+10, y, topx/7, topy/7);

        fill (0);
        ellipse (x-10, y, topx/8, topy/8);
        ellipse (x+10, y, topx/8, topy/8);
        noFill();



        noFill();
        stroke (0);
        beginShape();
        curveVertex(x-20, y-10);
        curveVertex(x-20, y-10);
        curveVertex(x-15, y-browh);
        curveVertex(x-5, y-10);
        curveVertex(x+5, y-broww);
        curveVertex(x+15, y-browh);
        curveVertex(x+20, y-10);
        curveVertex(x+20, y-10);
        endShape();




        doIt=false;
      }
    }
  }
} 
void mouseClicked() {
  background (150);
  doIt = true;
}


                
                
