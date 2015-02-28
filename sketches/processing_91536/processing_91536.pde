
/**Instructions:<br>
move using WASD.<br>
Shovel boulder with SPACE (if in a valid location, boulder appears on release, else shovel makes a "cling").<br>
Pause with 'p'.<br>
Toggle sound with 'b'.<br>
<br>
The player must have full strength to shovel a boulder.<br>
Strength must recharge after shoveling or failing to shovel a boulder.<br>
Reflect Torlyn's bolts off boulders to activate them.<br>
Active bolts affect power orbs surrounding Torlyn and Torlyn.<br>
When a power orb is hit with a bolt, it is disloged and begins following you and eventually explodes into smaller orbs.<br>
When Torlyn is hit, a heart is released.<br>
If all power orbs are dislodged, Torlyn becomes weakened and bolts hitting the beast are worth 2000 points.<br>
Hitting Torlyn while weakened prolongs Torlyn's recharge.<br>
After Torlyn recharges, bolts become more frequent and/or more power orbs circle Torlyn.<br>
*/
import ddf.minim.*;

SCharacter player;
SDragon torlyn;
boolean up = false, down = false, left = false, right = false, 
shoveling, paused, charging, canRestart, firstCall=true, sound = true;
int shovelUp;
int time;
int yourScore;
final int FULL_CHARGE = 1000;
float yourHealth, yourStr, torlynRecharge, boltPer;
PImage backg;
final PFont monoFont = createFont("Monospaced.bold", 48);
final Minim loader = new Minim(this);
AudioPlayer cling, vloop, foop, khuh;
// objects on field
ArrayList<Bolt> bo;
ArrayList<FPowerOrb> followOrbs;
ArrayList<EPowerOrb> explodeOrbs;
ArrayList<Rock> rocks;
ArrayList<Heart> healers;
ArrayList<FloatingText> points;

void setup() {
  size(1000, 400);
  if (firstCall) {
    noLoop();
    canRestart = true;
    background(0);
    image(loadImage("Objects\\LightningBolt\\Bolt1.png"), 0, 0, 1000, 400);
    image(loadImage("Characters\\Character\\RightShovel2.png"), 10, 230, 160, 160);
    image(loadImage("Characters\\Torlyn\\Torlyn.png"), 200, 0, 800, 400);
    fill(255);
    textAlign(CENTER);
    textFont(monoFont, 100);
    text("Toryln's Storm", width/2, 150);
    textFont(monoFont, 50);
    text("Press 'n' to\nbegin your battle", width/2, 250);
  }
  else {
    background(0);
    fill(255);
    textAlign(LEFT);
    textFont(monoFont, 24);
    text("Loading game...", 0, 50);

    player = new SCharacter("Characters\\Character", width/4, height/2-20);
    torlyn = new SDragon("Characters\\Torlyn", 700, (height-100)/2, (height-100)/2, 10);
    frameRate(30);
    cling = loader.loadFile("cling.WAV");
    vloop = loader.loadFile("vloop.WAV");
    foop = loader.loadFile("foop.WAV");
    khuh = loader.loadFile("khuh.WAV");
    backg = createBackground(40, 20);

    shoveling = false;
    paused = false;
    charging = false;
    canRestart = false;

    yourHealth = 100;
    yourStr = 100;
    torlynRecharge = 100;
    boltPer = 90;
    shovelUp = 0;
    time = 0;
    yourScore = 0;

    bo = new ArrayList<Bolt>();
    followOrbs = new ArrayList<FPowerOrb>();
    rocks = new ArrayList<Rock>();
    healers = new ArrayList<Heart>();
    explodeOrbs = new ArrayList<EPowerOrb>();
    points = new ArrayList<FloatingText>();
  }
}

