
void dungeontitle() { // Upon entering dungeon
  if (floor == 1) {
    if (timer.isFinished()) {
      fade = true;
      tint(255, 255, 255, f); // Fade out
      //animation = false;
    }
    else {
      tint(255, 255, 255, f); // Fade in
      //animation = true;
    }
    image(levelname1, 225, 255-(f*.1));
  }
}

void hudAddition() {
  if (floor == 21) {
    for (Boss bosssrc: bosssources) {
      if (bosssrc.hp > 0) {
      stroke(2);
      fill(255,0,0);
      rect(425,100,750,20);
      fill(0, 255, 0);
      rect(425, 100,bosssrc.hp*(750/250), 20);
      fill(255);
      textFont(font,32);
      textAlign(RIGHT);
      text("BOSS",425,125);
      if (timer.isFinished()) {
        fade = true;
        fill(255, 255, 0, f*2);
        bosssrc.update();
      }
      else {
        fade = false;
        fill(255, 255, 0, f*2);
      }
      textAlign(CENTER);
      textFont(font, 32);
      text("FIGARO CHAMBER", width/2, (height/4));
      textFont(font, 48);
      text("ARRGHUS", width/2, (height/3));
      }
    }
  }
  else if (floor > 1) { // Display dungeon floor
    if (timer.isFinished()) {
      fade = true;
      fill(255, 255, 0, f*2);
    }
    else {
      fade = false;
      fill(255, 255, 0, f*2);
    }
    textAlign(CENTER);
    textFont(font, 32);
    text("FIGARO TOWER", width/2, (height/4));
    textFont(font, 48);
    text("FLOOR " + floor, width/2, (height/3));
  }
  if (talk > 0) { // Talk
    fill(millis()/1.5 % 255);
    rect(1222,657,25,25);
  }
  if (player1.hp == 0) {
    fill(255);
    textAlign(CENTER);
    textFont(font2, 24);
    text("Press the ESC key to return back home or use your Medkit to revive.",width/2,500);
  }
}

// Sword
void attack() {
  stroke(0, 255, 255);
  strokeWeight(10);
  imageMode(CORNER);
  tint(134,101,38,255);
  swords = new ArrayList<Sword>();
  if (swordReady == true) {
    if (direction == 0) { // Up
      image(swordready[2*frame_count],player1.x-25, player1.y-85, 75, 75);
      swords.add(new Sword(player1.x+10,player1.y-55));
    }
    if (direction == 1) { // Left
      image(swordready[3*frame_count],player1.x-65, player1.y-30, 75, 75);
      swords.add(new Sword(player1.x-35,player1.y+7));
    }
    if (direction == 2) { // Down
      image(swordready[0*frame_count],player1.x-25, player1.y+10, 75, 75);
      swords.add(new Sword(player1.x+10,player1.y+55));
    }
    if (direction == 3) { // Right
      image(swordready[1*frame_count],player1.x+15, player1.y-30, 75, 75);
      swords.add(new Sword(player1.x+60,player1.y+7));
    }
  }
  //swordsound.rewind();
  //swordsound.play();
  if (timer2.isFinished()) {
    swordReady = false;
  }
}

class Timer {
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}


