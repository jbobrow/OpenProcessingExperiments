
import processing.opengl.*;

void setup(){
  size(489,480,OPENGL);
  background(#ededed);
}

void draw() {
  noFill();
  smooth();
  strokeWeight(1);
  stroke(136, 159, 173);
  ellipseMode(CENTER);
  ellipse(192,196,360,360);
  ellipse(282,286,360,360);
  line(282,286,102,286);
  ellipse(192,286,180,180);
  line(192,286,192,196);
  ellipse(192,241,90,90);
  ellipse(282,241,90,90);
  line(282,286,282,196);
  ellipse(282,196,180,180);
  line(192,196,372,196);

}