void draw() {
  if (!firstCall) {
    time++;
    if (time % 2 == 0) {
      //move player
      yourStr+=6;
      if (yourStr>100) yourStr=100;
      float factor = 1;
      if ((up||down) && (left||right)) factor = 1/sqrt(2);
      if (shoveling) factor /= 2;
      if (up&&!down)
        if (player.getY()-5>=0) {
          Rock r = hitRock(player.getX(), player.getY()-(int)(10*factor), 40, 40, rocks);
          if (r != null) {
            float angle = atan2((player.getY()+player.getHeight()/2)-(r.getY()+r.getHeight()/2), (player.getX()+player.getHeight()/2)-(r.getX()+r.getHeight()/2))%(2*PI);
            if (abs(cos(angle)) <= 1/sqrt(2)) player.moveCharacter(1, -(int)((r.getY() + r.getHeight()) - player.getY()));
            else player.moveCharacter(1, (int)(10*factor));
          } 
          else player.moveCharacter(1, (int)(10*factor));
        }
        else player.turn(1);
      else if (down&&!up)
        if (player.getY()+player.getHeight()+5<=height) {
          Rock r = hitRock(player.getX(), player.getY()+(int)(10*factor), 40, 40, rocks);
          if (r != null) {
            float angle = atan2((player.getY()+player.getHeight()/2)-(r.getY()+r.getHeight()/2), (player.getX()+player.getHeight()/2)-(r.getX()+r.getHeight()/2))%(2*PI);
            if (abs(cos(angle)) <= 1/sqrt(2)) player.moveCharacter(0, (int)(r.getY() - (player.getY()+player.getHeight())));
            else player.moveCharacter(0, (int)(10*factor));
          } 
          else player.moveCharacter(0, (int)(10*factor));
        }
        else player.turn(0);
      if (left&&!right)
        if (player.getX()-10>=3*40) {
          Rock r = hitRock(player.getX()-(int)(10*factor), player.getY(), 40, 40, rocks);
          if (r != null) {
            float angle = atan2((player.getY()+player.getHeight()/2)-(r.getY()+r.getHeight()/2), (player.getX()+player.getHeight()/2)-(r.getX()+r.getHeight()/2))%(2*PI);
            if (abs(sin(angle)) <= 1/sqrt(2)) player.moveCharacter(3, -(int)((r.getX() + r.getWidth()) - player.getX()));
            else player.moveCharacter(3, (int)(10*factor));
          } 
          else player.moveCharacter(3, (int)(10*factor));
        }
        else player.turn(3);
      else if (right&&!left)
        if (player.getX()+player.getWidth()+10<=620) {
          Rock r = hitRock(player.getX()+(int)(10*factor), player.getY()+1, 40, 40-1, rocks);
          if (r != null) {
            float angle = atan2((player.getY()+player.getHeight()/2)-(r.getY()+r.getHeight()/2), (player.getX()+player.getHeight()/2)-(r.getX()+r.getHeight()/2))%(2*PI);
            if (abs(sin(angle)) <= 1/sqrt(2)) player.moveCharacter(2, (int)(r.getX() - (player.getX()+player.getWidth())));
            else player.moveCharacter(2, (int)(10*factor));
          } 
          else player.moveCharacter(2, (int)(10*factor));
        }
        else player.turn(2);
      if (shoveling)
        player.shovel(true);
      if (shovelUp > 0) {
        player.shovel(false);
        shovelUp--;
        if (shovelUp == 0) {
          player.standStill();
        }
      }
    }

    //move torlyn
    if (charging) {
      if (torlynRecharge<FULL_CHARGE) torlynRecharge+=2;
      else {
        torlynRecharge=FULL_CHARGE;
        if (boltPer > 15) boltPer-=15;
        else torlyn.increaseOrbs(2);
        if (boltPer % 10 == 5) torlyn.increaseOrbs(2);
        torlyn.refreshOrbs();
        charging = false;
        changeScore(1000, torlyn.getX(), torlyn.getY());
      }
    }
    if (time%2==0) {
      torlyn.move(PI/90);
      if (time % 6 == 0) torlyn.changeSprite();
    }

    if (time%2==0) {
      //handle orbs
      torlyn.rotateOrbs(PI/90, false);
      torlyn.waveOrbs(100, 20, 2);
      for (int fOr = followOrbs.size()-1;fOr >= 0;fOr--) {
        if (collided(player.getX(), player.getY(), 40, 40, (int)followOrbs.get(fOr).getX(), (int)followOrbs.get(fOr).getY(), 20, 20)) {
          followOrbs.remove(fOr);
          player.hit(5); 
          changeHealth(-10);
        }
        else if (!followOrbs.get(fOr).isAlive()) {
          changeScore(200, followOrbs.get(fOr).getX(), followOrbs.get(fOr).getY());
          if (sound) {
            foop.rewind();
            foop.play();
          }
          for (float a = 0; a < 2*PI; a += PI/4) {
            explodeOrbs.add(new EPowerOrb("Objects\\PowerOrb", followOrbs.get(fOr).getX(), followOrbs.get(fOr).getY(), a));
          }
          followOrbs.remove(fOr);
        }
        else followOrbs.get(fOr).move(200, player.getX()+player.getWidth()/2, player.getY()+player.getHeight()/2);
      }
      for (int i = explodeOrbs.size()-1; i >= 0; i--) {//handle orb explosion
        explodeOrbs.get(i).move(20);
        if (collided(player.getX(), player.getY(), 40, 40, (int)explodeOrbs.get(i).getX(), (int)explodeOrbs.get(i).getY(), 10, 10)) {
          player.hit(5); 
          changeHealth(-2);
          explodeOrbs.remove(i);
        } 
        else if (explodeOrbs.get(i).getY() > height && sin(explodeOrbs.get(i).getAngle())>0) explodeOrbs.remove(i);
        else if (explodeOrbs.get(i).getY()+10<0 && sin(explodeOrbs.get(i).getAngle())<0) explodeOrbs.remove(i);
        else if (explodeOrbs.get(i).getX() > width && cos(explodeOrbs.get(i).getAngle())>0) explodeOrbs.remove(i);
        else if (explodeOrbs.get(i).getX()+10 < 0 && cos(explodeOrbs.get(i).getAngle())<0) explodeOrbs.remove(i);
      }
    }
    //age rocks
    for (Rock r: rocks) r.age();

    //handle bolts
    if (time % boltPer == 0) {//add bolt
      bo.add(new Bolt("Objects\\LightningBolt", (int)(torlyn.getX() + 100), (int)(torlyn.getY()), 
      atan2(-torlyn.getY()+player.getY()+20, -(torlyn.getX() + 100)+player.getX()+10)));
    }
    if (time%2==0) {
      if (!bo.isEmpty())
        for (int i = bo.size()-1; i >= 0; i--) {
          bo.get(i).move(20);
          if (collided(player.getX(), player.getY(), 40, 40, bo.get(i).getX(), bo.get(i).getY(), 40, 20)) {
            bo.remove(bo.get(i));
            player.hit(5); 
            changeHealth(-5);
          }
          else if (bo.get(i).getX() <= 0 && cos(bo.get(i).getAngle())<0) { 
            bo.get(i).reflect(PI/2);
            //bo.get(i).setActive(true);
          }
          else if (bo.get(i).getY() <= 0 && sin(bo.get(i).getAngle())<0) { 
            bo.get(i).reflect(0);
            //bo.get(i).setActive(true);
          }
          else if (bo.get(i).getX() >= width) {
            changeScore((bo.get(i).isActive()? 100: 50), bo.get(i).getX()-40, bo.get(i).getY()); 
            bo.remove(bo.get(i));
          }
          else if (bo.get(i).getY() >= height - bo.get(i).getHeight() && sin(bo.get(i).getAngle())>0) { 
            bo.get(i).reflect(0);
            //bo.get(i).setActive(true);
          }
          else {
            Rock r = hitRock(bo.get(i).getX(), bo.get(i).getY(), 40, 20, rocks);
            if (r != null) {
              changeScore(100, bo.get(i).getX(), bo.get(i).getY());
              bo.get(i).reflect((PI/2)+atan2((bo.get(i).getY()+10)-(r.getY()+40), (bo.get(i).getX()+20)-(r.getX()+40)));
              bo.get(i).setActive(true);
              rocks.remove(r);
              if (sound) {
                khuh.rewind();
                khuh.play();
              }
            }
            else if (bo.get(i).isActive()) {//active bolt
              ArrayList<RPowerOrb> orbs = torlyn.getOrbs();
              boolean destroyedBolt = false;
              for (int or = orbs.size()-1; or>=0 && !destroyedBolt;or--)//ROrb collision
                if (i < bo.size() && collided((int)(orbs.get(or).getX() + torlyn.getX() + torlyn.getWidth()/2), //bolt hit orb
                (int)(orbs.get(or).getY() + torlyn.getY() + torlyn.getHeight()/2), 20, 20, 
                bo.get(i).getX(), bo.get(i).getY(), 40, 20)) {
                  if (sound) {
                    khuh.rewind();
                    khuh.play();
                  }
                  changeScore(500, bo.get(i).getX(), bo.get(i).getY());
                  followOrbs.add(new FPowerOrb("Objects\\PowerOrb", (int)(orbs.get(or).getX() + torlyn.getX() + torlyn.getWidth()/2), 
                  (int)(orbs.get(or).getY() + torlyn.getY() + torlyn.getHeight()/2), 60));
                  orbs.remove(or);
                  bo.remove(i);
                  destroyedBolt = true;
                  if (torlyn.isWeakened()) {
                    changeScore(5000, torlyn.getX(), torlyn.getY());
                    torlynRecharge = 0;
                    charging = true;
                  }
                }
              if (!destroyedBolt && collided((int)torlyn.getX()+40, (int)torlyn.getY(), 120, 100, bo.get(i).getX(), bo.get(i).getY(), 40, 20)) {//hit torlyn
                if (torlyn.isWeakened()) {
                  torlyn.hit(5);
                  torlynRecharge-=FULL_CHARGE/10;
                  if (torlynRecharge < 0) torlynRecharge = 0;
                  changeScore(2000, torlyn.getX(), torlyn.getY());
                } 
                else changeScore(200, bo.get(i).getX(), bo.get(i).getY());
                if (sound) {
                  vloop.rewind();
                  vloop.play();
                }
                healers.add(new Heart("Objects", bo.get(i).getX(), bo.get(i).getY(), 
                atan2((bo.get(i).getY()+bo.get(i).getHeight()/2)-(torlyn.getY()+torlyn.getHeight()/2), 
                (bo.get(i).getX()+bo.get(i).getWidth()/2)-(torlyn.getX()+torlyn.getWidth()/2)), 
                20, 200));
                bo.remove(i);
              }
            }
          }
        }
    }

    if (time%2==0) {
      //handle hearts
      for (int i = healers.size()-1; i >=0; i--) {
        healers.get(i).move(10);
        if (collided(player.getX(), player.getY(), player.getWidth(), player.getHeight(), 
        (int)healers.get(i).getX(), (int)healers.get(i).getY(), healers.get(i).getWidth(), healers.get(i).getHeight())) {
          changeHealth(5);
          int score = 250;
          if (yourHealth > 100) {
            score += (yourHealth - 100) * 500+250;
            yourHealth = 100;
          }
          changeScore(score, player.getX(), player.getY());
          healers.remove(i);
          if (sound) {
            vloop.rewind();
            vloop.play();
          }
        }
        //test if heart is off-screen
        else if (healers.get(i).getPathX() < -50 || healers.get(i).getPathX()>width+50 || 
          healers.get(i).getPathY() < -50 || healers.get(i).getPathY() > height+50) {
          healers.remove(i);
        }
      }
    }
    if (!canRestart) {
      //draw everything
      background(backg);
      //draw health bars
      fill(1.2*(255-2.55*yourHealth), 1.5*(2.55*yourHealth), 0);
      noStroke();
      rect(10, 10, 20, 2*yourHealth);
      fill(255-2.55*yourStr, 2.55*yourStr, 100);
      rect(40, 10, 10, yourStr);
      if (charging ) {//&& (1.0*torlynRecharge/FULL_CHARGE < .5 || sin((2*PI*FULL_CHARGE)/(FULL_CHARGE-torlynRecharge))>0)) {
        float trans = 255*(1+cos((2*PI*FULL_CHARGE)/(FULL_CHARGE-torlynRecharge)))/2;
        fill(255f*torlynRecharge/FULL_CHARGE, 0, 0, trans);
        rect(15*40+10, height-30, 350f*torlynRecharge/FULL_CHARGE, 20);
      }
      noFill();
      stroke(0);
      rect(10, 10, 20, 200);//health box
      rect(40, 10, 10, 100);//strength box
      if (charging) rect(15*40+10, height-30, 350, 20); //Torlyn's charge
      fill(0);
      textFont(monoFont, 30);
      textAlign(RIGHT);
      text(formatScore(yourScore), width, 30);
      textAlign(LEFT);
      for (int i = points.size() - 1; i >= 0; i--) {
        fill(points.get(i).getColor());
        textFont(monoFont, points.get(i).getTextSize());
        text(points.get(i).getText(), points.get(i).getX(), points.get(i).getY());
        points.get(i).age(1);
        if (!points.get(i).stillAlive()) points.remove(i);
      }
      //Sprites
      for (Rock r: rocks)
        image(r.getSprite(), r.getX(), r.getY());
      image(player.getSprite(), player.getX(), player.getY());
      image(torlyn.getSprite(), torlyn.getX(), torlyn.getY());
      for (RPowerOrb o: torlyn.getOrbs()) {
        image(o.getSprite(), o.getX() + torlyn.getX() + torlyn.getWidth()/2, o.getY() + torlyn.getY() + torlyn.getHeight()/2);
      }
      for (FPowerOrb o: followOrbs)
        image(o.getSprite(), o.getX(), o.getY());
      for (EPowerOrb o: explodeOrbs)
        image(o.getSprite(), o.getX(), o.getY());
      for (Bolt b: bo) image(b.getSprite(), b.getX(), b.getY());
      for (Heart h: healers) image(h.getSprite(), h.getX(), h.getY());
    }
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') up = true;
  if (key == 's' || key == 'S') down = true;
  if (key == 'a' || key == 'A') left = true;
  if (key == 'd' || key == 'D') right = true;
  if (!(paused || canRestart)&&yourStr; == 100 && key == ' ') {
    shoveling = true;
  }
  if (key == 'b' || key == 'B') {
    sound = !sound;
    String txt = "Sound " + (sound? "on":"off");
    if (!firstCall) points.add(new FloatingText(txt, 30, 18, 128, width-120, height-10, 0));
  }
  if (key == 'p' || key == 'P') {
    if (!(paused || canRestart)) {
      paused = true;
      noLoop();
      background(0);
      fill(255);
      textAlign(CENTER);
      textFont(monoFont, 100);
      text("PAUSED", width/2, 100);
      textFont(monoFont, 20);
      text("Press 'p' to continue\nPress 'n' to start a new game", width/2, 200);
      canRestart = true;
    } 
    else if (paused) {
      loop();
      canRestart = false;
      paused = false;
    }
  }
  if (canRestart && (key == 'n' || key == 'N')) {
    firstCall=false;
    setup();
    loop();
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') up = false;
  if (key == 's' || key == 'S') down = false;
  if (key == 'a' || key == 'A') left = false;
  if (key == 'd' || key == 'D') right = false;
  if (!(paused || canRestart)&&shoveling; && yourStr == 100 && key == ' ') {
    shoveling = false;
    yourStr = 0;
    int xRock = player.getX() + (player.getDirection() == 2? 50: (player.getDirection() == 3? -90: -20));
    int yRock = player.getY() + (player.getDirection() == 0? 50: (player.getDirection() == 1? -90: -40));
    boolean collision = false;
    if (yRock+80>0 && yRock<height && xRock > 120 && xRock+80 < 15*40 && hitRock(xRock, yRock, 80, 80, rocks)==null) {
      rocks.add(new Rock("Barrier", xRock, yRock, 4));
    }
    else {
      if (sound) {
        cling.rewind();
        cling.play();
      }
    }
    shovelUp = 5;
  }
  if (!keyPressed && !firstCall) player.standStill();
}

void changeScore(int score, float x, float y) {
  yourScore += score;
  points.add(new FloatingText("" + score, 60, (int)(8*log(score)/log(10)), color(255-(255.0/3)*log(score)/log(10), (255.0/3)*log(score)/log(10), 0), x, y, 1));
}

void changeHealth(int change) {
  yourHealth += change;
  if (yourHealth <= 0) {
    noLoop();
    background(0);
    textFont(monoFont, 100);
    fill(255);
    textAlign(CENTER);
    text("GAME OVER", width/2, 100);
    textFont(monoFont, 24);
    text("Your Score: " + formatScore(yourScore) + "\nPress 'n' to restart", width/2, 200);
    if (sound) {
      cling.rewind();
      khuh.rewind();
      foop.rewind();
      cling.play();
      khuh.play();
      foop.play();
    }
    canRestart = true;
  }
}

PImage createBackground(int tileW, int tileH) {
  PImage back = new PImage(width, height);
  for (int c = 0; c < width; c += tileW)
    for (int r = 0; r < height; r += tileH) {
      if (c/tileW >= 3 && c/tileW<15) back.set(c, r, loadImage("Tiles\\Grass.png"));
      else back.set(c, r, loadImage("Tiles\\Water.png"));
    }
  return back;
}

boolean collided(int x1, int y1, int w1, int h1, int x2, int y2, int w2, int h2) {
  if (x1 >= x2 && x1 <= x2+w2 && ((y1 >= y2 && y1 <= y2 + h2) || (y2 >= y1 && y2 <= y1 + h1))) return true;
  if (x2 >= x1 && x2 <= x1+w1 && ((y1 >= y2 && y1 <= y2 + h2) || (y2 >= y1 && y2 <= y1 + h1))) return true;
  return false;
}

Rock hitRock(int x, int y, int w, int h, ArrayList<Rock> rocks) {
  for (Rock r: rocks)
    if (collided(x, y, w, h, (int)r.getX(), (int)r.getY(), r.getHeight(), r.getWidth())) return r;
  return null;
}

String formatScore(int score) {
  if (score == 0) return "" + 0;
  String s = "";
  int scoreL = (int) (log(score)/log(1000));
  while (score > 0) {
    int num = score % 1000;
    String fNum = "";
    for(int i = 0; i <=2;i++){
      fNum = "" + num + fNum;
      num /= 10;
    }
    s = " " + fNum + s;
    score /= 1000;
    scoreL--;
  }
  while(scoreL > 0){
    s=" 000" + s;
  }
  return s.substring(1);
}

class Bolt {
  PImage[] images = new PImage[2];
  int x, y;
  float angle;
  boolean flashing = true, active = false;

  Bolt(String fileLoc, int xPos, int yPos, float ang) {
    images[0] = loadImage(fileLoc + "\\Bolt1.png");
    images[1] = loadImage(fileLoc + "\\Bolt2.png");
    angle = ang;
    x = xPos;
    y = yPos;
  }

  PImage getSprite() {
    return images[(flashing? 1: 0)];
  }
  
  float getAngle(){
    return angle;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getHeight() {
    return 20;
  }

  int getWidth() {
    return 40;
  }

  void move(int dis) {
    x += dis * cos(angle);
    y += dis * sin(angle);
    flashing = !flashing;
  }

  void reflect(float wallAng) {
    angle = 2 * wallAng - angle;
    angle %= 2 * PI;
  }

  boolean isActive() {
    return active;
  }

  void setActive(boolean activate) {
    if (activate!=active) {
      active = activate;
      if (active) {
        tintGreen(images[0]);
        tintGreen(images[1]);
      } 
      else {
        tintBlue(images[0]);
        tintBlue(images[1]);
      }
    }
  }

  void tintGreen(PImage img) {
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      int a = img.pixels[i] & 0xFF000000;
      int col = img.pixels[i] & 0x0000FFFF;
      col = col<<8;
      img.pixels[i] = col | a;
    }
    img.updatePixels();
  }

  void tintBlue(PImage img) {
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      int a = img.pixels[i] & 0xFF000000;
      int col = img.pixels[i] & 0x00FFFFFF;
      col = col>>>8;
      pixels[i] = col | a;
    }
    img.updatePixels();
  }
}

class EPowerOrb {
  float x, y, ang;
  PImage[] images = new PImage[2];
  boolean flashing = false;

  EPowerOrb(String fileLoc, float xPos, float yPos, float angle) {
    x = xPos;
    y = yPos;
    ang = angle;
    images[0] = loadImage(fileLoc + "\\PowerOrb1.png");
    images[1] = loadImage(fileLoc + "\\PowerOrb2.png");
    images[0].resize(10, 10);
    images[1].resize(10, 10);
    tintMagenta(images[0]);
    tintMagenta(images[1]);
  }

  PImage getSprite() {
    return images[(flashing? 1: 0)];
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getAngle() {
    return ang;
  }

  void move(float dis) {
    x += dis * cos(ang);
    y += dis * sin(ang);
  }

  PImage tintMagenta(PImage img) {
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] &= 0xFFFF00FF;
    }
    img.updatePixels();
    return img;
  }
}

