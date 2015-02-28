
String[] words = new String[] {
  "cat", "wheel", "island", "turtle", "chair", "ear", "shoe", "basketball", "octopus", "bed", "flag", "castle", "paint", "car", "horse", "pinwheel", "kite", "safetypin", "honeybee", "shoulderpad", 
  "submarine", "watermelon", "tea", "telephone", "whistle", "piano", "clam", "ring", "frog", "olive", "mailman", "mountain", "camel", "wind", "summer", "surfboard", "cow", "pencil", "shower", "glasses", 
  "stove", "chimney", "window", "rainbow", "moon", "peacock", "sky", "ocean", "volcano", "dinosaur", "whale", "elephant", "flea", "snail", "fireplace", "forest", "spoon", "lace", "gasoline", "rice"
};
String word;
boolean[] keys;
String dir;
boolean drawing;
boolean erasing;
boolean snakeAlive;
boolean started;
int prevColor;
int score;
int posX;
int posY;
int eatX;
int eatY;
int s = 7;

void setup() {
  size(800, 800);
  score = 0;
  newGame();
  frameRate(25);
}

void draw() {
  fill(0, 0, 255);
  rect(eatX, eatY, s, s);
  if (snakeAlive) {
    noStroke();
    int tempPosX = posX ;
    int tempPosY = posY ;
    if (dir.equals("right")) {
      if (drawing  && (get(posX + s, posY ) != color(150)) && started  || !inBounds())
        snakeAlive  = false;
      else
        posX += s;
    }
    else if (dir.equals("left")) {
      if (drawing  && (get(posX - s, posY ) != color(150)) && started  || !inBounds())
        snakeAlive  = false;
      else
        posX -= s;
    }
    else if (dir.equals("up")) {
      if (drawing  && (get(posX, posY - s) != color(150)) && started  || !inBounds())
        snakeAlive  = false;
      else
        posY -= s;
    }
    else if (dir.equals("down")) {
      if (drawing  && (get(posX, posY + s) != color(150)) && started  || !inBounds())
        snakeAlive  = false;
      else
        posY += s;
    }  
    prevColor  = get(posX, posY);
    if (erasing) {
      fill(255);
      rect(posX, posY, s, s);
      fill(150);
      rect(tempPosX, tempPosY, s, s);
    }
    else if (!drawing) {
      fill(250, 250, 0);
      rect(posX, posY, s, s);
      fill(prevColor);
      rect(tempPosX, tempPosY, s, s);
    }
    else {
      fill(200, 10, 10);
      rect(posX, posY, s, s);
    }
  }
  else {       
    newGame();
  }
}

void newGame() {
  background(150);
  word = words[(int) random(words.length)];
  drawing = true;
  erasing = false;
  snakeAlive = true;
  started = false;
  dir = "";
  keys = new boolean[526];
  posX = width/2;
  posY = height/2;
  eatX = (int) random(0, width/s) * s;
  eatY = (int) random(0, height/s) * s;
  background(150);
  fill(255);
  text(word, width/2-5, 15);
  noFill();
  stroke(0);
}

boolean inBounds() {
  return !(posX  <= 0 || posX+s >= width || posY  == height || posY  == 0);
}

boolean checkKey(String k)
{
  for (int i = 0; i < keys.length; i++)
    if (KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i];  
  return false;
}

void keyPressed()
{ 
  keys[keyCode] = true;
  if (checkKey("d")) {
    dir = "right";
    started   = true;
  }
  else if (checkKey("a")) {
    dir = "left";
    started   = true;
  }
  else if (checkKey("w")) {
    dir = "up";
    started   = true;
  }
  else if (checkKey("s")) {
    dir = "down";
    started   = true;
  }
  if (checkKey("q")) {
    drawing = !drawing  ;
    erasing = false;
  }
  if (checkKey("e")) {
    erasing = !erasing  ;
    drawing = false;
  }
}

void keyReleased()
{ 
  keys[keyCode] = false;
}


