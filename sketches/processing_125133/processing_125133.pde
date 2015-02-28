
/* @pjs preload="TitleScreen.vlw,forest.jpg,desert.jpg,mountains.jpg,caves.jpg"; */

PFont titleScreen;
PImage wizardBackground, monsterBackground, fairyBackground, villagersBackground;
PShape wizardImage, monsterImage, fairyImage, villagersImage;
boolean click, didOnce;
int state, textState;
int playerDamage, playerHealth, wizardHealth, monsterHealth, fairyHealth;
boolean helm, cookie, hug, net, wizardDead, monsterDead, fairyDead, villagersDead, wizardCurse, enslavedVillager;
String char1, char2, char3, char4, char5, char6, char7, char8, char9, char10, char11;
String wizardAppearance, monsterAppearance, fairyAppearance, villagersAppearance;
String wizardLocation, monsterLocation, fairyLocation, villagersLocation;
String currentChar, currentCharAppearance, currentLocation, nextChar, lastChar;
String riddleGuess;
StringList charAppearance, charLocation, riddleGuesses;
String[] scenes;
wizard wizard1;
monster monster1;
fairy fairy1;
villagers villagers1;

void mouseReleased(){
  click = false;
}


void setup() {

  riddleGuesses = new StringList();
  riddleGuesses.append("Bunnies!");
  riddleGuesses.append("The answer can only be time itself!");
  riddleGuesses.append("A lonesome cowboy?");
  riddleGuesses.append("Um... a river...?");
  riddleGuesses.append("I don't care about your dumb power anyway!");
  riddleGuesses.append("The moon?");
  riddleGuesses.append("Love? Sweet tender love?");
  riddleGuesses.shuffle();

  String[] scenes = {
    "wizard", "monster", "fairy", "villagers"
  };

  //char1 = "villagers"; //for debug purposes
  char1 = scenes[int(random(scenes.length))];
  println("Scene 1: " + char1);
  //char2 = "monster"; //again, for debug
  char2 = scenes[int(random(scenes.length))];
  println("Scene 2: " + char2);
  char3 = scenes[int(random(scenes.length))];
  if (char1 == char2 && char2 == char3) {
    char3 = scenes[int(random(scenes.length))];
  }
  println("Scene 3: " + char3);
  char4 = scenes[int(random(scenes.length))];
  if (char2 == char3 && char3 == char4) {
    char4 = scenes[int(random(scenes.length))];
  }
  println("Scene 4: " + char4);
  char5 = scenes[int(random(scenes.length))];
  if (char3 == char4 && char4 == char5) {
    char5 = scenes[int(random(scenes.length))];
  }
  println("Scene 5: " + char5);
  char6 = scenes[int(random(scenes.length))];
  if (char4 == char5 && char5 == char6) {
    char6 = scenes[int(random(scenes.length))];
  }
  println("Scene 6: " + char6);
  char7 = scenes[int(random(scenes.length))];
  if (char5 == char6 && char6 == char7) {
    char7 = scenes[int(random(scenes.length))];
  }
  println("Scene 7: " + char7);
  char8 = scenes[int(random(scenes.length))];
  if (char6 == char7 && char7 == char8) {
    char8 = scenes[int(random(scenes.length))];
  }
  println("Scene 8: " + char8);
  char9 = scenes[int(random(scenes.length))];
  if (char7 == char8 && char8 == char9) {
    char9 = scenes[int(random(scenes.length))];
  }
  println("Scene 9: " + char9);
  char10 = scenes[int(random(scenes.length))];
  if (char8 == char9 && char9 == char10) {
    char10 = scenes[int(random(scenes.length))];
  }
  println("Scene 10: " + char10);
  char11 = scenes[int(random(scenes.length))];
  println("Scene 11: " + char11);

  charLocation = new StringList();
  charLocation.append("forest");
  charLocation.append("desert");
  charLocation.append("mountains");
  charLocation.append("caves");
  charLocation.shuffle();
  wizardLocation = charLocation.get(0);
  wizardBackground = loadImage(wizardLocation+".jpg");
  monsterLocation = charLocation.get(1);
  monsterBackground = loadImage(monsterLocation+".jpg");
  fairyLocation = charLocation.get(2);
  fairyBackground = loadImage(fairyLocation+".jpg");
  villagersLocation = charLocation.get(3);
  villagersBackground = loadImage(villagersLocation+".jpg");

  charAppearance = new StringList();
  charAppearance.append("sandwich");
  charAppearance.append("dodecahedron");
  charAppearance.append("crab");
  charAppearance.append("poop");
  charAppearance.shuffle();
  wizardAppearance = charAppearance.get(0);
  wizardImage = loadShape(wizardAppearance+".svg");
  monsterAppearance = charAppearance.get(1);
  monsterImage = loadShape(monsterAppearance+".svg");
  fairyAppearance = charAppearance.get(2);
  fairyImage = loadShape(fairyAppearance+".svg");
  villagersAppearance = charAppearance.get(3);
  villagersImage = loadShape(villagersAppearance+".svg");

  println("Characters:");
  println("1: " +wizardAppearance+ " wizard of the " +wizardLocation);
  println("2: " +monsterAppearance+ " monster of the " +monsterLocation);
  println("3: " +fairyAppearance+ " fairy of the " +fairyLocation);
  println("4: " +villagersAppearance+ " villagers of the " +villagersLocation);

  titleScreen = loadFont("TitleScreen.vlw");

  wizard1 = new wizard();
  monster1 = new monster();
  fairy1 = new fairy();
  villagers1 = new villagers();

  size(800, 600);

  shapeMode(CENTER);

  click = false;
  cookie = false;
  helm = false;
  hug = false;
  net = false;
  wizardDead = false;
  monsterDead = false;
  fairyDead = false;
  villagersDead = false;
  wizardCurse = false;
  enslavedVillager = false;
  didOnce = false;
  state = 1;
  textState = 1;
  playerHealth = 3;
  playerDamage = 1;
  wizardHealth = 2;
  monsterHealth = 3;
  fairyHealth = 3;
}

