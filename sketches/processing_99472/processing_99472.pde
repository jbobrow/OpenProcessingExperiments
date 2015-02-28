
class Scene
{   
  colorIcon[] icons;
  PImage backgroundImage;
  int currentHotIcon;
  dataPoint[] dangerPoints;
  int score;
  int playMode;

  //timer variables
  int startTime;
  int waitTime;
  boolean toggle;

  //count down timer
  timer counter;

  Scene(int sceneId)
  {
    backgroundImage = loadImage("game/scene"+sceneId+".png");
    icons = new colorIcon[5];

    for (int i = 0; i<5; i++) {
      icons[i] = new colorIcon(i, new PVector(20+i*120, 330));
    }

    currentHotIcon = 4;
    hotIcon(currentHotIcon);
    playMode = 4;
    score = 0;
    startTime = millis();
    waitTime = 300;
    toggle = false;
    counter = new timer();

    //configure all the circle points
    dangerPoints = new dataPoint[10];
    dangerPoints[0] = new dataPoint(new PVector(143, 174));
    dangerPoints[1] = new dataPoint(new PVector(109, 272));
    dangerPoints[2] = new dataPoint(new PVector(599, 100));
    dangerPoints[3] = new dataPoint(new PVector(181, 120));
    dangerPoints[4] = new dataPoint(new PVector(290, 181));
    dangerPoints[5] = new dataPoint(new PVector(534, 216));
    dangerPoints[6] = new dataPoint(new PVector(250, 236));
    dangerPoints[7] = new dataPoint(new PVector(373, 67));
    dangerPoints[8] = new dataPoint(new PVector(597, 268));
    dangerPoints[9] = new dataPoint(new PVector(181, 270));
  }

  void update() {
    image(backgroundImage, 0, 0);
    if (counter.update()) {
      playMode = 3;
    }

    switch(playMode) {
    case 0://gameplay
      for (int i = 0; i<dangerPoints.length; i++) {
        if (!dangerPoints[i].die) {
          if (mousePressed) {
            if (dist(mouseX, mouseY, dangerPoints[i].position.x, dangerPoints[i].position.y)<dangerPoints[i].dangerRadius/2) {
              dangerPoints[i].die = true;
              score ++;
              soundBank.play("right_3");
            }
          }
        }
        else {
          dangerPoints[i].drawRight();
        }
      }

      int testscore = 4-int((score*1.0/dangerPoints.length)*4);
      if (testscore!=currentHotIcon) {
        currentHotIcon = testscore;
        hotIcon(currentHotIcon);
      }

      if (score == dangerPoints.length) {
        playMode = 2;
        counter.start=false;
      }

      //drawing icons
      for (int i = 0; i<5; i++) {
        icons[i].update();
      }
      break;
    case 2://find out all the threats before time is up
      for (int i = 0; i<dangerPoints.length; i++) {
        dangerPoints[i].drawRight();
      }
      for (int i = 0; i<5; i++) {
        icons[i].update();
      }
      if (millis()-startTime>waitTime) {
        startTime = millis();
        toggle = !toggle;
      }

      image(messageScreen, 0, 0);
      fill(253, 188, 32);
      textAlign(CENTER);
      textFont(font, 32);
      text("Great job! You have cleared up all the potential threats and saved an innocent life! ", 120, 105, 500, 300);

      fill(200);
      if (toggle) {
        text("next!", width/2, 345);
      }      
      if (mousePressed) {
        if (mouseX>width/2-80 && mouseX<width/2+80 && mouseY>280 && mouseY<405) {
          stageId = 2;
        }
      }
      break;
    case 3://didn't find out all the threats before time is up
      for (int i = 0; i<dangerPoints.length; i++) {
        if (dangerPoints[i].die) {
          dangerPoints[i].drawRight();
        }
        else {
          dangerPoints[i].drawWrong();
        }
      }

      for (int i = 0; i<5; i++) {
        icons[i].update();
      }

      if (millis()-startTime>waitTime) {
        startTime = millis();
        toggle = !toggle;
      }

      image(messageScreen, 0, 0);
      fill(253, 188, 32);
      textAlign(CENTER);
      textFont(font, 32);
      text("Describe why player lost, what was missing.", 120, 105, 500, 300);

      fill(200);
      if (toggle) {
        text("restart!", width/2, 345);
      }

      if (mousePressed) {
        if (mouseX>width/2-80 && mouseX<width/2+80 && mouseY>280 && mouseY<405) {
          stageId = 2;
        }
      }

      break;
    case 4: //intro message screen
      image(messageScreen, 0, 0);
      fill(253, 188, 32);
      textAlign(CENTER);
      textFont(font, 32);
      text("We are at 1 minute before the crime scene. Please circle out all the possible threats to bring the alarm down and stop the crime from happening.", 120, 60, 500, 300);
      fill(200);
      if (toggle) {
        text("enter!", width/2, 345);
      }

      if (millis()-startTime>waitTime) {
        startTime = millis();
        toggle = !toggle;
      }

      if (mousePressed) {
        if (mouseX>width/2-80 && mouseX<width/2+80 && mouseY>280 && mouseY<405) {
          playMode = 0;
          counter.reset();
          counter.start = true;
          toggle = false;
        }
      }
      break;
    }
  }


  void hotIcon(int _index) {
    for (int i = 0; i<5; i++) {
      if (i == _index) {
        icons[i].hot = true;
      }
      else {
        icons[i].hot = false;
      }
    }
  }
}


