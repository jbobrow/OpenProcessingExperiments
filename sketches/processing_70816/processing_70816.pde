
// Declare and create the array

int numPetals = 30;
Petal[] pets = new Petal[numPetals];

int numLeaves = 30;
Leaf[] leaves = new Leaf[numLeaves];


// Universals
PFont titleFont;
PFont infoFont;
PFont brushFont;
float o;

void setup() {

  //background homepage image
  size(600, 400);
  background(255);
  smooth();
  PImage homeImage = loadImage("stem.png");
  imageMode(CENTER);
  image(homeImage, width/3 - 40, height/3 * 2 - 15);

  //"petal paint" title
  //String[] fontList = PFont.list();
  //println(fontList);

  titleFont = createFont("BrushtipTravis", 45, true);
  textFont(titleFont);
  fill(255, 182, 183);
  text("Petal Paint", 300, 100);

  infoFont = createFont("BrushtipTravis", 20, true);
  textFont(infoFont);
  fill(10, 100, 10, 100);
  text("hold down letters with mouse click", 280, 200);
  text("to blanket floor with flora", 305, 220);

  brushFont = createFont("BrushtipTravis", 20, true);
  textFont(brushFont);
  fill(10, 10, 10, 100);
  text("floribunda     'f '", 350, 270);
  text("miniature      'm'", 350, 290);
  text("bunches        'b'", 358, 310);
  text("leaves          'l '", 358, 330);

  infoFont = createFont("BrushtipTravis", 20, true);
  textFont(infoFont);
  fill(10, 100, 10, 100);
  text("'s ' to start 'e' to export", 325, 375);

  noStroke();
  for (int i = 0; i < pets.length; i++) {
    float x = mouseX;
    float y = mouseY;
    // Create each object
    pets[i] = new Petal(x, y);
  }

  for (int i = 0; i < leaves.length; i++) {
    float x = mouseX;
    float y = mouseY;
    // Create each object
    leaves[i] = new Leaf(x, y);
  }
}


void draw() {
  //create "start" action to go to drawing screen
  if (keyPressed) {
    if (key == 's') {
      background(255);
    }
  }

  if (keyPressed) {
    if (key == 'f' && mousePressed == true) {
      o = random(0, 255);
      fill(255, random(0, 100), random(0, 100), o);
      for (int i = 0; i < pets.length; i++) {  
        pets[i].spiralf();
      }
    }
  }

  if (keyPressed) {
    if (key == 'm' && mousePressed == true) {
      o = random(0, 255);
      fill(255, random(200, 255), random(200, 255), o);
      for (int i = 0; i < pets.length; i++) {  
        pets[i].spiralm();
      }
    }
  }



  if (keyPressed) {
    if (key == 'b' && mousePressed == true) {
      o = random(0, 255);
      fill(255, random(0, 255), random(0, 255), o);
      for (int i = 0; i < pets.length; i++) {  
        pets[i].bunches();
      }
    }
  }

  if (keyPressed) {
    if (key == 'l' && mousePressed == true) {
      //println("yes");
      o = random(0, 255);
      fill(random(0, 255), 255, random(0, 100), o);
      for (int i = 0; i < leaves.length; i++) {  
        leaves[i].leafDisplay();
      }
    }
  }
  
  if (keyPressed) {
    if (key == 'e') {
      save("petalpaint.png");
      }
    }
  }






// Insert Spot class


