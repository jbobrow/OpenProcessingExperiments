
//homework 5 rwandrew
//copyright russell andrews 2012

float dia;

int col;

void setup(){
  size(400, 400);
  smooth();
  dia = 100;
  col = color(96, 145, 112);
}

void draw(){
  background(84, 2, 2, 15);
  drawInitials(mouseX, mouseY, dia, dia);
  }

void drawInitials(float x, float y, float wd, float ht){
  fill(col);
  strokeWeight(.035*wd);
  stroke(153, 18, 18);
  ellipse(x, y, wd, ht);
  
  stroke(237, 224, 166);//first initial r
  noFill();
  beginShape();
    vertex(x - .35*wd, y - .23*ht);
    vertex(x - .35*wd, y + .15*ht);
  endShape();
  beginShape();
    curveVertex(x - .20*wd, y + .40*ht);
    curveVertex(x - .35*wd, y - .13*ht);
    curveVertex(x - .215*wd, y - .27*ht);
    curveVertex(x - .08*wd, y - .13*ht);
    curveVertex(x - .19*wd, y + .40*ht);
  endShape();
  beginShape();//second initial w
    vertex(x - .215*wd, y - .04*ht);
    vertex(x - .215*wd, y + .15*ht);
  endShape();
  beginShape();
    curveVertex(x - .155*wd, y - .25*ht);
    curveVertex(x - .215*wd, y + .15*ht);
    curveVertex(x - .1075*wd, y + .26*ht);
    curveVertex(x, y + .15*ht);
    curveVertex(x - .06*wd, y - .25*ht);
  endShape();
  beginShape();
    curveVertex(x + .155*wd, y - .25*ht);
    curveVertex(x + .215*wd, y + .15*ht);
    curveVertex(x + .1075*wd, y + .26*ht);
    curveVertex(x, y + .15*ht);
    curveVertex(x + .06*wd, y - .25*ht);
  endShape();
  beginShape();
    vertex(x + .215*wd, y - .04*ht);
    vertex(x + .215*wd, y + .15*ht);
  endShape();
  
  beginShape();//third initial a
    vertex(x + .35*wd, y - .13*ht);
    vertex(x + .35*wd, y + .15*ht);
  endShape();
  beginShape();
    curveVertex(x + .20*wd, y + .40*ht);
    curveVertex(x + .35*wd, y - .13*ht);
    curveVertex(x + .215*wd, y - .27*ht);
    curveVertex(x + .08*wd, y - .13*ht);
    curveVertex(x + .19*wd, y + .40*ht);
  endShape();
  ellipse(x + .216*wd, y + .02*ht, .27*wd, .27*ht);
  
//constraints
if (mousePressed){
  col = color(random(255), random(255), random(255));
}else {
  col = color(96, 145, 112);
  }
}


void keyPressed(){
  if (keyCode == UP){
    dia = dia + 3;
  }
  if (keyCode == DOWN){
    dia = dia - 3;
  }
  dia = constrain(dia, 20, 300);
}