void draw() {

  if (state == 1) {
    state1();
  }

  if (state == 2) {
    state2();
  }

  if (state == 3) { //scene1 pt1
    state3();
  }

  if (state == 4) { //scene1 pt 2
    state4();
    nextChar = char2;
  }

  if (state == 5) { //scene2 pt 1
    state5();
    lastChar = char1;
    nextChar = char3;
  }

  if (state == 6) { //scene2 pt 2
    state6();
    lastChar = char1;
    nextChar = char3;
  }

  if (state == 7) { //scene3 pt 1
    state7();
    lastChar = char2;
    nextChar = char4;
  }

  if (state == 8) { //scene3 pt 2
    state8();
    lastChar = char2;
    nextChar = char4;
  }

  if (state == 9) { //scene4 pt 1
    state9();
    lastChar = char3;
    nextChar = char5;
  }

  if (state == 10) { //scene4 pt 2
    state10();
    lastChar = char3;
    nextChar = char5;
  }

  if (state == 11) { //scene5 pt 1
    state11();
    lastChar = char4;
    nextChar = char6;
  }

  if (state == 12) { //scene5 pt 2
    state12();
    lastChar = char4;
    nextChar = char6;
  }

  if (state == 13) { //scene6 pt 1
    state13();
    lastChar = char5;
    nextChar = char7;
  }

  if (state == 14) { //scene6 pt 2
    state14();
    lastChar = char5;
    nextChar = char7;
  }

  if (state == 15) { //scene7 pt 1
    state15();
    lastChar = char6;
    nextChar = char8;
  }

  if (state == 16) { //scene7 pt 2
    state16();
    lastChar = char6;
    nextChar = char8;
  }

  if (state == 17) { //scene8 pt 1
    state17();
    lastChar = char7;
    nextChar = char9;
  }

  if (state == 18) { //scene8 pt 2
    state18();
    lastChar = char7;
    nextChar = char9;
  }

  if (state == 19) { //scene9 pt 1
    state19();
    lastChar = char8;
    nextChar = char10;
  }

  if (state == 20) { //scene9 pt 2
    state20();
    lastChar = char8;
    nextChar = char10;
  }

  if (state == 21) { //scene10 pt 1
    state21();
    lastChar = char9;
    nextChar = char11;
  }

  if (state == 22) { //scene10 pt 2
    state22();
    lastChar = char9;
    nextChar = char11;
  }

  if (state == 23) { //random death
    state23();
  }

  if (state == 24) { // game over screen
    gameOver();
  }

  if (state == 25) {
    win();
  }
}

void state1() {  //title screen. In the future I may want to beef this up with animation, ie fade in for text and flashing PRESS SPACEBAR TO CONTINUE
  background(128);
  textFont(titleScreen, 50);
  textAlign(CENTER);
  text("Journey", width/2, 200);
  text("of", width/2, 250);
  textFont(titleScreen, 100);
  text("FATE", width/2, 320);
  textFont(titleScreen, 40);
  text("Click to begin your journey... of FATE", width/2, 480);

  if (mousePressed && click == false) {
    state = 2;
    click = true;
  }
}

void state2() {    //instructional text
  background(128);
  textAlign(LEFT);
  text("Welcome to JOURNEY OF FATE.", 30, 50);
  text("You are a lone wanderer in a land of mystery.", 30, 100);
  text("In this adventure, you have no control over your future.", 30, 150);
  text("Your only option is to CLICK THE MOUSE to see what", 30, 200);
  text("your future might hold.", 30, 250);
  text("Now go, great hero, go and claim your DESTINY!", 30, 350);

  if (mousePressed && click == false) {
    state = 3;
    click = true;
  }
}

void state3() { //scene 1 pt 1

  if (char1 == "wizard") {
    wizard1.display();
  }

  if (char1 == "monster") {
    monster1.display();
  }

  if (char1 == "fairy") {
    fairy1.display();
  }

  if (char1 == "villagers") {
    villagers1.display();
  }

  if (mousePressed && click == false) {
    textState++;
    click = true;
  }

  fill(0);
  rect(0, 400, width, height);
  fill(255);
  text("Your journey begins in the " + currentLocation + ".", 30, 450);  

  if (textState == 2) { 
    fill(0);
    rect(0, 400, width, height);
    fill(255);
    text("This area is home to the " + currentCharAppearance + " " + currentChar + ".", 30, 450);
  }

  if (textState == 3) {
    textState = 1;
    state = 4;
  }
}

