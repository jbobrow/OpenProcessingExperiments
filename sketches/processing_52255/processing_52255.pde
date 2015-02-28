
int MaxDepth = 4;
float bval = 0;
float Theta = 0;
float grow = 0;
float x1 = 0;
float y1 = 100;
float x2 = 100;
float y2 = 0;
float x3 = 0;
float y3 = -100;
float x4 = -100;
float y4 = 0;

void setup() {
  frameRate(1000);
  size(800, 800);
  background(255);
  smooth();
}

void draw() {
  Theta += radians(.5);
  drawAxles();
  drawBeam();
  drawOutSeats();
  drawCircles(1);
}

void drawAxles() { 
  fill(255, 20);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  rotate(Theta*5);
  axle();
  drawBeam();
}

void drawBeam() {
  fill(245, 21, 100);
  ellipseMode(CENTER);
  ellipse(0, 0, 20, 20);
}

void axle() {
  strokeWeight(5);
  line(0, 0, x1, y1);
  line(0, 0, x2, y2);
  line(0, 0, x3, y3);
  line(0, 0, x4, y4);
}

void drawOutSeats() {
  ellipseMode(CENTER);
  fill(155, 20, 200);
  ellipse(x1, y1, 30, 30);
  fill(140, 15, 215);
  ellipse(x2, y2, 30, 30);
  fill(125, 10, 230);
  ellipse(x3, y3, 30, 30);
  fill(110, 5, 245);
  ellipse(x4, y4, 30, 30);
}

void drawCircles(int depth) {
      grow += (0.1 * Theta);
       bval = (bval*Theta)+5;
       if (Theta >= radians(360)) {
         bval = (bval/Theta)+5;
       }
       switch (depth) {
         case 1: fill(color(98, 233, bval));  break;
         case 2: fill(color(38, 222, bval));  break;
         case 3: fill(color(160, 21, bval));  break;
         case 4: fill(color(227, 78, bval));  break;
         default: return;
       }
       rect(x1-50, y1+20, 100, 100);
       ellipse(x2+70, y2, 100, 100);
       ellipse(x3, y3-70, 100, 100);
       ellipse(x4-70, y4, 200, 70);
       
       for (int i=0; i<5; i++) {
         pushMatrix();
           translate(x1, y1+70);
           rotate(Theta*4 + radians(i*120));
           translate(0, 0.6);
           scale(0.4);
           drawCircles(depth+1);
           popMatrix();
         pushMatrix();
           translate(x2+70, y2);
           rotate(-Theta*8 + radians(i*180)+10);
           translate(0, .3);
           scale(0.4);
           drawCircles(depth+3);
           popMatrix();
         pushMatrix();
           translate(x3, y3-70);
           rotate(Theta*16 + radians(i*120));
           translate(0, 0.6);
           scale(0.4);
           drawCircles(depth+1);
           popMatrix();
         pushMatrix();
           translate(x4-70, y4);
           rotate(-Theta*20 - radians(i*500)+40);
           translate(0, 0.6);
           scale(0.2);
           drawCircles(depth+1);
           popMatrix();
}
}
  

  

