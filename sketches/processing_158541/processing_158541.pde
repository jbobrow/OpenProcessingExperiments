
/*!
 * it's cloudy
 *
 * Florian Pircher
 * 3BT
 */

String server = "http://static.addpixel.net/its-cloudy/";

int groundHeight = 90, // the height of the ground
    lastRainTimeCheck = 0, // millis
    rainAmount = 100, // how may raindrops?
    dropCount = 0, // current count, should go up to `rainAmount`
    score = 0, // points
    highScore, // highest score ever reach
    lightningFrames = 0, // framecount for a lightning
    checkCounter = 0, // don't check for wetness every time!
    time = 0, // the time
    startTime = 0, // after the intro
    startFrames = 0; // after the intro

boolean paused = false, // state: pause
        night = false, // state: night
        end = false; // the end is near

PImage city, cityAN, // city-image, day&night
       mountains, mountainsAN, // mountains-image, day&night
       firefly, // little orange dot
       lightning, // a lightning
       plane, planeAN; // an airplane

PFont lilitaOne; // fluffy font

Sky sky; // the sky
Drop[] rain; // the raindrop array
Cloud cloud; // the cloud
Person[] persons; // all persons
Firefly[] fireflys; // cluster of fireflys
Intro intro; // show the introimages
Cryptify cryptify; // protect the score-file value
Airplane airplane; // an airplane
Powerbar powerbar; // the powerbar
DayNightTransition dayNightTransition; // transitions!

Color textColor; // the color of the text

Animation personLTR, personRTL, // the walker: left-to-right, right-to-left
          personLTRAN, personRTLAN, // the walker @ night: left-to-right, right-to-left
          carLTR, carRTL, // the car: left-to-right, right-to-left
          carLTRAN, carRTLAN; // the car @ night: left-to-right, right-to-left

/* ----------------------------------- setup */

void setup() {
  size(400, 600);

  /* system */
  lastRainTimeCheck = millis(); // reset time

  /* background */
  noStroke(); // never ever draw a stroke!
  background(42); // dark gray

  /* ------------------------- set up media */

  /* landscape */
  city = loadImage(server + "assets/city/city.png");
  cityAN = loadImage(server + "assets/city/city@night.png");

  mountains = loadImage(server + "assets/mountains/mountains.png");
  mountainsAN = loadImage(server + "assets/mountains/mountains@night.png");

  /* load media */
  firefly = loadImage(server + "supporting_files/firefly.png");
  plane = loadImage(server + "assets/airplane/airplane.png");
  planeAN = loadImage(server + "assets/airplane/airplane@night.png");

  lightning = loadImage(server + "supporting_files/lightning.png");

  /* fonts */
  lilitaOne = createFont("LilitaOne.ttf", 28);
  textFont(lilitaOne, 28);

  /* ------------------------- set up objects */

  /* objects */
  intro = new Intro(4000);
  cryptify = new Cryptify();
  powerbar = new Powerbar();
  sky = new Sky();
  cloud = new Cloud();
  airplane = new Airplane();
  dayNightTransition = new DayNightTransition();
  textColor = new Color(158, 148, 97, 134, 93, 91);

  int i = 0;

  /* rain */
  rain = new Drop[rainAmount];

  i = 0;
  
  while (i < rainAmount) {
    rain[i] = new Drop(0, 0, 10);
    i++;
  }

  /* persons */
  int delay = 0;

  persons = new Person[5];

  i = 0; 
  
  while (i < 5) {
    persons[i] = new Person(int(random(delay, delay + 100)));

    delay += 300;
    i++;
  }

  /* car driving */
  carLTR = new Animation(server + "assets/car/a-png.ltr/car.", 3);
  carRTL = new Animation(server + "assets/car/a-png.rtl/car.", 3);
  carLTRAN = new Animation(server + "assets/car/a-png.ltr@night/car.", 3);
  carRTLAN = new Animation(server + "assets/car/a-png.rtl@night/car.", 3);

  /* person walking */
  personLTR = new Animation(server + "assets/person/a-png.ltr/person.", 12);
  personRTL = new Animation(server + "assets/person/a-png.rtl/person.", 12);
  personLTRAN = new Animation(server + "assets/person/a-png.ltr@night/person.", 12);
  personRTLAN = new Animation(server + "assets/person/a-png.rtl@night/person.", 12);

  /* fireflys */
  fireflys = new Firefly[4];

  i = 0;
  
  while (i < 4) {
    fireflys[i] = new Firefly();
    i++;
  }

  /* set values */
  getHighscore();
}