void state4() { //scene1 pt 2
  if (char1 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char1 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char1 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char1 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state5() { //scene2 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char2 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char2 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char2 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char2 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 6;
    click = true;
  }
}

void state6() { //scene 2 pt 2

  if (char2 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char2 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char2 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char2 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state7() { //scene3 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char3 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char3 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char3 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char3 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 8;
    click = true;
  }
}

void state8() { //scene 3 pt 2

  if (char3 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char3 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char3 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char3 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state9() { //scene4 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char4 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char4 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char4 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char4 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 10;
    click = true;
  }
}

void state10() { //scene 4 pt 2

  if (char4 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char4 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char4 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char4 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state11() { //scene5 pt 1

    fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char5 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char5 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char5 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char5 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 12;
    click = true;
  }
}

void state12() { //scene 5 pt 2

    if (char5 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char5 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char5 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char5 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state13() { //scene6 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char6 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char6 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char6 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char6 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 14;
    click = true;
  }
}

void state14() { //scene 6pt 2

  if (char6 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char6 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char6 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char6 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state15() { //scene7 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char7 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char7 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char7 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char7 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 16;
    click = true;
  }
}

void state16() { //scene 7 pt 2

  if (char7 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char7 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char7 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char7 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state17() { //scene8 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char8 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char8 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char8 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char8 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 18;
    click = true;
  }
}

void state18() { //scene 8 pt 2

  if (char8 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char8 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char8 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char8 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state19() { //scene9 pt 1

  fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char9 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char9 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char9 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char9 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 20;
    click = true;
  }
}

void state20() { //scene 9 pt 2

  if (char9 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char9 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char9 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char9 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state21() { //scene10 pt 1

    fill(0);
  rect(0, 400, width, height);
  fill(255);

  if (char10 == "wizard") {
    wizard1.display();
    wizard1.sceneState = 0;
    wizard1.sceneEnd = false;
    wizard1.increaseAnnoyance = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char10 == "monster") {
    monster1.display();
    monster1.sceneState = 0;
    monster1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char10 == "fairy") {
    fairy1.display();
    fairy1.sceneState = 0;
    fairy1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (char10 == "villagers") {
    villagers1.display();
    villagers1.sceneState = 0;
    villagers1.sceneEnd = false;
    if (currentChar != lastChar) {
      text("You find yourself in the "+currentLocation+" of the "+currentCharAppearance+" "+currentChar+".", 30, 450);
    }
  }

  if (mousePressed && click == false) {
    state = 22;
    click = true;
  }
}

void state22() { //scene 10 pt 2

    if (char10 == "wizard") {
    wizard1.display();
    wizard1.action();
  }

  if (char10 == "monster") {
    monster1.display();
    monster1.action();
  }

  if (char10 == "fairy") {
    fairy1.display();
    fairy1.action();
  }

  if (char10 == "villagers") {
    villagers1.display();
    villagers1.action();
  }
}

void state23() { // random death

  if (char10 == "wizard") {
    wizard1.display();
  }

  if (char10 == "monster") {
    monster1.display();
  }

  if (char10 == "fairy") {
    fairy1.display();
  }

  if (char10 == "villagers") {
    villagers1.display();
  }

  fill(0);
  rect(0, 400, width, height);
  fill(255);
  
  text("You turn around to leave and suddenly trip. Your head smashes",30,450);
  text("into a rock and splits open gruesomely. Oops! Guess that's just",30,490);
  text("how things go.",30,530);
  
  if (mousePressed && click == false) {
    state = 24;
    click = true;
  }
  
}

void gameOver() {
  
  fill(255,0,0);
  
  textAlign(CENTER);
  textFont(titleScreen, 200);
  text("GAME OVER",width/2,200);
  textFont(titleScreen, 50);
  text("You stink! Just quit the program and",width/2,300);
  text("go do something else!",width/2,350);
  
}

void win(){
  
  fill (0,255,0);
  
  textAlign(CENTER);
  textFont(titleScreen,150);
  text("CONGRATULATIONS",width/2,200);
  textFont(titleScreen,50);
  text("You have completed Journey of Fate.",width/2,300);
  text("now go and experience the endless admiration",width/2,350);
  text("of all your peers, as well as incredible success",width/2,400);
  text("in all aspects of life. You truly are a great person.",width/2,450);
  
}
class wizard 
{

  int annoyance, sceneState;
  boolean sceneEnd, firstEncounter, firstFightEncounter, wizardAngry, wizardFight, wizardHugged, increaseAnnoyance;

  wizard() {
    annoyance = 0;
    sceneState = 0;
    sceneEnd = false;
    firstEncounter = true;
    firstFightEncounter = true;
    wizardFight = false;
    wizardHugged = false;
  } //constructor end

  void display() {
    image(wizardBackground, 0, 0);
    if (wizardDead == false){
    shape(wizardImage, width/2, 200);
    }
    currentChar = "wizard";
    currentCharAppearance = wizardAppearance;
    currentLocation = wizardLocation;
  } // display() end

  void action() {

    if (currentChar == "wizard") {

      if (annoyance > 2) {
        wizardFight = true;
      }

      if (mousePressed && click == false && sceneEnd == true) {
        if (increaseAnnoyance == true) {
          annoyance ++;
        }
        if (wizardHealth <= 0) {
          wizardDead = true;
        }
        click = true;
        didOnce = false;
        state ++;
      }

      if (mousePressed && click == false && sceneEnd == false) {

        if (wizardHealth <= 0) {
          wizardDead = true;
        }
        sceneState++;
        if (increaseAnnoyance == true) {
          annoyance ++;
        }
        click = true;
        didOnce = false;
      }


      //1st dialogue boxes
      if (sceneState == 0) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (wizardDead == true) {
          text("The wizard's corpse lies crumpled up on the floor.", 30, 450);
          text("It's starting to smell a little bit. A fly hovers in the air.", 30, 490);
          if (nextChar == currentChar) {
            text("You poke it with a stick and wait to see if anything happens.", 30, 530);
            text("Nothing does, but you wait around anyway.", 30, 570);
          }
          else {
            text("You decide to leave before your gag reflexes fully kick in.", 30, 530);
          }
          sceneEnd = true;
        }

        if (wizardDead == false) {

          if (helm == true) {
            if (firstEncounter == true) {
              text("You see a " +wizardAppearance+ " wizard standing in", 30, 450);
              text("front of you. The helm's effects take hold! You let", 30, 490);
              text("out a bloodcurdling scream and start flailing your arms", 30, 530);
              text("wildly. The fight is on!", 30, 570);
              firstFightEncounter = false;
              wizardFight = true;
            }

            if (firstEncounter == false && firstFightEncounter == true) {
              text("It's the " +wizardAppearance+ " wizard. The helm's effects", 30, 450);
              text("take hold! 'Who's annoying now, you big jerk?!' you yell as", 30, 490);
              text("you forward brandishing your weapon.", 30, 530);
              firstFightEncounter = false;
              wizardFight = true;
            }
          } // helm end

          //fight encounter, whether due to helm or due to annoyance level
          if (wizardFight == true && helm == false) {

            if (firstFightEncounter = true) {
              text("The wizard speaks:", 30, 450);
              text("'So be it. Mine patience is at an end. Feel the wrath of", 30, 490);
              text("my dark power!' Uh oh. You really did it this time. You", 30, 530);
              text("ready yourself for the coming fight.", 30, 570);
            }
            else {
              text("The wizard is still angry! You get ready for another fight.", 30, 450);
            }
          } // wizardFight end

          //first encounter without the helm or cookie
          if (cookie == false && helm == false && wizardHugged == false) {
            if (annoyance == 0) {
              text("The wizard speaks:", 30, 450);
              text("Who doth enter my "+wizardLocation+" and interrupt my", 30, 490);
              text("ancient "+wizardAppearance+" magicks?", 30, 530);
              text("Leave, intruder, lest ye be the target of my next spell!", 30, 570);
              firstEncounter = false;
            } // annoyance 0 end

            if (annoyance == 1) {
              text("The wizard speaks:", 30, 450);
              //if the player encountered the wizard during the previous scene...
              if (lastChar == currentChar) {
                text("Art thou still here?", 30, 490);
              }
              else {
                //if the player didn't encounter the wizard during the previous scene
                text("Hast thou returned, annoying one?", 30, 490);
              }
              text("Thou art testing mine patience! Leave now or", 30, 530);
              text("suffer the consequences of thine stupidity!", 30, 570);
            } //annoyance 1 end

            if (annoyance == 2) {
              text("The wizard speaks:", 30, 450);
              //if the wizard was the last character
              if (lastChar == currentChar) {
                text("Argh! Why do you stand there like as to a fool?", 30, 490);
                //if the wizard wasn't the last character
              }
              else {
                text("'Tis thee?! Dost thou make thy currency by annoying wizards?", 30, 490);
              }
              text("Take this magical trinket and begone! But returneth not, or I shall", 30, 530);
              text("gladly supply the painful death which you so seem to desire!", 30, 570);
            } // annoyance 2 end
          } // cookie, helm & hug false end

          if (wizardHugged == true && helm == false) {
            text("The wizard speaks:", 30, 450);
            if (lastChar == currentChar) {
              text("'Tis wondrous to spend time with you, dearest one.", 30, 490);
            }
            else {
              text("Ah, 'tis you! The embrace we shared hast never left my mind!", 30, 490);
            }
          } // wizardHugged end
        } // wizardDead false end
      } // sceneState 0 end


      //2nd dialogue boxes
      if (sceneState == 1) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (wizardHugged == true) {
          if (currentChar == nextChar) {
            text("You stay and give the wizard a pity hug.", 30, 450);
          }
          else {
            text("You leave quickly before the wizard thinks you're interested.", 30, 450);
          }
          sceneEnd = true;
        }

        if (wizardFight == true && hug == false && cookie == false) {
          if (didOnce == false) {
            playerHealth = playerHealth - 2;
            wizardHealth = wizardHealth - playerDamage;
            didOnce = true;
          }
          text("After the ensuing fight you have "+playerHealth+ " health points.", 30, 450);
          text("The wizard has "+wizardHealth+" health points.", 30, 490);
          firstEncounter = false;
        }

        if (cookie == true && hug == false) {
          text("Suddenly, the wizard notices the Delicious Cookie that you carry.", 30, 450);
          text("'Ah! I have always had a taste for sweets! Give me that cookie and", 30, 490);
          text("I shall forgive all of thine transgressions!'", 30, 530);
          text("You hand the wizard the delicious cookie.", 30, 570);
        }

        if (hug == true && wizardHugged == false && helm == false) {
          text("But before the wizard can say another word, you activate", 30, 450);
          text("your Special Hug power. You reach out and ensnare the", 30, 490);
          text("wizard in an almost inhumanly warm embrace.", 30, 530);
        }

        if (cookie == false && helm == false && hug == false) {
          //2nd dialogue box for 3rd annoyance level
          if (annoyance == 0) {
            if (currentChar == nextChar) {
              text("He seems pretty angry, but your morbid sense of", 30, 450);
              text("curiosity compels you to stay a bit longer.", 30, 490);
            }
            else {
              text("Perhaps it would be best to leave the wizard", 30, 450);
              text("alone for the time being.", 30, 490);
              text("You decide to head somewhere else.", 30, 530);
            }
            sceneEnd = true;
            increaseAnnoyance = true;
          } // annoyance 0 end

          else if (annoyance == 1) {
            if (nextChar == currentChar) {
              text("The " +wizardAppearance+ " wizard seems like he's threatening you,", 30, 450);
              text("but you decide to hang around a bit longer just to see", 30, 490);
              text("what happens.", 30, 530);
            }
            else {
              text("Perhaps it would be best to leave the wizard", 30, 450);
              text("alone for the time being.", 30, 490);
              text("You decide to head somewhere else.", 30, 530);
            }
            sceneEnd = true;
            increaseAnnoyance = true;
          } // annoyance 1 end

          else if (annoyance == 2) {
            text("Wow! The wizard tossed you a magical sword! You will", 30, 450);
            text("now do twice as much damage with each attack.", 30, 490);
            playerDamage = 2;
          }
        } // fight, hug & cookie false end
      } // sceneState 1 end

      //3rd dialogue boxes
      if (sceneState == 2) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (wizardFight == true) {
          if (playerHealth <= 0) {
            text("You have died!", 30, 450);
            state = 24;
          }
          else
            if (wizardDead == true) {
              text("You have dealt the wizard a mortal blow!", 30, 450);
            }
            else if (wizardDead == false) {
              if (nextChar != currentChar) {
                text("You run away!", 30, 450);
              }
              else {
                text("You continue the fight!", 30, 450);
              }
              firstFightEncounter = false;
              sceneEnd = true;
            } // wizardDead false end
        } // wizardFight end

        if (cookie == true && hug == false) {
          text("The wizard gulps the cookie down with a series of sickening slurps.", 30, 450);
          text("At first he seems very happy, but then his eyes bulge and his skin", 30, 490);
          text("turns pale.", 30, 530);
          wizardDead = true;
        }

        if (hug == true && wizardHugged == false && helm == false) {
          text("You feel the wizard's demeanor soften almonst instantly.", 30, 450);
          text("You let him out of your arms, and he brings his eyes up to", 30, 490);
          text("gaze into yours. You start to pick up a weird vibe", 30, 530);
          text("from him.", 30, 570);
        }

        if (cookie == false && helm == false && hug == false && annoyance == 2) {
          //if wizard is not next char
          if (nextChar != currentChar) {
            text("You never guessed that being an annoying bastard", 30, 450);
            text("could pay so well! You run off clutching your new sword", 30, 490);
            text("to your chest and giggling maniacally.", 30, 530);
          }
          else {
            text("The wizard just gave you a prize for being irritating!", 30, 450);
            text("You think that maybe if you do more dumb stuff he'll give", 30, 490);
            text("you something else. You sidle up next to him and start", 30, 530);
            text("making weird noises in his ear.", 30, 570);
          }
          increaseAnnoyance = true;
          sceneEnd = true;
        }// cookie, helm & hug false end
      } // sceneState 2 end


      //4th dialogue boxes
      if (sceneState == 3) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (cookie == true && hug == false) {
          text("The wizard speaks:", 30, 450);
          text("Argh! Did yon cookies contain hazelnuts! I have severe nut", 30, 450);
          text("allergies! Why was there not a warning label?! You have killed", 30, 490);
          text("me! Foul knave! I curse you with the blackest of curses!", 30, 530);
        }

        if (hug == true && wizardHugged == false) {
          text("The wizard speaks:", 30, 450);
          text("'None before thou hast shown me such tenderness. Mine heart", 30, 490);
          text("does swell with such emotion as I have never felt. Wilst thou", 30, 530);
          text("take this gift as a token of mine love?'", 30, 570);
        }
      } // sceneState 3 end


      if (sceneState == 4) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (wizardDead == true) {
          text("The wizard reaches into his robes and pulls out a dagger carved", 30, 450);
          text("with evil-looking designs. He brings the dagger to his wrist and", 30, 490);
          text("lets out a few drops of blood. His eyes turn pitch black and he", 30, 530);
          text("mutters several syllables in a forgotten tongue before finally dying.", 30, 570);
        }

        if (hug == true && wizardDead == false) {
          text("The wizard hands you a magical sword. Your attacks will now", 30, 450);
          text("deal 2 damage!", 30, 490);
          if (nextChar == currentChar) {
            text("You thank the wizard. He gazes at you lovingly. It's a bit creepy", 30, 530);
            text("but you stay, hoping he'll provide you with more magical items.", 30, 570);
          }
          else {
            text("You thank the wizard, and he gazes at you lovingly. You hope he", 30, 530);
            text("didn't get the wrong idea. You make an excuse and leave hastily.", 30, 570);
          }
          sceneEnd = true;
          playerDamage = 2;
          wizardHugged = true;
        }
      } // sceneState 4 end


      if (sceneState == 5) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (wizardDead == true) {
          text("You're sure it's nothing to worry about.", 30, 450);
          if (nextChar == currentChar) {
            text("But you stick around to make sure the old man is truly dead.", 30, 490);
          }
          else {
            text("You step over the wizard's body and make for the door.", 30, 490);
          }
          if (playerDamage == 1) {
            text("Something in the wizard's robe catches your eye. It's a magical sword!", 30, 530);
            text("Your attacks will now deal 2 damage! Great!", 30, 570);
            playerDamage = 2;
          }
          sceneEnd = true;
          cookie = false;
        } // wizardDead == true end
      } // sceneState 5 end
    } // action() end
  } // currentChar == wizard end
} // class end

class monster {
  int sceneState;
  boolean sceneEnd, firstEncounter, monsterHugged;

  monster() {
    sceneState = 0;
    sceneEnd = false;
  }

  void display() {

    image(monsterBackground, 0, 0);
    if (monsterDead == false && monsterHugged == false) {
      shape(monsterImage, width/2, 200, 400, 400);
    }
    currentChar = "monster";
    currentCharAppearance = monsterAppearance;
    currentLocation = monsterLocation;
  }

  void action() {

    if (currentChar == "monster") {

      if (mousePressed && click == false && sceneEnd == true) {
        click = true;
        didOnce = false;
        state++;
        if (monsterHealth <= 0) {
          monsterDead = true;
        }
      }

      if (mousePressed && click == false && sceneEnd == false) {
        sceneState++;
        click = true;
        didOnce = false;
        if (monsterHealth <= 0) {
          monsterDead = true;
        }
      }

      if (sceneState == 0) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (monsterHugged == true) {
          text("There is no one here.", 30, 450);
          text("The emptiness fills you with rage! You scream unintelligibly into", 30, 490);
          text("the void.", 30, 530);
          if (nextChar == currentChar) {
            text("You hang out and keep screaming for a weirdly long time.", 30, 570);
          }
          else {
            text("Satisfied, you turn around and leave.", 30, 570);
          }
          sceneEnd = true;
        }

        if (monsterDead == true) {
          text("The monster's body lies rotting on the ground.", 30, 450);
          if (hug == true) {
            text("You activate your Special Hug ability! You wrap your arms and", 30, 490);
            text("cover the corpse in a warm embrace!", 30, 530);
            if (nextChar == currentChar) {
              text("Nothing happens. You leave before anyone sees what you did.", 30, 570);
            }
            else {
              text("Nothing happens. You stay and wonder why you did that.", 30, 570);
            }
          } // hug true end
          else if (hug == false) {
            if (nextChar == currentChar) {
              text("You decide to stay a bit longer to admire your handiwork.", 30, 490);
            }
            else {
              text("After spending some time reflecting on your incredible heroism", 30, 490);
              text("and remarkable good looks, you decide to move on.", 30, 530);
            }
            sceneEnd = true;
          } // hug == false end
        } // monsterDead true end

        if (hug == true & monsterDead == false && monsterHugged == false) {
          text("The " +monsterAppearance+ " seems ready to attack!", 30, 450);
          text("Before it makes a move, you rush in and use your Special Hug!", 30, 490);
        }

        if (hug == false && monsterDead == false && monsterHugged == false) {
          text("The " +monsterAppearance+ " monster lunges in to attack!", 30, 450);
        } // hug, monsterDead false end
      } // sceneState 0 end;

      if (sceneState == 1) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && monsterDead == false) {
          text("The monster seems confused at first, but then its demeanor", 30, 450);
          text("softens. A single tear falls from its eye.", 30, 490);
        }

        if (hug == false && monsterDead == false) {
          if (didOnce == false) {
            println("monster damage");
            playerHealth--;
            monsterHealth = monsterHealth - playerDamage;
            didOnce = true;
          } // didOnce false end
          text("After the ensuing battle, you have "+playerHealth+" health points.", 30, 450);
          text("The monster has "+monsterHealth+" health points.", 30, 490);
        } // hug false, monsterDead false
      } // sceneState 1 end

      if (sceneState == 2) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && monsterDead == false) {
          text("The monster speaks:", 30, 450);
          text("Thank you, kind human. I know I project an air of agression,", 30, 490);
          text("but its really just my way of reaching out for help. You're", 30, 530);
          text("the only one who has ever cared enough to love me!", 30, 570);
        } // hug true, monsterDead false end

        if (playerHealth <= 0) {
          text("You have died!", 30, 450);
          state = 24;
        }

        if (monsterDead == true && playerHealth > 0) {
          text("You've slain the monster!", 30, 450);
          if (nextChar == currentChar) {
            text("You decide to stay for a while and enjoy the feeling of victory.", 30, 490);
          }
          else {
            text("You run off into the distance, excited to tell everyone how about", 30, 490);
            text("how great you are!", 30, 530);
          }
          sceneEnd = true;
        }

        if (hug == false && monsterDead == false && sceneState == 2) {
          if (currentChar != nextChar) {
            text("You run away.", 30, 450);
            sceneEnd = true;
          }
          else {
            text("You decide to stay and continue fighting.", 30, 450);
            sceneEnd = true;
          } // else end
        } // hug, monsterDead false end
      } // sceneState 2 end

      if (sceneState == 3) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && monsterDead == false) {
          text("Please, take this as a token of my appreciation... I don't need", 30, 450);
          text("it anymore...", 30, 490);
        } // hug true, monster dead false end
      } // sceneState 3 end

      if (sceneState == 4) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && monsterDead == false) {
          text("The monster takes something off of its head and throws it to you!", 30, 450);
          text("It then turns around and walks dramatically into the sunset. You", 30, 490);
          text("look at what you now hold in your hand. It's the Helm of ", 30, 530);
          text("Monstrous Rage! You place it on your head.", 30, 570);
        } // hug true, monsterDead false end
      } // sceneState 4 end

      if (sceneState == 5) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && monsterDead == false) {
          text("Suddenly all your thoughts begin to be overtaken by a blind and", 30, 450);
          text("murderous rage! Your last thought before you are transformed into", 30, 490);
          text("a violent and irrational psychopath is 'maybe this wasn't such a", 30, 530);
          text("good idea.'", 30, 570);
          helm = true;
          monsterHugged = true;
          sceneEnd = true;
        } // hug true, monsterDead false end
      } // sceneState 5 end
    } // currentChar = monster end
  } // action() end
} // class end

