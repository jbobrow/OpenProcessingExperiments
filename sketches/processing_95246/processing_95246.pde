
float theta = radians(60);


void setup() {
  size(600, 600);
  smooth();
  noLoop();
}

void draw()
{
  background(255);
  int i=120;
  fill(0);
  textSize(15);
  String s1 = "Under this tree, we waited for Godot.";
  text(s1, width/2, i);  // Text wraps within text box
  String s2 = "As days go by, we are still waiting.";
  text(s2, width/2, i+20);  // Text wraps within text box
  String s3 = "How long have time pass?";
  text(s3, width/2, i+40);  // Text wraps within text box
  String s4 = "Only this tree knows the answer.";
  text(s4, width/2, i+60);  // Text wraps within text box
  translate(20, height+10);
  branch(random(0.01,0.02));
}

void mouseClicked()
{
  redraw();
}

void branch(float len) {
  if (len <5 ) {
    rotate(random(0.2,0.5));
    strokeWeight(10);
    line(0, 0, 0, -height/3);

    pushMatrix();
    translate(0, -height/random(3,5));
    rotate(-theta+(random(2)));
    scale(0.7);
    strokeWeight(random(10));
    branch(len*3);
    popMatrix();

    pushMatrix();
    translate(0, -height/random(3,5));
    rotate(-theta+(random(2)));
    scale(0.5);
    strokeWeight(random(10));
    branch(len*2);
    popMatrix();
    
    pushMatrix();
    translate(0, -height/random(4,6));
    rotate(-theta+(random(2)));
    scale(0.7);
    strokeWeight(random(10));
    branch(len*2);
    popMatrix();
    
    pushMatrix();
    translate(0, -height/random(4,6));
    rotate(-theta+(random(2)));
    scale(0.3);
    strokeWeight(random(10));
    branch(len*2);
    popMatrix();
  }
}