/* ----------------------------------- framework */

int parallax(int value, float amount) { // value: normal x-position; amount: parallax-amount
  return value - int(mouseX / amount) + int(width / (amount * 2));
}

int ct(float n1, float n2, float ratio) { // colortransition
  float outcome = n1;

  if (n1 < n2) {
    outcome = n1 + (n2 - n1) * (ratio / 100);
  } else if (n1 > n2) {
    outcome = n1 - (n1 - n2) * (ratio / 100);
  }

  return int(outcome);
}

/* ----------------------------------- input */

/* day/night */

void mousePressed() {
  if (night && powerbar.isFull() && !end) {
    drawLightning();
  }
}

/* ----------------------------------- class */

/* ----------------------------------- Color */

class Color {
  float red, green, blue, 
        redNight, greenNight, blueNight;

  Color(float _red, float _green, float _blue, float _redNight, float _greenNight, float _blueNight) {
    red = _red;
    green = _green;
    blue  = _blue;

    redNight = _redNight;
    greenNight = _greenNight;
    blueNight  = _blueNight;
  }

  void use() {
    if (dayNightTransition.isWorking) {
      float percent = dayNightTransition.progress();

      if (!dayNightTransition.toNight) { percent = 100 - percent; }

      fill(ct(red, redNight, percent), ct(green, greenNight, percent), ct(blue, blueNight, percent));
    } else if (night) {
      fill(redNight, greenNight, blueNight);
    } else {
      fill(red, green, blue);
    }
  }
}

/* ----------------------------------- Cryptify */

class Cryptify {
  int secret = 7961532;

  int digitsSum(int n) {
    int remainder = 0, 
        sum = 0;

    while (n != 0) {
      remainder = n % 10;
      sum += remainder;
      n /= 10;
    }

    return sum;
  }

  String encode(int n) {
    int result = n, 
        checkData = 0;

    result += secret;
    result *= 3;

    checkData = this.digitsSum(result);
    checkData *= (secret / 7);

    return result + "O" + checkData;
  }

  int decode(String n) {
    String[] data = split(n, 'O');

    int result = 0, 
        checkData = 0;

    if (data.length == 2) {
      result = int(data[0]);
      checkData = int(data[1]);

      if (this.digitsSum(result) == checkData / (secret / 7)) {
        result /= 3;
        result -= secret;
      } else {
        result = 0;
      }
    }

    return result;
  }
}

/* ----------------------------------- Day/Night */

class DayNightTransition {
  float opacity = 0, // min: 0; max: 255
        step = 0;

  boolean isWorking = false, 
          toNight = true; // true: day Ã�Â¢Ã¯Â¿Â½Ã¯Â¿Â½ night; false: night Ã�Â¢Ã¯Â¿Â½Ã¯Â¿Â½ day

  void draw() {
    this.isWorking = true;

    if (step > TWO_PI) { step = 0; }

    step += 0.15;
    opacity = sin(step - (PI / 2)) * 127.5 + 127.5;

    fill(0, int(this.opacity));
    rect(0, 0, width, height);
  }

  float progress() {
    return step * 100 / TWO_PI;
  }

  void reset() {
    step = 0;
  }

  void end() {
    toNight = !toNight;
    this.isWorking = false;
    this.reset();
  }
}

/* ----------------------------------- Intro */

class Intro {
  int frame = 0, 
      currentFrame = 0, 
      frameDuration = 3000, 
      delay = millis(), 
      pressedTime = 0;

  boolean hasFinished = false, 
          pressed = false;

  PImage logo = loadImage(server + "supporting_files/intro/logo.png"), 
         splash = loadImage(server + "supporting_files/intro/splash.png"), 
         enter = loadImage(server + "supporting_files/intro/enter.png"), 
         enterPressed = loadImage(server + "supporting_files/intro/enter.pressed.png");

  Intro(int _frameDuration) {
  
    frameDuration = _frameDuration;
    delay = millis();
  }

  void draw() {
    if (pressed && millis() > pressedTime + 250) {
      hasFinished = true;
      startTime = millis();
      startFrames = frameCount;
    } else if (millis() > frameDuration * 2 + delay) {
      if (keyPressed && key == ' ') { // if spacebarÃ�Â¢Ã¯Â¿Â½Ã�Â¦
        image(enterPressed, 0, 0);
        pressed = true;
        pressedTime = millis();
      } else {
        image(enter, 0, 0);
      }
    } else if (millis() > frameDuration + delay) {
      image(splash, 0, 0);
    } else {
      image(logo, 0, 0);
    }
  }
}