class fairy {
  int sceneState, rightAnswer;
  boolean firstEncounter, sceneEnd, correct;

  fairy() {
    sceneState = 0;
    firstEncounter = true;
    sceneEnd = false;
  }

  void display() {

    image(fairyBackground, 0, 0);
    if (fairyDead == false) {
      shape(fairyImage, width/2, 200);
    }
    currentChar = "fairy";
    currentCharAppearance = fairyAppearance;
    currentLocation = fairyLocation;
    correct = false;
  }


  void action() {

    if (fairyHealth <= 0) {
      fairyDead = true;
    }

    if (currentChar == "fairy") {

      if (mousePressed && click == false && sceneEnd == true) {
        click = true;
        didOnce = false;
        state = state + 1;
        firstEncounter = false;
      }

      if (mousePressed && click == false && sceneEnd == false) {
        sceneState++;
        click = true;
        didOnce = false;
      }

      if (sceneState == 0) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (net == true && enslavedVillager == true) {
          text("The fairy speaks:", 30, 450);
          text("Ah! You have done it! I can almost taste the endless stream of cookies", 30, 490);
          text("right now! Give me the villager!", 30, 530);
        }

        if (fairyDead == true) {
          text("You state at the dead fairy and contemplate the morality of your", 30, 450);
          text("actions. Or you would, that is, if you weren't consumed with", 30, 490);
          text("Helm's power.", 30, 530);
          if (nextChar == currentChar) {
            text("Instead you randomly kick a few inanimate objects and leave.", 30, 570);
          }
          else {
            text("Instead you hang around and randomly kick inanimate objects.", 30, 570);
          }
          sceneEnd = true;
        }

        if (fairyDead == false) {

          if (helm == true) {
            text("You see the fairy standing in front of you. The Helm's effects", 30, 450);
            text("take hold! You run forwards brandishing your weapon! The fairy", 30, 490);
            text("gets ready to meet you in combat!", 30, 530);
            if (didOnce == false) {
              playerHealth --;
              fairyHealth = fairyHealth - playerDamage;
            }
          }

          if (net == true && enslavedVillager == true) {
            text("The fairy speaks:", 30, 450);
            text("Ah! You have done it! I can almost taste the endless stream of cookies", 30, 490);
            text("right now! Give me the villager!", 30, 530);
          }

          if (cookie == true && helm == false) {
            text("The fairy is about to speak, but suddenly stops and begins", 30, 450);
            text("sniffing the air frantically.", 30, 490);
          } // cookie == true, helm == false end

          if (hug == true && cookie == false && helm == false) {
            text("Before the fairy can say anything, you reach out and", 30, 450);
            text("give it a loving hug. The fairy returns it and speaks:,", 30, 490);
            text("Why thank you, hero! Now please allow me to return your kindness", 30, 530);
            text("with my healing magic!", 30, 570);
            if (didOnce == false) {
              println("fairy heal");
              playerHealth ++;
              didOnce = true;
            }
          } // hug == true, cookie, helm == false end

          if (helm == false && cookie == false && hug == false) {
            if (firstEncounter == true) {
              text("The fairy speaks:", 30, 450);
              text("Welcome, brave wanderer! I am the magical "+fairyAppearance+" fairy!", 30, 490);
              text("Please allow me to heal your wounds!", 30, 530);
            }
            else {
              text("Welcome back, brave wanderer! Do you need", 30, 450);
              text("more healing?", 30, 490);
            }
            if (didOnce == false) {
              println("fairy heal");
              playerHealth ++;
              didOnce = true;
            }
          } // helm, cookie, hug false end
        } // fairyDead == false end
      } // sceneState 0 end

      if (sceneState == 1) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (helm == true) {
          text("After the ensuing battle, you have "+playerHealth+" health points.", 30, 450);
          text("The fairy has "+fairyHealth+" health points.", 30, 490);
          if (playerHealth <= 0) {
            text("You have died!", 30, 530);
          }
        }

        if (fairyDead == false) {

          if (net == true && enslavedVillager == true) {
            text("You hand over the villager. The fairy opens the net and shakes it into a cage,", 30, 450);
            text("then quickly shuts and locks the door. The cage contains a little oven and fully", 30, 490);
            text("stocked kitchen. The villager sighs and gets to work.", 30, 530);
          }

          if (cookie == true && helm == false) {
            text("The fairy speaks:", 30, 450);
            text("Oh my! Is that what I think it is?! Is that one of the cookies of the", 30, 490);
            text(villagersAppearance+ " villagers? Please! I beg of you! I must have that", 30, 530);
            text("cookie!", 30, 570);
          }

          if (helm == false && cookie == false) {
            text("The fairy casts healing magic upon you, and you gain health.", 30, 450);
            text("Your now have "+playerHealth+" health points.", 30, 490);
            text("What a kind fairy!", 30, 530);
          }
        } // fairyDead == false end
      } // sceneState 1 end

