
class BadGuys {
  float xRan;
  float yRan;
  float destinX;
  float destinY;
  int counter;
  int speedFrame;
  int letterPick;
  float leftBar;
  float topBar;
  float bottomBar;
  float rightBar;
  boolean contact = false;
  int zetter;
  float speed;
  //boolean visible = false;

  BadGuys(float xpos, float ypos) {
    xRan = xpos;
    yRan = ypos;
    destinX = xRan;
    destinY = yRan;
    speedFrame = int(random(2, 9));
    zetter = int(random(26));
    letterPick = zetter;
    leftBar = xpos;
    topBar = ypos;
    bottomBar = ypos + 35;
    rightBar = xpos + 35;
    speed = 1;
  }
  void update() {

    if (counter%60 == 0) {
      destinX = int(random(250, 500));
    }
    if (counter%60 == 0) {
      destinY = int(random(70, 400));
    }
    xRan += (destinX - xRan) * (speed/100);
    yRan += (destinY - yRan) * (speed/100);
    if (counter%speedFrame == 0) {
    }
    for (int i = 0; i < 26; i++) {
      if (letterPick == i) {
        if (contact == false) {
          image(letters[letterPick], xRan, yRan, 35, 35);
          leftBar = xRan;
          topBar = yRan;
          bottomBar = yRan + 35;
          rightBar = xRan + 35;
        }
      }
    }
    for (int i = 0; i < goodGuys.length; i++) {
        if (contact == true && letterPick+1 == goodGuys[i].letterToNumber) {
          //println("balls");
          winrar[i] = true;
        //  println(letterPick+1);
         goodGuys[i].visible = true;
        // println(goodGuys[i].visible);
        }
      }
    counter++;
  }
}