/* ----------------------------------- Sky */

class Sky {
  int h = height - groundHeight;

  void clear() {
    if (lightningFrames > 0) {
      fill(162, 110, 109);
    } else if (night) { 
      fill(60, 42, 41);
    } else { 
      fill(250, 235, 164);
    }

    rect(0, 0, width, h);
  }
}

/* ----------------------------------- Powerbar */

class Powerbar {
  int x = width - 75, 
      y = 15;

  float value = 0;

  void draw() {
    textColor.use();

    textAlign(RIGHT);
    text(int(value) + "%", parallax(width - 15, -35), 36);

    /* set powerbar */
    if (value < 100) { value += 0.1; }
  }

  /* powerbar is full */
  boolean isFull() {
    if (int(value) == 100) {
      return true;
    } else {
      return false;
    }
  }

  /* empty the powerbar */
  void empty() {
    value = 0;
  }
}

/* ----------------------------------- Cloud */

class Cloud {
  int w = 135, 
      h = 96, 
      x = 0, 
      y = 105, 
      shiftY = 0;

  Color fillColor = new Color(255, 250, 230, 124, 68, 59);

  /* draw */
  void draw() {
    x = parallax(mouseX - 66, 2.9);

    if (lightningFrames > 0) { // lightning
      throwLightning();
      lightningFrames--;

      fill(255);
    } else { // normal
      fillColor.use();
    }

    shiftY = int(sin(float(frameCount) / 25) * 10);

    ellipse(x + 50, y + shiftY, 80, 80);
    ellipse(x + 93, y + shiftY, 60, 60);
    ellipse(x + 25, y + shiftY + 25, 50, 50);
    ellipse(x + 115, y + shiftY + 25, 40, 40);
    ellipse(x + 69, y + shiftY + 28, 113, 55);
  }
}

/* ----------------------------------- Drop */

class Drop {
  int x = 0, 
      y = 0, 
      speed = 9;

  Color fillColor = new Color(78, 125, 87, 197, 140, 119);

  boolean visible = true;

  /* contructor */
  Drop(int xTemp, int yTemp, int speedTemp) {
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
  }

  /* draw */
  void draw() {
    if (visible) {
      fillColor.use();
      rect(x, y, 1, 8);
    }
  }

  /* push down */
  void gravity() {
    y += speed;

    if (y < cloud.y + 35) { // to high
      this.reset();
    }
  }

  /* reset values */
  void reset() {
    if (!end) {
      x = cloud.x + int(random(135));
      y = cloud.y + int(random(35, 55));
      speed = int(random(8, 10));
      visible = true;
    }
  }
}

/* ----------------------------------- Animation */

class Animation {
  PImage[] images;
  int imageCount;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 1; i <= imageCount; i++) {
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i - 1] = loadImage(filename);
    }
  }

  void draw(int x, int y, int frame) {
    image(images[frame], x, y);
  }
}

/* ----------------------------------- Person */

class Person {
  int type, // 0: car, 1: walker
      w, 
      h, 
      x, 
      y, 
      speed, 
      direction = 1, 
      delay, 
      frame, 
      frameSpeed = 2, 
      wet = 0;

  boolean isWet = false, 
          isAmbitious = false;

  /* contructor */
  Person(int _delay) {
    delay = _delay;
    this.reset();
  }

  /* draw */
  void draw() {
    if (type == 0) { // car
      if (frameCount % frameSpeed == 0) {
        frame = (frame + 1) % 3;
      }

      if (direction == 1) {
        if (night) {
          carLTRAN.draw(parallax(x, -14), y, frame);
        } else {
          carLTR.draw(parallax(x, -14), y, frame);
        }
      } else {
        if (night) {
          carRTLAN.draw(parallax(x, -14), y, frame);
        } else {
          carRTL.draw(parallax(x, -14), y, frame);
        }
      }
    } else if (type == 1) { // walker
      if (frameCount % frameSpeed == 0) {
        frame = (frame + 1) % 12;
      }

      if (direction == 1) {
        if (night) {
          personLTRAN.draw(parallax(x, -14), y, frame);
        } else {
          personLTR.draw(parallax(x, -14), y, frame);
        }
      } else {
        if (night) {
          personRTLAN.draw(parallax(x, -14), y, frame);
        } else {
          personRTL.draw(parallax(x, -14), y, frame);
        }
      }
    }
  }

