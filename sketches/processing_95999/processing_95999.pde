
float p; // Current p-coordinate
float q; // Current q-coordinate
float targetP; // Destination p-coordinate
float targetQ; // Destination q-coordinate
float u; // Current u-coordinate
float v; // Current v-coordinate
float targetU; // Destination u-coordinate
float targetV; // Destination v-coordinate
float easing; // Size of each step along the path
float zoom =1.0;
float change = 0.002;
float zoom_out=1;
float zoom_direction = 1.0;


color white = color(255);
color dark = color(0);
color rose = color(255, 0, 0);

String message_1 = "UMBRELLA CORP.";
String message_2 = "Our Business is Life Itself.";

void setup() {
  size (400, 400);

  // Set the initial position
  p = -20;
  q = 2*height/3+10;
  // Set the final/target position
  targetP = width/2;
  targetQ = 2*height/3+10;
  // Set the initial position
  u = 420;
  v = 3*height/4;
  // Set the final/target position
  targetU = width/2;
  targetV = 3*height/4;
  // Adapt the position by 3% each update
  easing = 0.03;
}

void draw() {
  background(0);
  smooth();
  //message();
  //message_tenet();

  //easing
  if (dist(p, q, targetP, targetQ) > 1.0) {
    // Update the current position towards the target position
    p += (targetP - p) * easing;
    q += (targetQ - q) * easing;
  }
  message(p, q);
  if (dist(u, v, targetU, targetV) > 1.0) {
    // Update the current position towards the target position
    u += (targetU - u) * easing;
    v += (targetV - v) * easing;
  }
  message_tenet(u, v);

  translate(200, 150);

  zoom += change * zoom_direction;

  if (zoom >= 1.0)
  {
    zoom_direction = -1.0;
  }

  if (zoom <= 0.5)
  {
    zoom_direction = 1.0;
  }

  scale(zoom);
  flabellum_rose();

  //scale(zoom);
  rotate(radians(90));
  flabellum_rose();

  //scale(zoom);
  rotate(radians(90));
  flabellum_rose();

  //scale(zoom);
  rotate(radians(90));
  flabellum_rose();


  scale(zoom);
  flabellum_white();

  //scale(zoom);
  rotate(radians(45));
  flabellum_white();

  //scale(zoom);
  rotate(radians(45));
  flabellum_white();

  //scale(zoom);
  rotate(radians(45));
  flabellum_white();
}

void flabellum_white() {
  fill(white);

  noStroke();
  smooth();
  rotate(radians(45));
  flabellum();
}

void flabellum_rose() {
  fill(rose);

  noStroke();
  smooth();
  flabellum();
}

void flabellum() {
  noStroke();
  smooth();
  beginShape();
  vertex(92.0, 38.0);
  bezierVertex(92.0, 38.0, 0.0, 0.0, 0.0, 0.0);
  bezierVertex(0.0, 0.0, 92.0, -38.0, 92.0, -38.0);
  bezierVertex(92.0, -38.0, 78.0, -6.0, 92.0, 38.0);
  endShape();
}

void message(float p, float q) {
  float textHeight = 3*height/40;
  PFont chunkfive = createFont("/media/css/Chunkfive-webfont.ttf", int(textHeight));
  fill(white);
  textFont(chunkfive);
  textAlign(CENTER, CENTER);
  text(message_1, p, q);
}

void message_tenet(float u, float v) {
  float textHeight = height/30;
  PFont chunkfive = createFont("/media/css/Chunkfive-webfont.ttf", int(textHeight));
  fill(white);
  textFont(chunkfive);
  textAlign(CENTER, CENTER);
  text(message_2, u, v);
}