      if (sceneState == 2) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (net == true && enslavedVillager == true) {
          text("The fairy speaks:", 30, 450);
          text("You truly are a great hero! Soon I shall control the production of cookies. They", 30, 490);
          text("have always said that he who controls the flow of cookies controls the flow", 30, 530);
          text("of history. Yes... a new era shall dawn. One in which the fairy is Queen!", 30, 590);
        }

        if (helm == true) {
          if (fairyDead == true) {
            text("The fairy lies dead! You roar loudly in triumph! Suddenly you", 30, 450);
            text("notice something shiny in the fairy's posession. It's the Legendary", 30, 490);
            text("Treasure of Numinous Wonder, the most powerful object in the universe.", 30, 530);
            text("With this item, your journey would be triumphant!", 30, 590);
          }
          else {
            if (currentChar == nextChar) {
              text ("You decide to stay and continue fighting!", 30, 450);
            }
            else {
              text("You run away!", 30, 450);
            }
            sceneEnd = true;
          }
        }

        if (cookie == true && helm == false) {
          text("You shrug and hand over your Delicious Cookie to the fairy.", 30, 450);
          text("The fairy grabs it frantically and begins slurping it down in a", 30, 490);
          text("manner that is, frankly, disturbing.", 30, 530);
        }

        if (hug == false && cookie == false && helm == false) {
          text("The fairy speaks:", 30, 450);
          text("Before you go, wanderer, let me ask you a riddle!", 30, 490);
          text("If you answer correctly, I shall bestow upon you", 30, 530);
          text("a special power!", 30, 570);
          riddleGuesses.shuffle();
        }
        else
          if (hug == true && cookie == false && helm == false) {
            if (nextChar != currentChar) {
              text("Thanking the fairy, you return to your wanderings.", 30, 450);
            }
            else {
              text("You decide to stick around to see if the fairy will", 30, 450);
              text("heal you again.", 30, 490);
            }
            sceneEnd = true;
          }
      }

      if (sceneState == 3) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (fairyDead == true) {
          text("But under the influence of the Helm, you are unable to recognize it.", 30, 450);
          if (currentChar == nextChar) {
            text("You smash it under your foot and pound your chest in an ape-like fashion.", 30, 490);
          } 
          else {
            text("You smash it under your foot and leave.", 30, 490);
          }
          sceneEnd = true;
        }

        if (net == true && enslavedVillager == true) {
          text("The fairy speaks:", 30, 450);
          text("Here, take this treasure. You have earned it, and besides, I have no need of", 30, 490);
          text("such items any more. I have everything I need right here.", 30, 530);
        }

        if (cookie == true && helm == false) {
          text("The fairy speaks:", 30, 450);
          text("Thank you, kind sir! It has been too long since I tasted", 30, 490);
          text("that luscioius flavor. You see... the other fairies have kept", 30, 530);
          text("me from tasting them since... the incident...", 30, 570);
        } // cookie = true, helm = false end

        if (hug == false && cookie == false) {
          text("The fairy asks you the riddle. It's a tough one.", 30, 450);
          text("After some deep thought, you reply:", 30, 490);
          riddleGuess = riddleGuesses.get(0);
          text("'"+riddleGuess+"'", 30, 530);
          rightAnswer = int(random(1, 7));
        }
      }

      if (sceneState == 4) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);
        if (rightAnswer == 2) {
          correct = true;
        }

        if (net == true && enslavedVillager == true) {
          text("The fairy hands you the Legendary Treasure of Numinous Wonder. You have done", 30, 450);
          text("what no other hero has dared to dream! You posess the most powerful item in", 30, 490);
          text("the entire multiverse! You look down at the glowing treasure in your hands.", 30, 530);
        }

        if (cookie == true && helm == false) {
          text("But don't worry about that! Listen, I try to keep this", 30, 450);
          text("information secret, but I am the keeper of the Legendary", 30, 490);
          text("Treasure of Numinous Wonder. If you can get me a reliable", 30, 530);
          text("supply of those cookies, it's yours, no questions asked.", 30, 570);
        } // cookie = true, helm = false end

        if (hug == false && correct == true && cookie == false) {
          text("The fairy looks impressed!", 30, 450);
          text("'Congratulations, wise one!", 30, 490);
          text("'"+riddleGuess+"' is the answer!'", 30, 530);
          text("I now grant you a most powerful ability!", 30, 570);
        }
        if (hug == false && correct == false && cookie == false) {
          text("The fairy shakes its head condescendingly.", 30, 450);
          text("'Haha! Wait... you're serious? Uh... no...", 30, 490);
          text("'"+riddleGuess+"' is not correct.'", 30, 530);
          text("I guess you can try again text time... if you want.'", 30, 570);
        }
      }

      if (sceneState == 5) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (rightAnswer == 2) {
          correct = true;
        }

        if (net == true && enslavedVillager == true) {
          text("It's a burrito. You take a bite.", 30, 450);
        }

        if (cookie == true && helm == false) {
          text("I'll just give you this net... let's just say it's good for", 30, 450);
          text("catching small, helpless creatures. You can do with it as you", 30, 490);
          text("wish, but remember that my offer stands. Here, have some healing", 30, 530);
          text("magic for your trouble.", 30, 570);
          if (didOnce == false) {
            println("fairy heal");
            playerHealth ++;
            didOnce = true;
          }
        } // cookie = true, helm = false end

        if (correct == true && cookie == false) {
          text("You have gained the Special Hug power!", 30, 450);
          text("You can now envelop unsuspecting passerby in a", 30, 490);
          text("warm, motherly embrace! It's sure to warm even", 30, 530);
          text("the most wicked heart!", 30, 570);
          hug = true;
        }
        if (correct == false) {
          if (nextChar != currentChar) {
            text("You leave quickly, hoping to avoid further embarassment.", 30, 450);
          }
          else if (nextChar == currentChar) {
            text("Though embarassed, you decide to stick around.", 30, 450);
            text("Maybe the fairy will at least heal you again.", 30, 490);
          }
          sceneEnd = true;
        }
      } // sceneState 5 end

      if (sceneState == 6) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (rightAnswer == 2) {
          correct = true;
        }

        if (net == true && enslavedVillager == true) {
          text("It's the most delicious burrito you've ever tasted! You take another bite", 30, 450);
          text("and are awash in a reverie of incredible flavor. With every bite you take,", 30, 490);
          text("the other end of the burrito grows longer. It's an infinite burrito!", 30, 530);
        }

        if (cookie == true && helm == false) {
          text("The fairy casts healing magic upon you, and you gain health.", 30, 450);
          text("Your now have "+playerHealth+" health points.", 30, 490);
          if (currentChar == nextChar) {
            text("You decide to stick around for more healing while you consider", 30, 530);
            text("the fairy's offer.", 30, 590);
          }
          else {
            text("You tell the fairy that you'll consider it's offer and leave", 30, 539);
            text("thoughtfully.", 30, 450);
          }
          sceneEnd = true;
          cookie = false;
          net = true;
        } // cookie = true, helm = false end

        if (correct == true && cookie == false) {
          if (nextChar != currentChar) {
            text("Feeling like a pretty smart guy, you", 30, 450);
            text("continue triumphantly on your adventures.", 30, 490);
          }
          else {
            text("Wow, look at Mr. Smart Guy over here!", 30, 450);
            text("You start to think that maybe your Mom was right", 30, 490);
            text("and you really are special. You stick around a", 30, 530);
            text("bit longer, wanting to bask in the fairy's approval.", 30, 570);
          }
          sceneEnd = true;
        } // correct == true end
      } // sceneState 6 end

      if (sceneState == 7) {
        if (net == true && enslavedVillager == true) {
          if (wizardCurse == true) {
            text("Suddenly you hear a strange voice in your head. It's the wizard's death", 30, 450);
            text("curse come back to haunt you! Suddenly the chunk of burrito in your mouth", 30, 490);
            text("squrims as if it has a life of it's own. It jumps down your trachea! You", 30, 530);
            text("slowly choke to death.", 30, 570);
          } 
          else {
            text("Your life is complete. There is honestly nothing you can imagine that would", 30, 450);
            text("top this current experience. You retire into the country side, living a quiet", 30, 490);
            text("life full of the never-ending enrichment that only a burrito can provide.", 30, 530);
          }
        } // net, enslaved villager true
      } // sceneState 7 end

      if (sceneState == 8) {
        if (net == true && enslavedVillager == true) {
          if (wizardCurse == true) {
            state = 24;
          } 
          else {
            state = 25;
          }
        } // net, enslaved villager true
      } // sceneState == 8 end
    } // currentChar == fairy end
  } // action() end
} // class end

