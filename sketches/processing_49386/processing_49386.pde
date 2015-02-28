
import controlP5.*;

int CONTROL_WIDTH = 100;
int CONTROL_HEIGHT = 10;
int CONTROL_SPACING = 2;

ControlP5 controls;
int WIDTH = 800;
int HEIGHT = 400;
public float ZOOM = 2.0;
public int N = 400;
public int MAX_N = 3000;
public float RADIUS = HEIGHT/10;
public float SPEED = 2.0;
public float FOCAL_LENGTH = 0.5;
public float BLUR_AMOUNT = 40.0;
public int MIN_BLUR_LEVELS = 2;
public int BLUR_LEVEL_COUNT = 5;
public float ZOOM_SPEED = 5.0;
public float VISIBILITY_RANGE = 0.95;
color BACKGROUND = color(0, 30, 30);


class ZObject implements Comparable {
  float x, y, z;
  color bubble_color;
  color shaded_color;
  float vx, vy, vz;
 
  ZObject(float ix, float iy, float iz, color icolor) {
    x = ix;
    y = iy;
    z = iz;
    bubble_color = icolor;
    setColor();
    vx = random(-1.0, 1.0);
    vy = random(-1.0, 1.0);
    vz = random(-1.0, 1.0);
  }
  
  void setColor() {
    float shade = z;
    float shadeinv = 1.0-shade;
    shaded_color = color( (red(bubble_color)*shade)+(red(BACKGROUND)*shadeinv),
                    (green(bubble_color)*shade)+(green(BACKGROUND)*shadeinv),
                    (blue(bubble_color)*shade)+(blue(BACKGROUND)*shadeinv));
  }
  
  void zoomIn(float step) {
    z += step;
    if (z > 1.0) {
      z = 0.0 + (z-1.0);
    }
  }
  
  void zoomOut(float step) {
    z -= step;
    if (z < 0.0) {
      z = 1.0 - (0.0-z);
    }
  }
 
  void update(boolean doZoomIn, boolean doZoomOut) {
    if (doZoomIn) {
      zoomIn(ZOOM_SPEED * 0.0006);
    }
    if (doZoomOut) {
      zoomOut(ZOOM_SPEED * 0.0006);
    }
    if (x < 0) {
        vx = abs(vx);
        x = 0.0f;
    }
    if (x > 1.0) {
        vx = -1.0 * abs(vx);
        x = 1.0;
    }
    if (y < 0) {
        vy = abs(vy);
        y = 0.0f;
    }
    if (y > 1.0) {
        vy = -1.0 * abs(vy);
        y = 1.0;
    }
    if (z < 0.0) {
      z = 1.0 - (0.0-z);
    }
    if (z > 1.0) {
      z = 0.0 + (z-1.0);
    }
    float magnitude = sqrt(vx*vx + vy*vy + vz*vz);
    vx = SPEED * 0.0001 * vx / magnitude;
    vy = SPEED * 0.0001 * vy / magnitude;
    vz = SPEED * 0.0001 * vz / magnitude;
    // float n = (noise(x, y) - 0.5) * 0.00001;
    // vx += n;
    // vy += n;
    x += vx;
    y += vy;
    z += vz;
    setColor();
  }
 
  void draw(float xoffs, float yoffs) {
    float dz = (z*z+1.0)*ZOOM;
    xoffs = (xoffs-0.5)/2 + 0.5;
    yoffs = (yoffs-0.5)/2 + 0.5;
    float posX = (float)WIDTH * ((x - xoffs)*dz + 0.5);
    float posY = (float)HEIGHT * ((y - yoffs)*dz + 0.5);
    float radius = z*RADIUS;
    float a = 1.0;
    if (z > VISIBILITY_RANGE) {
      a = (VISIBILITY_RANGE-z)/(1.0-VISIBILITY_RANGE)+1.0;
    }
    if (posX> -RADIUS*2 && posX < WIDTH+RADIUS*2 && posY > -RADIUS*2 && posY < HEIGHT+RADIUS*2) {
        blurred_circle(posX, posY, radius, abs(z-FOCAL_LENGTH), shaded_color, a);
    }
  }
  
  int compareTo(Object o) {
    ZObject other = (ZObject)o;
    if(other.z>z)  
      return -1;
    if(other.z<z)
      return 1;
    else
      return 0;
  }
}

// This function will draw a blurred circle, according to the "blur" parameter. Need to find a good radial gradient algorithm.
void blurred_circle(float x, float y, float rad, float blur, color col, float a) {
    float levels = MIN_BLUR_LEVELS + (blur*BLUR_LEVEL_COUNT);
    float level_distance = BLUR_AMOUNT*blur/levels;
    for (float i=0.0; i<=levels*2.0; i += 1.0) {
      fill(col, 255.0*(levels*2.0-i)/(levels*2.0)*a);
      ellipse(x, y, rad+(i-levels)*level_distance, rad+(i-levels)*level_distance);
    }
}

void sortBubbles() {
    // Sort them by Z value (this ensures that they are drawn in the right order)
    Arrays.sort(objects, 0, min(N, objects.length));
}


ZObject[] objects;
void setup() {
    size(800, 400);
    smooth();
    noStroke();
    
    int y = CONTROL_SPACING;
    controls = new ControlP5(this);
    controls.addSlider("MIN_BLUR_LEVELS", 0, 5, MIN_BLUR_LEVELS, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("BLUR_LEVEL_COUNT", 0, 10, BLUR_LEVEL_COUNT, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("BLUR_AMOUNT", 0.0, 200.0, BLUR_AMOUNT, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("ZOOM", 1.0, 4.0, ZOOM, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("ZOOM_SPEED", 1.0, 10.0, ZOOM_SPEED, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("FOCAL_LENGTH", 0.0, 1.0, FOCAL_LENGTH, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("N", 0, MAX_N, N, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("RADIUS", 1, HEIGHT/4, RADIUS, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);
    controls.addSlider("SPEED", 0.0, 5.0, SPEED, 5, y+=CONTROL_SPACING+CONTROL_HEIGHT, 100, CONTROL_HEIGHT);

    objects = new ZObject[MAX_N];
    for (int i=0; i<MAX_N; i++) {
      objects[i] = new ZObject(random(1.0f), random(1.0f), random(1.0f), color(random(20.0, 20.0), random(150.0, 190.0), random(150.0, 190.0)));
    }
}


boolean zoomIn = false;
boolean zoomOut = false;
void mousePressed() {
  if (mouseButton == LEFT) {
    zoomIn = true;
  } else if (mouseButton == RIGHT) {
    zoomOut = true;
  }
}
void mouseReleased() {
  if (mouseButton == LEFT) {
    zoomIn = false;
  } else if (mouseButton == RIGHT) {
    zoomOut = false;
  }
}

void addBubble() {
  //objects.add(new ZObject(random(1.0f), random(1.0f), random(1.0f), color(random(20.0, 20.0), random(150.0, 190.0), random(150.0, 190.0))));
}

float xoffs = 0;
float yoffs = 0;
void draw() {
  background(BACKGROUND);
  xoffs = xoffs*0.9 + 0.1*((float)mouseX/(float)WIDTH);
  yoffs = yoffs*0.9 + 0.1*((float)mouseY/(float)HEIGHT);
  
  for (int i=0; i<min(N, objects.length); i++) {
    ZObject current = (ZObject)objects[i];
    current.update(zoomIn, zoomOut);
  }
  sortBubbles();
  
  for (int i=0; i<N; i++) {
    ((ZObject)objects[i]).draw(xoffs, yoffs);
  }
}                                                                                                                                                                               

