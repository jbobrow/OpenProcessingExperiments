
//fill(200,0,245);

//lesson2

color[] palette = {
  #C71B1B, #D6BA8A, #017467, #E08F23, #0B0D0C
};
String[] pufi = {
  "Pufi!", "smotocei", "pupicei", "pup pup", "ce faci pufi", "pufi pufi pufi!"
};


void setup() {
  size(800, 600);
  background(palette[2]);
}

void draw() {

  PFont helvetica = loadFont("helveticaneue.vlw");
  textFont(helvetica);
  textAlign(CENTER);
  textSize(int(random(20,100)));
  float r = random(5);

  frameRate(15);
  fill(palette[int(r)]);

  text(pufi[int(random(6))], random(width), random(height));
}



