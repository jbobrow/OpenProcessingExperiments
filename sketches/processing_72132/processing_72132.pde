
head[] people;
int folks;

color bgColor;

void setup() {
  
  size(800, 600);
  smooth();

  colorMode(HSB, 360, 100, 100, 100);

  createFolks();

  bgColor = color(random(360), 15, 100);
}

void draw() {
  background(bgColor);

  for (int i = 0; i < folks; i++) {
    people[i].update();
    people[i].draw();
  }
}

void mouseClicked() {
  
  createFolks();
  bgColor = color(random(360), 20, 100);

}

void createFolks() {
  
  folks = (int) random(1, 4);
  people = new head[folks];
  
  for (int i = 0; i < folks; i++) {
    people[i] = new head(folks, i);
  }

}


