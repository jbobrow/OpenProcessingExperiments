
// Assignment #2 Winged Vases
// Name: Wenyu Pan
// E-mail: wpan@brynmawr.edu
// Date: 09/15/2010


float x, y, w1, w2, h, r, g, b, m, n,j,k;
float c,d;
float delta=1;
void setup() {
size(500,500);
smooth();
frameRate(4);
background(255);
PImage myPic;
myPic=loadImage("background.jpg");
image(myPic,0,0,500,500);
// set floats to some specific values
	x = 0.3 * width;
	y = 0.6 * height;
	w1 = 0.2 * width;
        w2 = 0.1 * width;
	h = 0.4 * height;
        m = x + 0.1 * width;
        n = y - 0.1 * height;
        c=20;
        d=30;
        j = 100;
        k = height;
      }
void draw() {
  //draw wings of vase
        noStroke();
        fill(255, 126, 146, +50);
        beginShape();
        curveVertex(m, n);
        curveVertex(m, n);
        curveVertex(m + 0.07 * width, n - 0.14 * height);
        curveVertex(m + 0.21 * width, n - 0.21 * height);
        curveVertex(m + 0.14 * width, n - 0.07 * height);
        curveVertex(m, n);
        curveVertex(m, n);
        endShape(CLOSE);
        beginShape();
        curveVertex(m, n);
        curveVertex(m, n);
        curveVertex(m - 0.07 * width, n + 0.14 * height);
        curveVertex(m - 0.21 * width, n + 0.21 * height);
        curveVertex(m - 0.14 * width, n + 0.07 * height);
        curveVertex(m, n);
        curveVertex(m, n);
        endShape(CLOSE);
        beginShape();
        curveVertex(m, n);
        curveVertex(m, n);
        curveVertex(m - 0.07 * width, n - 0.14 * height);
        curveVertex(m - 0.21 * width, n - 0.21 * height);
        curveVertex(m - 0.14 * width, n - 0.07 * height);
        curveVertex(m, n);
        curveVertex(m, n);
        endShape(CLOSE);
        beginShape();
        curveVertex(m, n);
        curveVertex(m, n);
        curveVertex(m + 0.07 * width, n + 0.14 * height);
        curveVertex(m + 0.21 * width, n + 0.21 * height);
        curveVertex(m + 0.14 * width, n + 0.07 * height);
        curveVertex(m, n);
        curveVertex(m, n);
        endShape(CLOSE);
  //draw body of vase
        r = random(150, 255);
        g = random(100, 255);
        b = random(0, 100);
        noStroke();
        fill(r, g, b, +150);
        beginShape();
        vertex(x, y);
        vertex(x + 0.08 * width, y - 0.1 * height);
        vertex(x + 0.08 * width, y - 0.3 * height);
        vertex(x + 0.12 * width, y - 0.3 * height);
        vertex(x + 0.12 * width, y - 0.1 * height);
        vertex(x + w1, y);
        vertex(x + w2 + 0.05 * width, y + h);
        vertex(x + 0.05 * width, y + h);
	vertex(x, y);
        endShape(CLOSE);
   //draw another vase 
        noStroke();
        fill(32, 98, 48, +200);
        beginShape();
        vertex(j, k);
        vertex(j - 0.02 * width, k - 0.08 * height);
        vertex(j + 0.05 * width, k - 0.15 * height);
        vertex(j + 0.05 * width, k - 0.25 * height);
        vertex(j + 0.1 * width, k - 0.25 * height);
        vertex(j + 0.1 * width, k - 0.15 * height);
        vertex(j + 0.17 * width, k - 0.08 * height);
        vertex(j + 0.15 * width, k);
        endShape(CLOSE);
        //mouse movement
        noStroke();
        fill(250,202,240, +100);
        beginShape();
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX + 14, mouseY - 28);
        curveVertex(mouseX + 42, mouseY - 42);
        curveVertex(mouseX + 28, mouseY - 14);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        endShape(CLOSE);
        beginShape();
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX - 14, mouseY + 28);
        curveVertex(mouseX - 42, mouseY + 42);
        curveVertex(mouseX - 28, mouseY + 14);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        endShape(CLOSE);
        beginShape();
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX - 14, mouseY - 28);
        curveVertex(mouseX - 42, mouseY - 42);
        curveVertex(mouseX - 28, mouseY - 14);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        endShape(CLOSE);
        beginShape();
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX + 14, mouseY + 28);
        curveVertex(mouseX + 42, mouseY + 42);
        curveVertex(mouseX + 28, mouseY + 14);
        curveVertex(mouseX, mouseY);
        curveVertex(mouseX, mouseY);
        endShape(CLOSE);
        //draw moving circle
        noStroke();
        fill(161,196,245,+100);
        ellipse(c, d, 40, 40);
        c = c + 50;
        d = d + 10;
       }

void mousePressed() {
  // set x, y, w, h to some new value(s)
        x = 0.5 * width;
	y = 0.8 * height;
	w1 = 0.2 * width;
        w2 = 0.1 * width;
	h = 0.6 * height;
       }
        