public class FPowerOrb {
  int life;
  float x, y, vx=0, vy=0;
  boolean img1;
  PImage[] images = new PImage[2];

  FPowerOrb(String fileLoc, int xPos, int yPos, int lifeSpan) {
    x = xPos;
    y = yPos;
    images[0] = tintMagenta(loadImage(fileLoc + "\\PowerOrb1.png"));
    images[1] = tintMagenta(loadImage(fileLoc + "\\PowerOrb2.png"));
    life = lifeSpan;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  PImage getSprite() {
    return (img1? images[0]: images[1]);
  }

  void flash() {
    img1 = !img1;
  }

  void move(float mag, int xGrav, int yGrav) {
    float acc = mag*mag/((xGrav-x)*(xGrav-x)+(yGrav-y)*(yGrav-y));
    vx += acc * cos(atan2((yGrav-y), (xGrav-x)));
    vy += acc * sin(atan2((yGrav-y), (xGrav-x)));
    if (vx > 20) vx = 20;
    else if (vx < -20) vx = -20;
    if (vy > 20) vy = 20;
    else if (vy < -20) vy = -20;
    x+=vx;
    y+=vy;
    life--;
    flash();
  }

  boolean isAlive() {
    return life>0;
  }

  PImage tintMagenta(PImage img) {
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] &= 0xFFFF00FF;
    }
    img.updatePixels();
    return img;
  }
}

