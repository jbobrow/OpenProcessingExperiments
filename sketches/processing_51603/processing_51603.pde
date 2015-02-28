
color c = color(0);
float x = 0;
float y = 100;
float speed = 20;

void setup() {
  size(500,500);
}

void draw() {
  background(30);
//cn tower//
smooth();
beginShape();
fill(0);
vertex(100, 340);
vertex(150, 340);
vertex(135, 0);
vertex(125, 0);
endShape(CLOSE);
ellipse(130, 60, 75, 45);

//shadow//
stroke(25);
line(135, 85, 140, 300);

stroke(25);
line(125, 85, 120, 300);


// skydome// 
fill(255,255,255,245);
noStroke();
ellipse(-10, 290, 200, 130);

//skyline and water//

fill(0,255,255,80);
ellipse(-10, 290, 225, 175);

fill(0);
rect(-175, 300, 277, 60);

fill(10);
rect(-10, 325, 550, 50);

fill(0,0,30);
rect(-10, 350, 550, 500);

fill(0,0,250,0);
rect(-10, 350, 550, 500);
//skyline and water//

//buildings right to left//

fill(0);
rect(200, 265, 50, 70);

fill(10);
rect(465, 130, 65, 190);

fill(5);
rect(275, 180, 65, 100);

fill(15);
rect(450, 175, 65, 150);

fill(5);
rect(370, 150, 65, 175);

fill(15);
rect(415, 190, 80, 140);

fill(10);
rect(300, 265, 50, 70);

fill(10);
rect(330, 255, 50, 70);

fill(10);
rect(250, 220, 50, 110);

fill(10);
rect(25, 256, 50, 80);

fill(10);
rect(155, 225, 75, 110);

fill(255, 255, 255);
ellipse(425, 25, 50, 50);

fill(30);
ellipse(418, 25, 50, 50);
 
  move();
  display();
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(x,y,10,10);
}

  


void move() {
  x = x + speed;
  if (x > width) {
    x = 10;
  }
      y = y + speed;
  if (y > width) {
    y = 10;
  }
}

void display() {
  fill(c);
  ellipse(x,y,10,10);
}




  

