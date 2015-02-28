
PImage meggy;

String [] names = {
  "Megan", "Sweet lime", "Meggy", "Percy", "Meg", "Hello", "How are you?", "I miss you!", "Boo", "meow", "Bang on", "Meg", "Let's dance?", "Hide and seek?", "Porridge", "Geography", "Hills!", "MWA MWA"
};
int endingPoint = 0;

void setup() {
  size(600, 600);
  meggy = loadImage("Meg.jpg");
}

void draw() {
  background(0);
  image(meggy, 0, 0);
  // Every couple of seconds...increase the number of names we draw
  if (frameCount%240==0) {
    endingPoint += 1;
    if (endingPoint > names.length) {
      endingPoint = 0;
    }
  }

  // Display the names from the names array...up to the endingPoint, whatever it happens to be in this frame
  for (int i = 0; i < endingPoint; i++) {
    fill(255);
    textSize(random(50));
    text(names[i], random(width), random(height));
  }
  

}


