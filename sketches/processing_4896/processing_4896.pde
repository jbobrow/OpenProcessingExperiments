
/*
Change of Heart
adalau85@gmail.com
October 3, 2009
*/

int value = 0;

void setup() {
  size(500,500);
  background(255);
  smooth();
};

//draw the squares and the heart
void draw() {

  noStroke();

  fill(mouseX,0,mouseY);
  rect(20,440,40,40);
  rect(80,440,40,40);
  rect(140,440,40,40);
  rect(200,440,40,40);
  rect(260,440,40,40);
  rect(320,440,40,40);
  rect(380,440,40,40);
  rect(440,440,40,40);

  fill(mouseX+20,0,mouseY+20);
  rect(20,380,40,40);
  rect(80,380,40,40);
  rect(140,380,40,40);
  triangle(200,380,200,420,240,420);
  triangle(300,380,300,420,260,420);
  rect(320,380,40,40);
  rect(380,380,40,40);
  rect(440,380,40,40);

  fill(mouseX+40,0,mouseY+40);
  rect(20,320,40,40);
  rect(80,320,40,40);
  triangle(140,320,140,360,180,360);
  triangle(360,320,360,360,320,360);
  rect(380,320,40,40);
  rect(440,320,40,40);

  fill(mouseX+60,80,mouseY+60);
  rect(20,260,40,40);
  triangle(80,260,80,300,120,300);
  triangle(420,260,420,300,380,300);
  rect(440,260,40,40);

  fill(mouseX+80,0,mouseY+80);
  rect(20,200,40,40);
  triangle(200,200,240,200,240,240);
  triangle(260,200,300,200,260,240);
  rect(440,200,40,40);

  fill(mouseX+100,0,mouseY+100);
  rect(20,140,40,40);
  triangle(80,140,120,140,80,180);
  triangle(140,140,180,140,180,180);
  rect(200,140,40,40);
  rect(260,140,40,40);
  triangle(320,140,360,140,320,180);
  triangle(380,140,420,140,420,180);
  rect(440,140,40,40);

  fill(mouseX+120,0,mouseY+120);
  rect(20,80,40,40);
  rect(80,80,40,40);
  rect(140,80,40,40);
  rect(200,80,40,40);
  rect(260,80,40,40);
  rect(320,80,40,40);
  rect(380,80,40,40);
  rect(440,80,40,40);

  fill(mouseX+140,0,mouseY+140);
  rect(20,20,40,40);
  rect(80,20,40,40);
  rect(140,20,40,40);
  rect(200,20,40,40);
  rect(260,20,40,40);
  rect(320,20,40,40);
  rect(380,20,40,40);
  rect(440,20,40,40);  
};

//when mouse is moving inside the window,
//the color is changed from value 0 to 255
void mouseMoved() {
  value+=5;
  if(value>255) {
    value=0;
  };
};



