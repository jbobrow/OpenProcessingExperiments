
boolean doIt; 

void setup() {
  size(400, 300); 
  doIt = true;
}
void draw() {
  if (doIt) {
    background(150);
    smooth();

    for (int x=50; x<=400; x+=100) {
      for (int y=50; y<=300; y+=100) {
        //head variables
        float topx = random(25, 70);
        float topy = random(40, 60);
        float botx = random(30, 70);
        float boty = random(30, 50);
        //nose variable
        float nosey = random(5, 15);
        float nosex = random(5, 15);
        //eye variables
        float eyex = random(10, 20);
        float eyey = random(5, 10);
        //mouth variable
        float mouth = random(-10, 10);
        //eyebrow variable
        float brow1 = random(5, 20);
        float brow2 = random(5, 20);

        //head
        fill(255);
        noStroke();
        ellipse (x, y, topx, topy);
        ellipse (x, y+15, botx, boty);
        //eyes
        stroke(1);
        strokeWeight(1);
        ellipse (x-10, y, eyex, eyey);
        ellipse (x+10, y, eyex, eyey);
        //pupils
        strokeWeight(random(2, 5));
        point(x-10, y);
        point(x+10, y);
        //mouth
        strokeWeight(1);
        beginShape();
        curveVertex(x-15, y+20);
        curveVertex(x-15, y+20);
        curveVertex(x, y+(20+mouth));
        curveVertex(x+15, y+20);
        curveVertex(x+15, y+20);
        endShape();
        //nose
        strokeWeight(1);
        beginShape();
        vertex(x, y);
        vertex(x-nosex, y+nosey);
        vertex(x+nosex, y+nosey);
        endShape(CLOSE);
        //brow
        line(x-5, y-brow1, x-20, y-brow2);
        line(x+5, y-brow1, x+20, y-brow2);
      }
    }
    doIt = false;
  }
}
void mousePressed(){
  doIt = true;
}




