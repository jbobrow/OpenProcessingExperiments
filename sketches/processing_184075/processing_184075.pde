
int z = 5, nb = 4, mode = 0;
PVector o;
PVector[] pvs = new PVector[nb];

void setup()
{
  size(400, 400, P2D);
  background(10);
  o = new PVector(width/2, height/2);
}

void draw()
{
  fill(220);
  noStroke();
  //  rect(0, 0, width, height);
  PImage p = get();
  p.resize(width + 2*z, height + 2*z);
  pushMatrix();
  translate(width/2, height/2);
  rotate((noise(float(frameCount)/100)-.5)*.8);
  translate(-width/2, -height/2);
  tint(255, 220+(1+sin(float(frameCount)/120))*12, 255);
  image(p, -z, -z);
  popMatrix();

  //fill(255, 166, 0);
  translate(width/2, height/2);
  float t = atan2(mouseY - o.y, mouseX - o.x);
  float d = dist(mouseX, mouseY, o.x, o.y);

  if (mode == 0) {
    stroke((1+cos(float(frameCount)/60)) * 127, 106, (1+sin(float(frameCount)/120)) * 127);
    strokeWeight(4);
    for (int i = 0; i < nb; i ++)
    {
      point(d * cos(t + i * TWO_PI / nb), d * sin(t + i * TWO_PI / nb));
    }
  } else {
    beginShape(TRIANGLE_FAN);
    noFill();
    strokeWeight(2);
    stroke((1+cos(float(frameCount)/60)) * 127, 166, (1+sin(float(frameCount)/120)) * 127);
    vertex(0, 0);
    for (int i = 0; i < nb; i ++)
    {
      vertex(d * cos(t + i * TWO_PI / nb), d * sin(t + i * TWO_PI / nb));
    }
    vertex(d * cos(t), d * sin(t));
    endShape();
  }
}

void keyPressed()
{
  if (keyCode == UP)
    z = min(int(z+map(abs(z), 0, 50, 1, 10)), 50);
  else if (keyCode == DOWN)
    z = max(int(z-map(abs(z), 0, 50, 1, 10)), -50);
  else if (keyCode == LEFT)
    nb = max(nb - 1, 2);
  else if (keyCode == RIGHT)
    nb = min(nb + 1, 20);
  else
    mode = (mode+1)%2;
}



