
/*
sketch_3
sandstone tubes
October, 2009
dthibert@telus.net
*/


void setup() {
  size(500,500);
  background(205,105,40);
  
  fill(0,160,200);
  stroke(0);
  rect(0,0,500,80);


  smooth();
};



void draw()  {

  if (mousePressed) {
    for (int i = 0; i < 10; i++) {
      stroke(random(100,250),random(80,150), random(20,55), random(50,100));
      fill(209,172,100);
      ellipse(mouseX -50, mouseY -50, mouseX +random(-50,-60), mouseY -random(50,80));
    };
  };


};