  /* move */
  void move() {
    x += speed * direction;

    if ((x - w > width && direction == 1) || (x + w * 2 < 0 && direction == -1)) { // invisible
      this.reset();
    }
  }

  /* set direction */
  void setDirection(int directionTemp) {
    direction = directionTemp;
  }

  /* flip the direction */
  void flipDirection() {
    direction *= -1;
  }

  /* person gets wet */
  void getsWet() {
    wet++;

    if (wet > 5 && !isWet) {
      isWet = true;
      frameSpeed = 1;
      speed = 2;

      if (!isAmbitious) { 
        this.flipDirection();
      }
    }
  }

  /* is visuble */
  boolean visible() {
    if (x + w > 0 && x < width) {
      return true;
    } else {
      return false;
    }
  }

  /* reset */
  void reset() {
    type = int(random(2));
    direction = int(random(2)) == 0 ? 1 : -1;

    if (type == 0) { // car
      w = 90;
      h = 58;
      speed = int(random(3, 5));
      delay = int(random(700, 1200));
      frameSpeed = 1;
    } else if (type == 1) { // walker
      w = 24;
      h = 61;
      speed = 1;
      delay = int(random(70, 320));
      wet = 0;
      isWet = false;
      frameSpeed = 2;

      if (int(random(3)) == 0) {
        isAmbitious = true;
      } else {
        isAmbitious = false;
      }
    }

    x = direction == 1 ? 0 - w - delay : width + w + delay;
    y = sky.h - h;
  }
}

/* ----------------------------------- Firefly */

class Firefly {
  int x = 0, 
      y = 0, 
      direction = 1, 
      amplitude = 20, 
      frequency = 30;

  float floatX, 
        speed = 1;

  /* contructor */
  Firefly() {
    this.reset();
  }

  /* draw */
  void draw() {
    fill(255);
    image(firefly, parallax(x, -10), y + (sin(float(x) / frequency) * amplitude));
  }

  /* move */
  void move() {
    if (floatX > width + 42) {
      floatX = -42;
    } else if (floatX < -42) {
      floatX = width + 42;
    } else {
      floatX += speed * direction;
      x = int(floatX);
    }
  }

  /* reset */
  void reset() {
    floatX = random(0, width);
    y = sky.h - int(random(30, 110));
    speed = random(0.1, 0.5);
    direction = int(random(2)) == 0 ? 1 : -1;
    amplitude = int(random(10, 30));
    frequency = int(random(30, 70));
  }
}

/* ----------------------------------- Airplane */

class Airplane {
  int x = width + 150, 
    y = 195, 
    w = 366, 
    h = 50, 
    speed = 3;

  Color highscoreTextColor = new Color(142, 142, 142, 30, 30, 30);

  void draw() {
    if (night) {
      image(planeAN, parallax(x, -20), y);
    } else {
      image(plane, parallax(x, -20), y);
    }

    highscoreTextColor.use();

    textAlign(CENTER);
    text("Highscore: " + highScore, parallax(x + 260, -20), y + 29);
  }

  void move() {
    x -= speed;

    if (x < -w - 500) { x = width; }
  }
}

/* ----------------------------------- landscape */

/* draw ground */

void drawGround() {
  Color groundColor = new Color(95, 44, 22, 33, 69, 69), 
  tarColor = new Color(69, 35, 23, 39, 82, 82);

  groundColor.use();
  rect(0, sky.h, width, groundHeight);

  tarColor.use();
  rect(0, sky.h, width, 2);
}

/* draw landscape */

void drawLandscape() {
  if (night) {
    image(mountainsAN, parallax(-263 + (width / 2), 50), sky.h - 227);
    image(cityAN, parallax(-263 + (width / 2), -15), sky.h - 144);
  } else {
    image(mountains, parallax(-263 + (width / 2), 50), sky.h - 227);
    image(city, parallax(-263 + (width / 2), -15), sky.h - 144);
  }
}

/* ----------------------------------- text */

void setLogo() {
  textColor.use();

  textAlign(CENTER);
  text("it's cloudy", parallax(width / 2, -35), 36);
}

/* ----------------------------------- timer */

void setTimer() {
  time = int(120 - ((millis() - startTime) / 1000));

  textColor.use();

  textAlign(LEFT);
  text(time > 0 ? time : 0, parallax(15, -35), 36);
}

