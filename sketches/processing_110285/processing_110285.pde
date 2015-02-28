
//Coloring Mondrian [9.13.17]
//Arielle Hein

color yellowColor = color(255, 215, 0);
color blueColor = color(0, 0, 102);
color redColor = color(255, 0, 0);
color blackColor= color(0, 0, 0);

int rect5X= 745, rect5Y = 10, rect5Width = 45, rect5Height= 250; //rect 5 (YELLOW)
int rect6X= 55, rect6Y = 40, rect6Width = 300, rect6Height= 60; //rect 6 (BLUE)
int rect8X=485, rect8Y=40, rect8Width=215, rect8Height=60; //rect 8 (BLUE)
int rect9X=10, rect9Y=100, rect9Width=45, rect9Height=240; //rect 9 (BLACK)
int rect11X=140, rect11Y=100, rect11Width=50, rect11Height=400; //rect 11 (BLACK)
int rect14X=355, rect14Y=100, rect14Width=130, rect14Height=160; //rect 14 (YELLOW)
int rect15X=485, rect15Y=100, rect15Width=170, rect15Height=160; //rect 15 (RED)
int rect16X=655, rect16Y=100, rect16Width=45, rect16Height=160; //rect 16 (RED)
int rect17X=190, rect17Y=260, rect17Width=40, rect17Height=80; //rect 17 (YELLOW)
int rect18X=230, rect18Y=260, rect18Width=125, rect18Height=80; //rect 18 (RED)
int rect19X=355, rect19Y=260, rect19Width=130, rect19Height=80; //rect 19 (BLUE)
int rect22X=700, rect22Y=260, rect22Width=90, rect22Height=80; //rect 22 (BLACK)
int rect24X=55, rect24Y=340, rect24Width=85, rect24Height=160; //rect 24 (RED)
int rect25X=190, rect25Y=340, rect25Width=40, rect25Height=220; //rect 25 (YELLOW)
int rect28X=585, rect28Y=340, rect28Width=70, rect28Height=120; //rect 28 (BLUE)
int rect29X=655, rect29Y=340, rect29Width=45, rect29Height=120; //rect 29 (YELLOW)
int rect32X=230, rect32Y=460, rect32Width=125, rect32Height=100; //rect 32 (RED)
int rect33X=355, rect33Y=460, rect33Width=230, rect33Height=100; //rect 33 (BLACK)

void setup() {
  size(800, 570);
  strokeWeight(8);
  
  //Composition is composed of rectangles, ones with color are defined by variables above
  rect(rect5X, rect5Y, rect5Width, rect5Height); //rect 5 (YELLOW)
  rect(rect6X, rect6Y, rect6Width, rect6Height); //rect 6 (BLUE)
  rect(rect8X, rect8Y, rect8Width, rect8Height); //rect 8 (BLUE)
  rect(rect9X, rect9Y, rect9Width, rect9Height); //rect 9 (BLACK)
  rect(rect11X, rect11Y, rect11Width, rect11Height); //rect 11 (BLACK)
  rect(rect14X, rect14Y, rect14Width, rect14Height); //rect 14 (YELLOW)
  rect(rect15X, rect15Y, rect15Width, rect15Height); //rect 15 (RED)
  rect(rect16X, rect16Y, rect16Width, rect16Height); //rect 16 (RED)
  rect(rect17X, rect17Y, rect17Width, rect17Height); //rect 17 (YELLOW)
  rect(rect18X, rect18Y, rect18Width, rect18Height); //rect 18 (RED)
  rect(rect19X, rect19Y, rect19Width, rect19Height); //rect 19 (BLUE)
  rect(rect22X, rect22Y, rect22Width, rect22Height); //rect 22 (BLACK)
  rect(rect24X, rect24Y, rect24Width, rect24Height); //rect 24 (RED)
  rect(rect25X, rect25Y, rect25Width, rect25Height); //rect 24 (YELLOW)
  rect(rect28X, rect28Y, rect28Width, rect28Height); //rect 28 (BLUE)
  rect(rect29X, rect29Y, rect29Width, rect29Height); //rect 29 (YELLOW)
  rect(rect32X, rect32Y, rect32Width, rect32Height); //rect 32 (RED)
  rect(rect33X, rect33Y, rect33Width, rect33Height); //rect 33 (BLACK)
  
  //Now, setup the rectangles that are just white
  rect(10, 10, 45, 90); //rect 1
  rect(55, 10, 300, 30); //rect 2
  rect(355, 10, 345, 30); //rect 3
  rect(700, 10, 45, 250); //rect 4
  rect(355, 40, 130, 60); //rect 7
  rect(55, 100, 85, 240); //rect 10
  rect(190, 100, 120, 160); //rect 12
  rect(310, 100, 45, 160); //rect 13
  rect(485, 260, 170, 80); //rect 20
  rect(655, 260, 45, 80); //rect 21
  rect(10, 340, 45, 160); //rect 23
  rect(230, 340, 210, 120); //rect 26
  rect(440, 340, 145, 120); //rect 27
  rect(700, 340, 90, 120); //rect 30
  rect(10, 500, 180, 60); //rect 31
  rect(585, 460, 205, 100); //rect 34
}