class villagers {
  boolean firstEncounter, sceneEnd, cookieGiven, chiefDead, villagersDeadActivate, cookieActivate;
  int sceneState;

  villagers() {
    firstEncounter = true;
    sceneState = 0;
    sceneEnd = false;
    cookieGiven = false;
    chiefDead = false;
  }

  void display() {

    if (villagersDead == true) {
    }

    if (chiefDead == true && villagersDead == false) {
      image(villagersBackground, 0, 0);
      shape(villagersImage, width/2 - 200, 200, 150, 150);
      shape(villagersImage, width/2 + 200, 200, 150, 150);
    }

    if (villagersDead == false && chiefDead == false) {
      image(villagersBackground, 0, 0);
      shape(villagersImage, width/2, 200, 150, 150);
      shape(villagersImage, width/2 - 200, 200, 150, 150);
      shape(villagersImage, width/2 + 200, 200, 150, 150);
    }
    currentChar = "villagers";
    currentCharAppearance = villagersAppearance;
    currentLocation = villagersLocation;
  }

  void action() {

    if (currentChar == "villagers") {

      if (mousePressed && click == false && sceneEnd == true) {
        click = true;
        didOnce = false;
        firstEncounter = false;
        state = state + 1;
        if (villagersDeadActivate == true) {
          villagersDead = true;
        }
        if (cookieActivate == true) {
          cookie = true;
          cookieGiven = true;
        }
      }

      if (mousePressed && click == false && sceneEnd == false) {
        sceneState++;
        click = true;
        didOnce = false;
      }

      if (sceneState == 0) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (helm == true && villagersDead == false) {
          text("The Helm kicks in as soon as you lay your eyes on the pitiful", 30, 450);
          text("villagers. You roar in anger and start slaughtering everyone", 30, 490);
          text("you see.", 30, 530);
        }

        if (net == true) {
          if (villagersDead == true || chiefDead == true) {
            text("You enter the village. Everybody is still hiding from you.", 30, 450);
            text("Suddenly you hear a rustling sound in a nearby bush. Suddenly", 30, 490);
            text("you realize why the fairy gave you the net.", 30, 530);
          }
          else {
            text("You enter the village. The villagers crowd around you in", 30, 450);
            text("admiration. You can smell cookies baking in the distance.", 30, 490);
            text("Suddenly it occurs to you why the fairy gave you the net.", 30, 530);
          }
        }

        if (villagersDead == true) {
          text("The village is deserted and eerily quiet.", 30, 450);
          if (currentChar == nextChar) {
            text("You stay to enjoy the silence", 30, 490);
          }
          else {
            text("You leave quickly, not sure why you came back in the first place.", 30, 490);
          }
        }

        if (villagersDead == false) {

          if (hug == true && helm == false && net == false && chiefDead == false) {
            text("As soon as you see the miserable little villagers, you know exactly", 30, 450);
            text("what to do to lift their spirits. Special Hug activate!", 30, 490);
          }

          if (cookieGiven == true && net == false && chiefDead == false) {
            text("The village chief calls out to you:", 30, 450);
            text("Welcome back, great hero! While we are overjoyed to see you in", 30, 490);
            text("our village again, we cannot offer you anything but our thanks,", 30, 530);
            text("as we have already given you all that we can spare!", 30, 570);
          }

          if (monsterDead == true && cookieGiven == false) {
            if (chiefDead == true) {
              text("You enter the village and cautiously announce your triumph over the monster,", 30, 450);
              text("not sure if it will smooth over the whole complication from earlier.", 30, 490);
            }
            else {
              text("As you enter the " +villagersLocation+ ", you loudly announce your triumph", 30, 450);
              text("over the monster which had been plaguing the villagers. You revel", 30, 490);
              text("in their joyous shouts and tears of relief.", 30, 530);
            }
          }

          if (helm == false && hug == false && monsterDead == false) {
            if (lastChar == currentChar) {
              text("You stand around with the villagers hoping someone will", 30, 450);
              text("break the ice. They all seem pretty upset by the whole monster", 30, 490);
              text("situation and no one's talking. One of them begins sobbing quietly.", 30, 530);
              text("Things are getting pretty awkward. You clear your throat loudly.", 30, 570);
            } 
            else
              if (firstEncounter == true) {
                text("The village chief calls out to you:", 30, 450);
                text("O great warrior! Our people are in need of your skill!", 30, 490);
                text("The "+monsterAppearance+" monster of the "+monsterLocation, 30, 530);
                text("has been murdering our people. It killed my daughter!", 30, 570);
              }
              else
                if (firstEncounter == false) {
                  text("Not these depressing villagers again! You were just starting", 30, 450);
                  text("to mellow out after the last time you ran into them. You try to", 30, 490);
                  text("casually walk away, but they have already noticed you.", 30, 530);
                }
          }
        } // villagersDead = false end
      } // sceneState = 0 end

      if (sceneState == 1) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (net == true) {
          if (villagersDead == true || chiefDead == true) {
            text("You throw a stone into the bush to scare the villager out. As soon", 30, 450);
            text("as it emerges from hiding, you toss out the fairy's net. It works! the", 30, 490);
            text("villager is totally trapped!", 30, 530);
            if (currentChar == nextChar) {
              text("You spend some time poking the villager, just for funsies.", 30, 570);
            }
            else {
              text("You take your prize and run off into the distance.", 30, 570);
            }
          }
          else {
            text("You take out the net. The villagers look somewhat confused. You feel", 30, 450);
            text("a little bad as you toss out the net and ensnare the nearest "+villagersAppearance+".", 30, 490);
            text("The rest of the villagers let out shocked yelps and run into their houses.", 30, 530);
            if (currentChar == nextChar) {
              text("You grab up the enslaved villager and go off on your way.", 30, 570);
            }
            else {
              text("You spend some time poking the villager, just for funsies.", 30, 570);
            }
          }
          enslavedVillager = true;
          chiefDead = true;
        }

        if (helm == true && villagersDead == false) {
          text("It isn't long before the entire village is dead.", 30, 450);
          text("You feel a vague sense of guilt.", 30, 490);
          if (currentChar == nextChar) {
            text("You yell and smash your sword into the ground over and over.", 30, 530);
          }
          else {
            text("You lumber out of the "+villagersLocation+", mumbling angry-sounding", 30, 530);
            text("jibberish.", 30, 570);
          }
          villagersDeadActivate = true;
          sceneEnd = true;
        }

        if (hug == true && helm == false && net == false && chiefDead == false) {
          text("You grab the village elder and squeeze him in the most loving way", 20, 450);
          text("possible. Suddenly you hear a sickening snapping sound and he", 20, 490);
          text("cries out in pain. It seems that his tiny body couldn't take the force", 20, 530);
          text("of your hug! You drop his now lifeless body and back away in horror.", 20, 570);
        }

        if (cookieGiven == true && net == false && helm == false) {
          if (nextChar == currentChar) {
            text("Being adored by these villagers is good for your self esteem. You", 30, 450);
            text("decide to stay for a little while longer.", 30, 490);
          }
          else {
            text("What a bunch of ungrateful jerks! You leave in a huff.", 30, 450);
          }
          sceneEnd = true;
        }

        if (monsterDead == true && cookieGiven == false) {
          if (chiefDead == true) {
            text("No one makes so much as a noise.", 30, 450);
            if (nextChar == currentChar) {
              text("You hang around meekly to see if anyone will approach you.", 30, 490);
            }
            else {
              text("You leave quickly.", 30, 490);
            }
            sceneEnd = true;
            villagersDead = true;
          }
          else {
            text("The village chief calls out to you:", 30, 450);
            text("Oh thank you great warrior! You are truly the hero of this age!", 30, 490);
            text("Though we don't have much to give you, please accept this", 30, 530);
            text("Delicious Cookie as our payment!", 30, 570);
          }
        }


        if (helm == false && hug == false && monsterDead == false) {
          if (firstEncounter == true) {
            text("We beg of you! Go and slay the monster", 30, 450);
            text("and our people shall be forever in your debt!", 30, 490);
          }
          else {
            if (lastChar == currentChar) {
              if (currentChar == nextChar) {
                text("This is pretty depressing, but you just don't really", 30, 450);
                text("feel like walking anywhere right now. Maybe the villagers will start", 30, 490);
                text("to cheer up if you stay for a while.", 30, 530);
              }
              else {
                text("Yeah... it's time to get out of here. You wait until the", 30, 450);
                text("villagers are distracted by their sadness and slip away", 30, 490);
                text("quietly.", 30, 530);
              }
              sceneEnd = true;
            } // lastChar = currentChar end
            else {
              text("The village chief calls out to you:", 30, 450);
              text("Oh great warrior! Have you killed the monster yet? Please!", 30, 490);
              text("You are our only hope!", 30, 530);
            }
          }
        } // helm, hug, monsterDead = false end
      } // sceneState = 1 end

