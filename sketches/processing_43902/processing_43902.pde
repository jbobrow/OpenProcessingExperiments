
PImage cranes, cranes2, sky, building;

void setup() {
  size(800, 600);
  cranes = loadImage("cranes.jpg"); 
  cranes2 = loadImage("cranes2.jpg"); 
  sky = loadImage("sky.jpg");
  building = loadImage("build.jpg");
}

void draw() {
  image(cranes, 0, 0);
  image(cranes2, 400, 0);
  image(sky, 0, 300);
  image(building, 400, 300);


  //black grid
  strokeWeight(25);
  fill(0);
  line(0, height/2, width, height/2);
  line(0, 10, width, 10);
  line(0, height-10, width, height-10);
  line(width/2, 0, width/2, height);
  line(10, 0, 10, height);
  line(width-10, 0, width-10, height);

  // top left image
  if (mouseX < 400 && mouseY < 300 && mousePressed) {
    cranes.filter(GRAY);
    cranes.filter(BLUR, 2);
  }

  // top right image
  if (mouseX > 400 && mouseY < 300 && mousePressed) {
    cranes2.filter(BLUR, 0.5);
    cranes2.filter(DILATE);
  }

  // bottom left image
  if (mouseX < 400 && mouseY > 300 && mousePressed) {
    fill(0, 0, 190);
    sky.filter(THRESHOLD, 1);
    sky.filter(DILATE);
  }

  // bottom right image
  if (mouseX > 400 && mouseY > 300 && mousePressed) {
    building.filter(INVERT);
    building.filter(BLUR);
  }
}


