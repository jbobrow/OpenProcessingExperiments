
// import processing.opengl.*;

final static int R = 1000;
PMatrix3D cam;
float[][] stars;

void setup()
{
  size(800, 800, P3D); //OPENGL);
  frameRate(30);
  sphereDetail(1);
  textFont(createFont("Monaco", 14));
  stars = new float[1500][3];
  for(int i = 0; i < stars.length; i++)
  {
    float p = random(-PI, PI);
    float t = asin(random(-1, 1));
    stars[i] = new float[] {
      R * cos(t) * cos(p),
      R * cos(t) * sin(p),
      R * sin(t)
    };
  }
  cam = new PMatrix3D();
}

void draw()
{
  cam.rotateX(-(mouseY - height / 2.0) / height / 20);
  cam.rotateY(-(mouseX - width  / 2.0) / width  / 20);
  PVector x = cam.mult(new PVector(1, 0, 0), new PVector(0, 0, 0));
  PVector y = cam.mult(new PVector(0, 1, 0), new PVector(0, 0, 0));
  PVector d = x.cross(y); d.normalize(); d.mult(R);
  background(0);
  noStroke();
  camera(0, 0, 0, d.x, d.y, d.z, y.x, y.y, y.z);
  for(int i = 0; i < stars.length; i++)
  {
    pushMatrix();
    float[] p = stars[i];
    translate(stars[i][0], stars[i][1], stars[i][2]);
    sphere(5);
    popMatrix();
  }
  camera();
  stroke(255);
  line(width / 2 - 9, height / 2 - 0, width / 2 + 8, height / 2 + 0);
  line(width / 2 - 0, height / 2 - 9, width / 2 + 0, height / 2 + 8);
}


