
class BNTPlayer {
  //game mechanics
  private HashMap<Character, Integer> keyMap;
  private char powerKey;
  private ScreenSnake snake;
  private boolean wrapping;
  private PowerUp power;

  //scoring
  private boolean lost;
  private int score;
  private int numPower;

  //for reset
  private int initX;
  private int initY;
  private int initDirection;

  //for rick rolling and trolling
  boolean epicwinman; //makes player invincible

  public BNTPlayer(char[] keys, int initX, int initY, int initWidth, int initDirection, color playCol, boolean wrapping1) {
    keyMap = new  HashMap<Character, Integer>();

    //directional keys
    keyMap.put(keys[0], 0);
    keyMap.put(keys[1], 90);
    keyMap.put(keys[2], 180);
    keyMap.put(keys[3], 270);

    //key for powerups
    powerKey = keys[4];

    snake = new ScreenSnake(initX, initY, initWidth, initDirection, playCol, wrapping1);
    lost = false;
    wrapping = wrapping1;
    score = 0;

    //for reset    
    this.initX = initX;
    this.initY = initY;
    this.initDirection = initDirection;

    //other
    epicwinman = false;
  }

  public void move(char key1) {
    if (power != null) {
      power.checkTime(); //eventually change to java Timers
    }

    //change directions
    if (keyMap.containsKey(key1)) {
      snake.changeDir(keyMap.get(key1));
    }
    else if (key1 == powerKey) {
      if (power != null) {
        BNTron.k = ' ';
        power.activate();
      }
    }

    loadPixels();
    Point newP = snake.getNextLocation();
    color back = g.backgroundColor;
    color nextPix;

    int loc1 = newP.x + width*newP.y;
    int loc2 = newP.x + snake.getWidth() + width*newP.y;
    int loc3 = newP.x + snake.getWidth() + width*(newP.y + snake.getWidth());
    int loc4 = newP.x + width*(newP.y + snake.getWidth());
    int loc = newP.x + (snake.getWidth()/2) + width*(newP.y + snake.getWidth()/2);
    Point interPoint = null;

    if (((newP.x > width || newP.y > height) || (newP.x < 0 || newP.y < 0)) && !wrapping) {
      nextPix = BNTron.gameColors[0]; // this could become a problem if *1 averages out to one of the game colors - very unlikely.
    }
    else {
      nextPix = ((loc1 >= width*height ? back : pixels[loc1]) + (loc2 >= width*height ? back : pixels[loc2]) + (loc3 >= width*height ? back : pixels[loc3]) + (loc4 >= width*height ? back : pixels[loc4]) + (loc >= width*height ? back : pixels[loc]))/5; //*1
    }

    if (back != nextPix && !epicwinman) {
      if (nextPix == BNTron.gameColors[0] || pixels[loc] == BNTron.gameColors[0] || pixels[loc] == BNTron.gameColors[1]) {
        lost = true;
      }
      else {
        if (pixels[loc1] != back) {
          interPoint = new Point(newP.x, newP.y);
        }
        else if (pixels[loc2] != back) {
          interPoint = new Point(newP.x + snake.getWidth(), newP.y);
        }
        else if (pixels[loc3] != back) {
          interPoint = new Point(newP.x + snake.getWidth(), (newP.y + snake.getWidth()));
        }
        else if (pixels[loc4] != back) {
          interPoint = new Point(newP.x, (newP.y + snake.getWidth()));
        }

        if (interPoint != null) { //fix collsion detection so this check is not needed - it shouldn't be
          checkPowerUp(interPoint);
        }
      }
    }
    if (!lost) {
      snake.move();
    }
  }

  public boolean getState() {
    return lost;
  }

  public void reset() {
    snake = new ScreenSnake(initX, initY, snake.getWidth(), initDirection, snake.getColor(), wrapping);
    lost = false;
  }

  public void incrScore(int points) {
    score += points;
  }

  public int getScore() {
    return score;
  }

  public void setInvincibility(boolean inv) {
    epicwinman = inv;
  }

  private void checkPowerUp(Point interPoint) {
    Iterator<PowerUp> iter1 = BNTron.powerList.iterator();
    while (iter1.hasNext ()) {
      PowerUp currPower = iter1.next();
      Point powerPoint = currPower.getLoc();

      if ((powerPoint.x >= interPoint.x - currPower.size()/2 && powerPoint.x <= interPoint.x + currPower.size()/2) && (powerPoint.y >= interPoint.y - currPower.size()/2 && powerPoint.y <= interPoint.y + currPower.size()/2)) {
        power = new PowerUp(currPower, this);
        BNTron.powerList.remove(currPower);
        return;
      }
    }
  }
}


