
// Recursive Forest
// David Andreen
// Based on Alasdair Turner's sketch (http://www.openprocessing.org/visuals/?visualID=7150)
 
void setup() {
  size(700,500);
  background(204);
  smooth();
  noLoop();
}
 
void draw() {
  noStroke(); 
  fill(204,50);
  rect(0,0,width,height);
  strokeWeight(10);
  translate(random(width), height);
  scale(random(0.5,1));
  branch(0);
 
}
 
void branch(int depth) {
  if (depth<8) {
    if (depth<4)
    {
      stroke(0);
    }
    else if (depth<6){
      stroke(0,150);
    }
    else {
      stroke(0,50);
    }
    line (0,0,0,-height/3);
    pushMatrix();
    {
      translate(0,-height/5);
      rotate(random(-PI/4,PI/4));
      scale(random(0.5,0.6));
      branch(depth+int(random(1,2)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.6,0.75));
      branch(depth+int(random(1,1)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.6,0.7));
      branch(depth+int(random(1,1)));
    }
    popMatrix();
    pushMatrix();
      {
        translate(0,-height/3);
      rotate(random(-PI/4,PI/4));
      scale(random(0.55,0.65));
      branch(depth+int(random(1,3)));
    }
    popMatrix();
  }
}
 
void mouseClicked()
{
  redraw();
}

                