      if (sceneState == 2) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && helm == false && net == false) {
          if (cookieGiven == false) {
            text("The other villagers shriek in terror and scatter off in all directions.", 30, 450);
            text("'Please, don't hurt us! We beg of you! Just take this Delicious", 30, 490);
            text("Cookie and leave us in peace!' yells one of the villagers as she", 30, 530);
            text("grovels in front of you and holds out the cookie in offering.", 30, 570);
          }
          else if (cookieGiven == true) {
            text("The other villageres shriek in terror and scatter off in all directions.", 40, 450);
            text("'Um... sorry! ...accident!' you utter meekly into the now empty " +villagersLocation+ ".", 30, 490);
          }
        }

        if (monsterDead == true && cookieGiven == false) {
          text("You have to admit you were hoping for something more valuable,", 30, 450);
          text("but you accept the cookie gratiously anyway.", 30, 490);
          if (currentChar == nextChar) {
            text("You decide to stay and soak in the villagers love for you.", 30, 530);
          }
          else {
            text("You tuck it into your pocket and leave.", 30, 530);
          }
          cookieActivate = true;
          sceneEnd = true;
        }

        if (helm == false && hug == false && monsterDead == false) {
          if (firstEncounter == true) {
            if (currentChar == nextChar) {
              text("The villagers seem like cool guys. You decide", 30, 450);
              text("to hang out with them for a while.", 30, 490);
            }
            else {
              text("These villagers are really starting to harsh your mellow", 30, 450);
              text("with their loud pleading. You wish they'd just take a", 30, 490);
              text("chill pill and relax for a while. You find an opportunity", 30, 530);
              text("to slip out without making things too awkward.", 30, 570);
            }
          }
          else {
            text("You're really getting sick of this guy's endless nagging.", 30, 450);
            text("Can't he see that you're busy with important tasks?", 30, 490);
            if (nextChar == currentChar) {
              text("You keep talking and try to change the subject. It doesn't work.", 30, 530);
            } 
            else { // nextChar == currentChar end
              text("You make some vague excuses and leave hurriedly.", 30, 530);
            }
          }
          sceneEnd = true;
        } // helm, hug, monsterDead = false end
      } // sceneState = 2 end

      if (sceneState == 3) {
        fill(0);
        rect(0, 400, width, height);
        fill(255);

        if (hug == true && helm == false && net == false) {
          if (currentChar == nextChar) {
            text("You take the cookie and stand there awkwardly trying to come up with", 30, 450);
            text("a fitting apology.", 30, 490);
          }
          else {
            text("You take the cookie and then back away slowly, leaving the ", 30, 450);
            text(villagersLocation+" as casually as possible.", 30, 490);
          }
          cookieGiven = true;
          cookie = true;
          chiefDead = true;
          sceneEnd = true;
        } // hug = true, helm, net = false end
      } // sceneState = 3 end
    } // currentChar == villagers end
  } // action() end
} // class end



