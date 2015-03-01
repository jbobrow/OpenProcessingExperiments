
PShape s;

void setup() {
  size(1000, 600);

  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("vectorizado_2.svg");
}

void draw() {
  shape(s);
}



