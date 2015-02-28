
int xgraph;
int ygraph;
float easing;

void setup(){
  size(300, 300);
  background(0);
  stroke(255);
  noFill();

}

void draw(){
  background(0);
  for (xgraph = 5; xgraph <= width-5; xgraph+=10) {
    for (ygraph = 5; ygraph <=height-5; ygraph+=10) {
      translate(xgraph, ygraph);
        float mouseDist = norm((dist(mouseX, mouseY, xgraph, ygraph)), (dist(0, 0, width, height)), 0.0);        
        float angle = ((PI/2) + atan2(mouseY-ygraph, mouseX-xgraph)) * mouseDist;
        pushMatrix();
        rotate(angle);
        beginShape();
          vertex(-3+0, 3+0);
          vertex(0+0, -3+0);
          vertex(3+0, 3+0);
        endShape();
        popMatrix();
        translate(-xgraph, -ygraph);
    }
  }

}



