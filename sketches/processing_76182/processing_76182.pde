
void menu() {
  if (menu == true) {
    //play button
    if (mouseX>500 && mouseX<700 && mouseY>290 && mouseY<390) {
      background(menuBackground);
      playbutton = true;
    }
    else
      if (mouseX>500 && mouseX<700 && mouseY>430 && mouseY<5300) {
        background(menuBackground);
        rulesbutton = true;
      }
      else {
        background(menuBackground);
        playbutton = false;
        rulesbutton = false;
      }
 
    fill(91, 91, 91);
    rect(500, 290, 200, 100);
    stroke(1);
    fill(200);
    textFont(KristenITC, 37);
    text("Play Game", 508, 350, 30);
 
    //rules button
    fill(91, 91, 91);
    rect(500, 430, 200, 100);
    stroke(1);
    fill(200);
    textFont(KristenITC, 37);
    text("Rules", 550, 490, 30);
  }
 
  //group signiture
  fill(205, 179, 139);
  smooth();
  textFont(KristenITC, 15);
  text("© Batman Math Revenge", 30, 510, 30);
  text("created by Andrew Rae, Claire D'All,", 30, 530, 30);
  text("Matt Hilley & Kevin McDonald (Group 3)", 30, 550, 30);
  text("Data Visualisation, AC21010", 30, 570, 30);
}
 
void rulesPage() {
  background(menuBackground);
  fill(91, 91, 91);
  rect(500, 290, 200, 100);
  stroke(1);
  fill(200);
  textFont(KristenITC, 37);
  text("Menu", 538, 350, 30);
  textFont(KristenITC, 15);
  text("The objective of the game is to get batman to kill the enemies according to the numbers on them.", 270,450,30);
  text("Jump on two enemies that add up to the answer in the top right", 380, 470, 30);
  text("Use LEFT and RIGHT to move batman. SPACE to jump.", 405, 490,30);
  if (mouseX>500 && mouseX<700 && mouseY>290 && mouseY<390) {
    menu = true;
  }
}
void mouseClicked() {
  if (playbutton == true) {
    play = true;
  }
  else {
    play = false;
  }
  if (rulesbutton == true) {
    menu = false;
    rulesPage();
  }
}

