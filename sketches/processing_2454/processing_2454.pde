
/*

Traffic Light
Daria Lanz
daria@darialanz.com
June 2009
*/

void setup() {
size(700,450);
smooth();
};

void draw() {
  background(116,218,232);
  
  rectMode(CORNER);
  fill(0);
  rect(200,125,500,40);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  fill(#052302);
  rect(350,225,125,275);
  fill(255,0,0,50);
  ellipse(350,140,75,75);
  fill(255,240,0,50);
  ellipse(350,225,75,75);
  fill(0,255,0,50);
  ellipse(350,310,75,75);

  if (mouseX > 312 && mouseX < 388 && mouseY > 102 && mouseY < 178) {
    fill(255,0,0);
    ellipse(350,140,75,75);
  }
  else if (mouseX > 312 && mouseX < 388 && mouseY > 187 && mouseY < 263) {
    fill(255,240,0);
    ellipse(350,225,75,75);
  }
  else if (mouseX > 312 && mouseX < 388 && mouseY > 272 && mouseY < 348) {
    fill(0,255,0);
    ellipse(350,310,75,75);
  };

};