/* score */

void setScore() {
  Color groundTextColor = new Color(154, 109, 90, 92, 132, 132);
  
  groundTextColor.use();

  textAlign(RIGHT);
  text("Score: " + score, parallax(width - 33, -15), sky.h + 53);
}

/* ----------------------------------- rain */

/* draw rain */

void drawRain() {
  int i = 0;

  while (i < rainAmount && i < dropCount) {
    rain[i].draw();
    rain[i].gravity();

    i++;
  }
}

/* reset rain */

void resetRain() {
  int i = 0;

  while (i < rainAmount && i < dropCount) {
    if (rain[i].y > sky.h - 8) {
      rain[i].reset();
    }

    i++;
  }
}

/* make rain */

void makeRain() {
  int i = 0, 
      noobi = 0;

  while (i < rainAmount && noobi < 3) {
    if (rain[i].x == 0) {
      rain[i].reset();

      dropCount++;
      noobi++;
    }

    i++;
  }
}

/* ----------------------------------- fireflys */

void resetFireflys() {
  int i = 0;

  while (i < 4) {
    fireflys[i].reset();

    i++;
  }
}

void drawFireflys() {
  int i = 0;

  while (i < 4) {
    fireflys[i].move();
    fireflys[i].draw();

    i++;
  }
}

/* ----------------------------------- lightning */

void throwLightning() {
  image(lightning, parallax(cloud.x - 120, -30), 0);

  powerbar.empty();
}

void drawLightning() {
  lightningFrames = 3;

  /* get bonus */
  int i = 0;

  while (i < 5) { // check the lightning with all persons
    if (persons[i].visible()) { 
      score += 100;
    }

    i++;
  }
}

/* ----------------------------------- persons */

void checkForWetness() {
  int i = 0, 
      j = 0;

  while (i < rainAmount && i < dropCount) {
    if (rain[i].y < 150 || rain[i].visible == false) { 
      i++; 
      continue;
    } // the drop is to high or invisible, next!

    j = 0;

    while (j < 5) { // check that drop with all persons
      if (rain[i].x >= persons[j].x && rain[i].y >= persons[j].y && rain[i].x < persons[j].x + persons[j].w) { // hit
        if (persons[j].type == 1 && !persons[j].isWet) { // if the person is a dry walker
          persons[j].getsWet();
        }

        /* make raindrop invisible */
        rain[i].visible = false;

        /* raise the score */
        score++;
      }

      j++;
    }

    i++;
  }
}

void drawPersons() {
  int i = 0;

  while (i < 5) {
    persons[i].draw();
    persons[i].move();
    i++;
  }
}

/* ----------------------------------- end game */

void getHighscore() {
  String[] highScoreFile = loadStrings("high-score.icsd");
  highScore = cryptify.decode(highScoreFile[0]);
}

void drawAirplane() {
  airplane.draw();
  airplane.move();
}

void endGame() {
  if (highScore < score && !end) { // new highscore
    highScore = score; 
    saveStrings("data/high-score.icsd", split(cryptify.encode(score), ' ')); // split() because array
  }

  end = true;
}

/* ----------------------------------- game */

void drawGame() {
  sky.clear();
  drawLandscape();

  if (night) { drawFireflys(); }
  if (end) { drawAirplane(); }

  /* day/night */
  if ((frameCount - startFrames) % 1500 > 1458) { // range
    dayNightTransition.draw();
  } else if ((frameCount - startFrames) % 1500 == 0) { // end
    dayNightTransition.end();
  } if ((frameCount - startFrames) % 1500 == 1478) { // switch
    night = !night;
    if (night) { resetFireflys(); }
  }

  cloud.draw();
  drawPersons();

  /* rain */
  if (millis() >= lastRainTimeCheck + 100) {
    lastRainTimeCheck = millis();
    makeRain();
  }

  resetRain();
  drawRain();

  /* ground */
  drawGround();

  /* check for wetness */
  checkCounter++;

  if (checkCounter % 7 == 0 && !end) {
    checkForWetness();
    checkCounter = 0;
  }

  /* text */
  setTimer();
  setLogo();
  powerbar.draw();
  setScore();

  /* end game */
  if (millis() - startTime >= 120000 && !end) {
    endGame();
  }
}

/* ----------------------------------- main-draw */

void draw() {
  if (intro.hasFinished) {
    drawGame();
  } else {
    intro.draw();
  }
}
