
void setup() {
  size(400, 400);  //Set the size at 400x400 pixels, the limit for the static
  smooth(); //Enablle anti-aliasing
  background(#5CCB63); //Makes a green-ish color background
}
DrawCarpet rug = new DrawCarpet();
void draw() {
  rug.drawCarp();
  drawTables();
  drawChairs();
  drawBoard();
}

void drawTables() {
  rectMode(CORNER);
  fill(#B542D8); //Makes a light purple-ish fill
  stroke(0);
  strokeWeight(3); //Outlines the following desks
  rect(mouseX, mouseY, 130, 50, 20);
  rect(30, 300, 130, 50, 20);
  rect(210, 180, 130, 50, 20);
  rect(210, 300, 130, 50, 20); //Creates the 4 desks
}

void drawChairs() {
  strokeWeight(6); //Increases the outline to something more pronounced
  fill(#030202); //
  arc(70, 238, 30, 25, 0, PI);
  arc(115, 238, 30, 25, 0, PI);
  arc(250, 238, 30, 25, 0, PI);
  arc(295, 238, 30, 25, 0, PI); //Chairs of the first row

  arc(70, 358, 30, 25, 0, PI);
  arc(115, 358, 30, 25, 0, PI);
  arc(250, 358, 30, 25, 0, PI);
  arc(295, 358, 30, 25, 0, PI); //Chairs of the second row
}

void drawBoard() { 
  fill(255);
  strokeWeight(5);
  rect(80, 50, 230, 70); //Creates a smartboard
}
class DrawCarpet {
  void DrawCarpet(){}
void drawCarp() {
  //Draw a multi-square carpet
  for (int i = 0; i<width; i+=10) {
    rectMode(CENTER);
    strokeWeight(1);
    noFill();
    //stroke(random(256),random(256),random(256),random(256));
    rect(200, 200, i, i);
    }
  }
}