class FloatingText {
  String txt;
  int age = 0, life, size;
  float x, y, velocity;
  color baseColor;

  FloatingText(String txt, int life, int textSize, color c, float x, float y, float vel) {
    this.x = x;
    this.y = y;
    this.txt = txt;
    this.life = life;
    baseColor = c;
    size = textSize;
    velocity = vel;
  }

  void age(float time) {
    age += time;
    y -= velocity*time;
  }

  color getColor() {
    return color(baseColor>>>16, (baseColor>>>8)&255;, (baseColor&255;), (life-age)*255/life);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  String getText() {
    return txt;
  }

  int getTextSize() {
    return size;
  }

  boolean stillAlive() {
    return life > age;
  }
}

class Heart {
  float x, y, disTravel = 0, mag, vel, per, ang;
  PImage image;

  Heart(String fileLoc, float initX, float initY, float angle, float magnitude, float period) {
    image = loadImage(fileLoc + "\\Heart.png");
    mag = magnitude;
    per = period;
    ang = angle;
    x=initX;
    y=initY;
  }

  PImage getSprite() {
    return image;
  }

  void move(int dis) {
    disTravel += dis;
  }

  int getWidth() {
    return 20;
  }

  int getHeight() {
    return 20;
  }

  float getX() {
    return getPathX() + mag*cos(ang+PI/2)*sin(2*PI*disTravel/per);
  }

