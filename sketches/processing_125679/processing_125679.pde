
import javax.swing.JOptionPane;

final int MaxPlants = 100;
int numPlants;
String plantType;
PImage plantImage;
int wholeNumber;

void setup() {
  size(500, 500);
  numPlants = getIntInput("How many plants?");
  while (numPlants > MaxPlants || numPlants < 0) {
    numPlants = getIntInput("Number must be between 0 & 100.  How many plants?");
} plantType = getTextInput("What kind of plant?");
  while (!(plantType.equals("carrot") || plantType.equals("tomato") || plantType.equals("flower"))) {
    plantType = getTextInput("Plant must be carrot, flower, or tomato.  What kind of plant?");
} smooth();
  textSize(20);
  textAlign(CENTER);
  plantImage = loadImage(plantType + ".png");
}

void draw() {
  background(100);
  drawButton (25, 25);}

void drawButton(int x, int y) {
  strokeWeight(2);
  fill(148, 238, 79);
  rect(25, 25, 150, 50);
  fill(0);
  text("Plant " + plantType, 100, 60);
//  if (plantType.equals("carrot")) {
//    text("Plant carrots", 100, 60);}
//    else if (plantType.equals("tomato")) {
//      text("Plant tomatoes", 100, 60);}
//      else if (plantType.equals("flower")) {
//        text("Plant flowers", 100, 60);}
  if (mousePressed == true) {
    drawLayout(25, 100);}
}

void drawLayout(int a, int b) {
  image (plantImage, 25, 100, 50, 50);
}
  
  
/// PROVIDED FUNCTIONS (any modifications should be clearly documented)

int nearestSquare (int numPlants) {
  int i;

  for ( i=0 ; i <= sqrt (MaxPlants) ; i++ ) {
    if ( i*i >= numPlants) {
      return (i);
    }
  }
  println ("ERROR: no nearest square for " + numPlants);
  exit();
  return(0);
}

int getIntInput(String query) {
  return Integer.parseInt(JOptionPane.showInputDialog (query));
}

String getTextInput (String query) {
  return JOptionPane.showInputDialog (query);
}

void keyPressed() {
  if (key == 's') {
    save("flowers.png");
  }
}


