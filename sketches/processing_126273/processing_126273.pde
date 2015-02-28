
import java.util.List;

private Shape shape;
private boolean isShaping = false;

void setup() {
  size(700,700, P3D);
  background(0);
  stroke(255);
  strokeWeight(2);
  
  shape = new Shape();
}

void draw() {
  translate(width/2,height/2);
  if(mousePressed && (mouseButton == LEFT) && !isShaping) {
    isShaping = true;
    shape = new Shape();
    shape.points.add(new PVector(mouseX - width/2, mouseY - height/2));
  }
  else if(mousePressed && isShaping && (mouseButton == LEFT)) {
    shape.points.add(new PVector(mouseX - width/2, mouseY - height/2));
  }
  else if(mousePressed && isShaping && (mouseButton == RIGHT)) {
    isShaping = false;
    shape = null;
  }
  if(shape != null) {
    if(shape.points.size() > 2) {
      for(float a = 0; a < TWO_PI; a += TWO_PI / 6) {
        pushMatrix();
        beginShape();
        rotate(a);
        for(PVector p : shape.points) {
          vertex(p.x, p.y);
        }
        endShape(CLOSE);
        popMatrix();
      }
    }
  }
}

public void keyPressed() {
    if(key == ' ') {
        background(0);
        shape = null;
        isShaping = false;
    }    
}

public class Shape {
  public List<PVector> points = new ArrayList<PVector>();
}
  