  float getY() {
    return getPathY() + mag*sin(ang+PI/2)*sin(2*PI*disTravel/per);
  }

  float getPathX() {
    return x + disTravel*cos(ang);
  }

  float getPathY() {
    return y + disTravel*sin(ang);
  }
}

public class RPowerOrb {
  float distance, angle;
  boolean img1;
  PImage[] images = new PImage[2];

  RPowerOrb(String fileLoc, float dis, float ang) {
    distance = dis;
    angle = ang;
    images[0] = loadImage(fileLoc + "\\PowerOrb1.png");
    images[1] = loadImage(fileLoc + "\\PowerOrb2.png");
  }

  float getX() {
    return distance * cos(angle)-10;
  }

  float getY() {
    return distance * sin(angle)-10;
  }

  float getAngle() {
    return angle;
  }

  PImage getSprite() {
    return (img1? images[0]: images[1]);
  }

  void flash() {
    img1 = !img1;
  }

  void move(float dis) {
    distance += dis;
  }

  void setDistance(float dis) {
    distance = dis;
  }

  void rotateOrb(float ang, boolean clock) {
    angle += (clock? -ang: ang);
  }
}

class Rock {
  PImage images;
  float x, y;
  int li, w, h,age;
  final int MAX_W = 80, MAX_H = 80;

