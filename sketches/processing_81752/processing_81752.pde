
// Approx GPS Data Locations.
// X axis. GPS Data.  Left Side is -11. right is 1.9
// Y axis. GPS Data.  Top is 60.92. Bottom is 49

PImage uk;
int z;
float r, g, b, s;

void draw() {
  if (preload == true) {
    loading();
    preload();
  }
  if (preload == false) {
    if (welcome==true) {
      welcome();
    }
  }
  if (menu==true) {
    menu();
  }

  if (run==true) {
    bg();
    airports();
  }
  if (about==true) {
    about();
  }

  if (help==true) {
    help();
  }

  if (prequit==true) {
    prequit();
  }

  if (quit==true) {
    quit();
  }
}


void mouseClicked() {
  if (clicked == false) {
    clicked = true;
  } 
  else {
    clicked = false;
  }
}