void draw() {
}

void mousePressed() {
  if (mouseX > rect5X && mouseX < rect5X + rect5Width && mouseY > rect5Y && mouseY < rect5Y + rect5Height) {
    fill(yellowColor);
    rect(rect5X, rect5Y, rect5Width, rect5Height);
  }
  if (mouseX > rect6X && mouseX < rect6X + rect6Width && mouseY > rect6Y && mouseY < rect6Y + rect6Height) {
    fill(blueColor);
    rect(rect6X, rect6Y, rect6Width, rect6Height);
  }
  if (mouseX > rect8X && mouseX < rect8X + rect8Width && mouseY > rect8Y && mouseY < rect8Y + rect8Height) {
    fill(blueColor);
    rect(rect8X, rect8Y, rect8Width, rect8Height);
  }
  if (mouseX > rect9X && mouseX < rect9X + rect9Width && mouseY > rect9Y && mouseY < rect9Y + rect9Height) {
    fill(blackColor);
    rect(rect9X, rect9Y, rect9Width, rect9Height);
  }
  if (mouseX > rect11X && mouseX < rect11X + rect11Width && mouseY > rect11Y && mouseY < rect11Y + rect11Height) {
    fill(blackColor);
    rect(rect11X, rect11Y, rect11Width, rect11Height);
  }
  if (mouseX > rect14X && mouseX < rect14X + rect14Width && mouseY > rect14Y && mouseY < rect14Y + rect14Height) {
    fill(yellowColor);
    rect(rect14X, rect14Y, rect14Width, rect14Height);
  }
  if (mouseX > rect15X && mouseX < rect15X + rect15Width && mouseY > rect15Y && mouseY < rect15Y + rect15Height) {
    fill(redColor);
    rect(rect15X, rect15Y, rect15Width, rect15Height);
  }
  if (mouseX > rect16X && mouseX < rect16X + rect16Width && mouseY > rect16Y && mouseY < rect16Y + rect16Height) {
    fill(redColor);
    rect(rect16X, rect16Y, rect16Width, rect16Height);
  }
  if (mouseX > rect17X && mouseX < rect17X + rect17Width && mouseY > rect17Y && mouseY < rect17Y + rect17Height) {
    fill(yellowColor);
    rect(rect17X, rect17Y, rect17Width, rect17Height);
  }
  if (mouseX > rect18X && mouseX < rect18X + rect18Width && mouseY > rect18Y && mouseY < rect18Y + rect18Height) {
    fill(redColor);
    rect(rect18X, rect18Y, rect18Width, rect18Height);
  }
  if (mouseX > rect19X && mouseX < rect19X + rect19Width && mouseY > rect19Y && mouseY < rect19Y + rect19Height) {
    fill(blueColor);
    rect(rect19X, rect19Y, rect19Width, rect19Height);
  }
  if (mouseX > rect22X && mouseX < rect22X + rect22Width && mouseY > rect22Y && mouseY < rect22Y + rect22Height) {
    fill(blueColor);
    rect(rect22X, rect22Y, rect22Width, rect22Height);
  }
  if (mouseX > rect24X && mouseX < rect24X + rect24Width && mouseY > rect24Y && mouseY < rect24Y + rect24Height) {
    fill(redColor);
    rect(rect24X, rect24Y, rect24Width, rect24Height);
  }
  if (mouseX > rect25X && mouseX < rect25X + rect25Width && mouseY > rect25Y && mouseY < rect25Y + rect25Height) {
    fill(yellowColor);
    rect(rect25X, rect25Y, rect25Width, rect25Height);
  }
  if (mouseX > rect28X && mouseX < rect28X + rect28Width && mouseY > rect28Y && mouseY < rect28Y + rect28Height) {
    fill(blueColor);
    rect(rect28X, rect28Y, rect28Width, rect28Height);
  }
  if (mouseX > rect29X && mouseX < rect29X + rect29Width && mouseY > rect29Y && mouseY < rect29Y + rect29Height) {
    fill(yellowColor);
    rect(rect29X, rect29Y, rect29Width, rect29Height);
  }
  if (mouseX > rect32X && mouseX < rect32X + rect32Width && mouseY > rect32Y && mouseY < rect32Y + rect32Height) {
    fill(redColor);
    rect(rect32X, rect32Y, rect32Width, rect32Height);
  }
  if (mouseX > rect33X && mouseX < rect33X + rect33Width && mouseY > rect33Y && mouseY < rect33Y + rect33Height) {
    fill(blackColor);
    rect(rect33X, rect33Y, rect33Width, rect33Height);
  }
}