  Rock(String fileLoc, float xPos, float yPos, int life) {
    images = loadImage(fileLoc + "\\LargeRock.png");
    w = MAX_W;
    h = 80;
    x = xPos;
    y = yPos;
    li = life;
    age = 0;
  }

  float getX() {
    return x + (MAX_W-w);
  }

  float getY() {
    return y + (MAX_H-h);
  }
  
  int getWidth(){
    return w;
  }
  
  int getHeight(){
    return h;
  }

  PImage getSprite() {
    return images.get(0,0,w,h);
  }
  
  void age(){
    if(age < li){
      age++;
      h = MAX_H*age/li;
    }
  }
}

class SCharacter {
  PImage crntSprite;
  HashMap<String, PImage> images;
  int x, y, flash = 0, direction;//0 is front, 1 is back, 2 is right, 3 is left
  //folderName is the name of the folder path
  //(i.e. "Characters\\Character", not just "Character")
  SCharacter(String folderName, int x, int y) {
    this.x=x;
    this.y=y;
    images = new HashMap<String, PImage>(13);
    direction = 0;
    images.put("back", loadImage(folderName + "\\Back.png"));
    images.put("backStep1", loadImage(folderName + "\\BackStep1.png"));
    images.put("backStep2", loadImage(folderName + "\\BackStep2.png"));
    images.put("front", loadImage(folderName + "\\Front.png"));
    images.put("frontStep1", loadImage(folderName + "\\FrontStep1.png"));
    images.put("frontStep2", loadImage(folderName + "\\FrontStep2.png"));
    images.put("left", loadImage(folderName + "\\Left.png"));
    images.put("leftStep1", loadImage(folderName + "\\LeftStep1.png"));
    images.put("leftStep2", loadImage(folderName + "\\LeftStep2.png"));
    images.put("right", loadImage(folderName + "\\Right.png"));
    images.put("rightStep1", loadImage(folderName + "\\RightStep1.png"));
    images.put("rightStep2", loadImage(folderName + "\\RightStep2.png"));

    images.put("backShovel1", loadImage(folderName + "\\BackShovel1.png"));
    images.put("backShovel2", loadImage(folderName + "\\BackShovel2.png"));
    images.put("frontShovel1", loadImage(folderName + "\\FrontShovel1.png"));
    images.put("frontShovel2", loadImage(folderName + "\\FrontShovel2.png"));
    images.put("leftShovel1", loadImage(folderName + "\\LeftShovel1.png"));
    images.put("leftShovel2", loadImage(folderName + "\\LeftShovel2.png"));
    images.put("rightShovel1", loadImage(folderName + "\\RightShovel1.png"));
    images.put("rightShovel2", loadImage(folderName + "\\RightShovel2.png"));
    crntSprite = images.get("front");
  }

