
PVector[] points = new PVector[25];
PVector[] speeds = new PVector[25];
color[] colors = new color[25];

color getClosest(int x, int y) {
  float len = dist(points[0].x, points[0].y, x, y);
  color ret = colors[0];
  for (int i = 0; i < points.length; i++) {
    float nl = dist(points[i].x, points[i].y, x, y);
    if (nl < len)
    {
      len = nl;
      ret = colors[i];
    } 
    else if ((nl - len) < 0.5) {
      float nh = (hue(ret) + hue(colors[i])) / 2;
      float ns = (saturation(ret) + saturation(colors[i])) / 2;
      float nb = (brightness(ret) + brightness(colors[i])) / 2;
      ret = color(nh, ns, nb);
    }
  }
  return ret;
}

void setup() {
  size(512, 512, P2D);
  colorMode(HSB);
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector(random(width), random(height));
    speeds[i] = new PVector(random(2) - 1, random(2) - 1);
    colors[i] = color(random(255), random(127), random(127) + 127);
  }
}

void draw () {
  for (int i = 0; i < points.length; i++) {
    points[i].add(speeds[i]);
    points[i].x %= width;
    points[i].y %= height;
  }
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;
    pixels[i] = getClosest(x, y);
  }
  updatePixels();
  //saveFrame("Voronoi-####.png");
}