void keyPressed() { //press key to clear back to white
  fill(255);
  rect(rect5X, rect5Y, rect5Width, rect5Height); //rect 5 (YELLOW)
  rect(rect6X, rect6Y, rect6Width, rect6Height); //rect 6 (BLUE)
  rect(rect8X, rect8Y, rect8Width, rect8Height); //rect 8 (BLUE)
  rect(rect9X, rect9Y, rect9Width, rect9Height); //rect 9 (BLACK)
  rect(rect11X, rect11Y, rect11Width, rect11Height); //rect 11 (BLACK)
  rect(rect14X, rect14Y, rect14Width, rect14Height); //rect 14 (YELLOW)
  rect(rect15X, rect15Y, rect15Width, rect15Height); //rect 15 (RED)
  rect(rect16X, rect16Y, rect16Width, rect16Height); //rect 16 (RED)
  rect(rect17X, rect17Y, rect17Width, rect17Height); //rect 17 (YELLOW)
  rect(rect18X, rect18Y, rect18Width, rect18Height); //rect 18 (RED)
  rect(rect19X, rect19Y, rect19Width, rect19Height); //rect 19 (BLUE)
  rect(rect22X, rect22Y, rect22Width, rect22Height); //rect 22 (BLACK)
  rect(rect24X, rect24Y, rect24Width, rect24Height); //rect 24 (RED)
  rect(rect25X, rect25Y, rect25Width, rect25Height); //rect 24 (YELLOW)
  rect(rect28X, rect28Y, rect28Width, rect28Height); //rect 28 (BLUE)
  rect(rect29X, rect29Y, rect29Width, rect29Height); //rect 29 (YELLOW)
  rect(rect32X, rect32Y, rect32Width, rect32Height); //rect 32 (RED)
  rect(rect33X, rect33Y, rect33Width, rect33Height); //rect 33 (BLACK)
}
