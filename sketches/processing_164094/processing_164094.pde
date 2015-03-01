
import java.util.List;
int mystroke;
int myfill;
int nSimm;
int ii=0;
float mystrowt;
private Shape shape;
private boolean isShaping = false;
void setup() {
  size(700,700, P3D);
  background(100);
   mystroke=255;
   myfill=0;
  stroke(mystroke);
  fill(myfill);
  shape = new Shape();
  //frameRate(200);
  strokeWeight(0.5);
  nSimm=5;
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
      for(float a = 0; a < TWO_PI; a += TWO_PI / nSimm) {
        pushMatrix();
        rotate(a);
        for(PVector p : shape.points) {
           ii++;
           float l=ii % shape.points.size()/5;
        mystrowt= (1+cos(ii/shape.points.size()/30 ));
        ellipse(p.x, p.y,l* mystrowt, l*mystrowt);
         mystrowt= (1+sin(ii/shape.points.size()/30 ));
        strokeWeight(mystrowt/2);
        }
        popMatrix();
      }
    }
  }
}
public void keyPressed() {
    if(key == 'c') {
        background(0);
        shape = null;
        isShaping = false;
    } 
     if(key == ' ') {
       if (mystroke==255){mystroke=0; myfill=255;}
       else{ mystroke=255;myfill=0;}
      shape = new Shape();
      stroke(mystroke);
      fill(myfill);
     }
    if (key == CODED) {
    if (keyCode == UP) {  nSimm++;}
    if (keyCode == DOWN) {  nSimm--;}
       }
        if (nSimm<1){nSimm=1;}
}
public void mousePressed() {
        shape = new Shape();
}

public class Shape {
  public List<PVector> points = new ArrayList<PVector>();
}
  
