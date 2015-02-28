
ArrayList toggles;
String[] modes = {
  "NOTES", "MEDIUM", "PAPER", "SIZE", "LOCATION", "DATE"
};
int modeNum = 5;
String[] annotations = {
  "Visualize by Amount of Field Notation", "Visualize by Representation Medium", "Visualize by Paper Type", "Visualize by Image Size", "Visualize by Location Category", "Visualize by Proliferation Over Time"
};
float factor = 4.8;

void initiateClasses() {
  toggles = new ArrayList();
  for (int i = 0; i < modes.length; i++) {
    String name = modes[i];
    float x = width - float(i + 1)*70;
    toggles.add(new GridToggle(name, x));
  }
}

class GridToggle {
  String name;
  float xPos;

  GridToggle(String n, float x) {
    name = n;
    xPos = x;
  }

  void display(int i, boolean over) {
    rectMode(CORNER);
    if (modeNum == i) {
      fill(yellow);
    } 
    else {
      fill(0);
    }
    stroke(255);
    rect(xPos, height - 30, 70, 30);

    fill(255);
    textFont(font1);
    textAlign(CENTER, CENTER);
    text(name, xPos + 35, height - 15);

    if (over) {
      fill(0);
      noStroke();
      beginShape();
      vertex(xPos + 25, height - 40);
      vertex(xPos + 35, height - 30);
      vertex(xPos + 45, height - 40);
      endShape();
      if (i == 0) {
        rect(xPos + 35 - (annotations[i].length()*factor)/2 - 40, height - 60, annotations[i].length()*factor, 20);
        fill(255);
        text(annotations[i], xPos + 35 - 40, height - 52);
      }
      else {
        rect(xPos + 35 - (annotations[i].length()*factor)/2, height - 60, annotations[i].length()*factor, 20);
        fill(255);
        text(annotations[i], xPos + 35, height - 52);
      }
    }
  }

  boolean isOver(int i) {
    return mouseX > xPos && mouseX < xPos + 70 && mouseY > height - 30 && mouseY < height;
  }

  void clicked(int togSelect) {
    if (mouseX > xPos && mouseX < xPos + 70 && mouseY > height - 30 && mouseY < height) modeNum = togSelect;
  }
}