  //0 is frwd, 1 is bkwd, 2 is right, 3 is left
  void moveCharacter(int dir, int dis) {
    turn(dir);
    switch (dir) {
    case 0://forward
      y+=dis;
      break;

    case 1: //backward
      y-=dis;
      break;

    case 2: //right
      x+=dis;
      break;

    case 3: //left
      x-=dis;
      break;
    }
  }

  void turn(int dir) {
    direction = dir;
    switch (dir) {
    case 0://forward
      if (crntSprite==images.get("frontStep1")) crntSprite=images.get("frontStep2");
      else crntSprite=images.get("frontStep1");
      break;

    case 1: //backward
      if (crntSprite==images.get("backStep1")) crntSprite=images.get("backStep2");
      else crntSprite=images.get("backStep1");
      break;

    case 2: //right
      if (crntSprite==images.get("rightStep1")) crntSprite=images.get("rightStep2");
      else crntSprite=images.get("rightStep1");
      break;

    case 3: //left
      if (crntSprite==images.get("leftStep1")) crntSprite=images.get("leftStep2");
      else crntSprite=images.get("leftStep1");
      break;
    }
  }

  void standStill() {
    if (direction == 1) crntSprite = images.get("back");
    else if (direction == 0) crntSprite = images.get("front");
    else if (direction == 2) crntSprite = images.get("right");
    else if (direction == 3) crntSprite = images.get("left");
  }

