
int count; //<>//
float speedR;

ArrayList<Triangles> triangles;
void setup() {
  size(1024, 768, P2D);
  smooth();
  frameRate(60);

  for ( int i = 0; i < 3; i ++) {
    triangles = new ArrayList<Triangles>();
    triangles.add(new Triangles(width/2, height/2, 130, 5));
  }
}

void draw() {
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, map(mouseX, 0, width, 20, 30));

  for ( int i = triangles.size ()-1; i >= 3; i --) {
    Triangles t = (Triangles)triangles.get(i);
    t.display(int(map(mouseY, 0, height, 5, 20)));
    t.rotation(0.05*i);
    if (triangles.size()>100) {
      triangles.remove(0);
    }
  }

  textSize(18);
  fill(255);
  text("Drag your mouse to draw", 10, 30);
}

void mouseDragged() {
  triangles.add(new Triangles(lerp(pmouseX, mouseX, 0.95), lerp(pmouseY, mouseY, 0.5), map(mouseX, 0, 1024, 20, 150), 0.5));
  speedR = map((mouseX-pmouseX), 0, 100, 2, 5);
}
class Triangles {

  float x;
  float y;
  float r0;
  float rotation;

  Triangles(float triX, float triY, float triR, float triRotate) {
    x = triX;  //set the x position of the triangles
    y = triY;  //set the y position of the triangles
    r0 = triR;  //set the size of the triangles
    rotation = triRotate;  //set the rotate angle of the triangles
  }

  void rotation(float speed) {
    rotation = rotation + speed;  //set the rotation speed of the triangles
  }

  void display(float number) {
    for (int i = 0; i < number; i = i+1) {
      noStroke();
      colorMode(HSB, 360, 100, 100, 100);
      fill(170+2*i, 360, 340, 60-i);
      pushMatrix();
      translate(x+i, y+i);
      rotate(radians(rotation*(i+1)));
      float r = r0 - 3*i;
      triangle(0, -r, -0.5*(sqrt(3))*r, 0.5*r, 0.5*(sqrt(3))*r, 0.5*r);
      popMatrix();
    }
  }
}