  void hit(int flashes) {
    flash = flashes * 2;
  }

  PImage getSprite() {
    if (flash % 2 == 1) {
      flash--;
      return new PImage();
    }
    if (flash != 0) flash --;
    return crntSprite;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getWidth() {
    return 40;
  }

  int getHeight() {
    return 40;
  }

  void shovel(boolean down) {
    if (direction == 1) crntSprite = images.get("backShovel" + (down? 1: 2));
    else if (direction == 0) crntSprite = images.get("frontShovel" + (down? 1: 2));
    else if (direction == 2) crntSprite = images.get("rightShovel" +(down? 1: 2));
    else if (direction == 3) crntSprite = images.get("leftShovel" + (down? 1: 2));
  }

  int getDirection() {
    return direction;
  }
}

class SDragon {
  PImage[] images;
  boolean flapping;
  int cX, cY, magnitude, Dwidth, Dheight, nOrbs, flash;
  float angle=PI/4;
  boolean addAng = false;
  ArrayList<RPowerOrb> orbs = new ArrayList<RPowerOrb>();

  SDragon(String fLoc, int cntrX, int cntrY, int distance, int numOrbs) {
    Dwidth = 200; 
    Dheight = 100;
    cX=cntrX;
    cY=cntrY;
    images = new PImage[2];
    images[0] = loadImage(fLoc + "\\Torlyn.png"); 
    images[1] = loadImage(fLoc + "\\TorlynFlaping.png");
    flapping = false;
    magnitude = distance;

    nOrbs = numOrbs;
    for (int i = 0; i < numOrbs; i++) {
      orbs.add(new RPowerOrb("Objects\\PowerOrb", 100, i * (2 * PI)/numOrbs));
    }
  }

  int getWidth() {
    return Dwidth;
  }

  int getHeight() {
    return Dheight;
  }

  void rotateOrbs(float ang, boolean clock) {
    for (RPowerOrb o:orbs) {
      o.rotateOrb(ang, clock);
      o.flash();
    }
  }

  void waveOrbs(float orbit, float mag, float waveSize) {
    for (RPowerOrb o:orbs) {
      o.setDistance(orbit + mag*cos((1.0*o.getAngle()*nOrbs/waveSize)));
    }
  }

  ArrayList<RPowerOrb> getOrbs() {
    return orbs;
  }

  void refreshOrbs() {
    orbs = new ArrayList<RPowerOrb>();
    for (int i = 0; i < nOrbs; i++) {
      orbs.add(new RPowerOrb("Objects\\PowerOrb", 100, i * (2 * PI)/nOrbs));
    }
  }

  void increaseOrbs(int n) {
    nOrbs += n;
  }

  PImage getSprite() {
    if (flash > 0) flash--;
    if (flash % 2 == 0) return images[(flapping? 1: 0)];
    return new PImage();
  }

  void changeSprite() {
    flapping = !flapping;
  }

  float getX() {
    return cX + magnitude * cos(angle) * sqrt(-cos(2*angle))*(addAng? 1:-1);
  }

  float getY() {
    return cY + magnitude * sin(angle) * sqrt(-cos(2*angle));
  }

  boolean isWeakened() {
    return orbs.isEmpty();
  }

  void hit(int flashes) {
    flash = flashes*2;
  }

  void move(float dAng) {
    angle += dAng;
    angle %= 2*PI;
    if (cos(2*angle)>0) {
      angle += PI/2;
      addAng = !addAng;
    }
  }
}


