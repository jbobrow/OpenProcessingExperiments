
/** ANDROMEDA V2.0
 * AP Computer Science, Balboa High, Mr. Ferraro
 * (c)2012
 * @author Lawrence Li
 */

//import
import ddf.minim.*;
import gifAnimation.*;
 
//coordinates, booleans, public variables
final int midX = 400;
final int midY = 250;
final int basecenter = 150;
final int playerX = basecenter;
final int playerY = midY;
boolean gameOver = false;
boolean gameOn = false;
boolean gameWon = false;
boolean madeNewItems = false;
boolean paused;
//booleans for intro screen
boolean showingLeft = false;
boolean showingMiddle = true;
boolean showingRight = false;
//checks if barrier destroyed sound has been played
boolean dbPlayed = false;

//Font field variable
PFont font;

//weapons
final int machinegunDmg = 5;
final int railgunDmg = 50;
final int lasergunDmg = 20;

//Player's Health;
int percyHealth = 100;

//Zombies killed
int zomKilled = 0;

//Store class
Store store;

//Toolshed class
Toolshed shed;

//Gun class
Gun MF19;

//Zombie class
int maxZombOnScreen;
Zombie[] zombArr;
int zomIndex;
final int numZombies = 300;
ArrayList<Zombie> onScreen = new ArrayList<Zombie>();

//audio
Minim mini;
AudioSample machinegun;
AudioSample railgun;
AudioSample lasergun;
AudioSample zombieIntro;
AudioSample victoryThunder;
AudioSample loseScream;
AudioSample select;
AudioSample pain;
AudioSample zombiePain;
AudioSample zombieDie;
AudioSample coins;

AudioSample damageBarrier;
AudioSample destroyedBarrier;

//images
Gif zombie1;
Gif zombie2;
Gif zombie3;
Gif zombie4;
Gif bush1;
Gif bush2;
Gif bush3;
Gif bush4;
Gif bush5;
Gif brokenBarrier;
Gif fullBarrier;
Gif Percy;
Gif oneKey;
Gif twoKey;
Gif threeKey;
Gif leftArrow;
Gif rightArrow;
Gif enterKey;
Gif spacebar;
Gif mouse;
PImage mgImg;
PImage rgImg;
PImage lgImg;  
PImage footing;
  
  
void setup() {
  paused = true;
  //loading window...
  println("Loading Andromeda v2.0");
  println("Loading window...");
  size(800,500);
  smooth();
  frameRate(60);
  background(80);
  
  //loading zombies...
  println("Loading zombies...");
  //metal slug GIFS from http://www.fattyboy.com/Metal%20Slug.htm
  //images edited using Online Image Editor http://www.online-image-editor.com/
  zombie1 = new Gif(this, "zombie1.gif");
  zombie2 = new Gif(this, "zombie2.gif");
  zombie3 = new Gif(this, "zombie3.gif");
  zombie4 = new Gif(this, "zombie4.gif");
  //images of bushes, Percy, keys, mouse, and barrier I made using http://piq.codeus.net/draw
  bush1 = new Gif(this, "bush_1.gif");
  bush2 = new Gif(this, "bush_2.gif");
  bush3 = new Gif(this, "bush_3.gif");
  bush4 = new Gif(this, "bush_4.gif");
  bush5 = new Gif(this, "bush_5.gif");
  brokenBarrier = new Gif(this, "broken_barrier.gif");
  fullBarrier = new Gif(this, "full_barrier.gif");
  Percy = new Gif(this, "Percy.gif");
  oneKey = new Gif(this, "1_key.gif");
  twoKey = new Gif(this, "2_key.gif");
  threeKey = new Gif(this, "3_key.gif");
  leftArrow = new Gif(this, "left_arrow.gif");
  rightArrow = new Gif(this, "right_arrow.gif");
  enterKey = new Gif(this, "enter_key.gif");
  spacebar = new Gif(this, "space_bar.gif");
  mouse = new Gif(this, "mouse.gif");
  
  
  //loading images
  println("Loading images...");
  //images of weapons I made using http://piq.codeus.net/draw
  mgImg = loadImage("mg_img.bmp");
  rgImg = loadImage("rg_img.bmp");
  lgImg = loadImage("lg_img.bmp");
  footing = loadImage("background.png");
  
  zombie1.play();
  zombie2.play();
  zombie3.play();
  zombie4.play();
  
  //loading sound...
  println("Loading sounds...");
  mini = new Minim(this);
  //MachineGun.mp3 from http://soundbible.com/1998-Gun-Fire.html
  machinegun = mini.loadSample("MachineGun.mp3", 2048);
  //Blaster-Droideka.wav and Blaster-Imperial.wav from http://www.sa-matra.net/sounds/starwars
  railgun = mini.loadSample("Blaster-Droideka.wav", 2048);
  lasergun = mini.loadSample("Blaster-Imperial.wav", 2048);
  //zombie_intro.wav from http://www.shockwave-sound.com/sound-effects/monster-sounds/zombie%20groan%202.wav
  zombieIntro = mini.loadSample("zombie_intro.wav", 2048);
  //victory_thunder.wav from http://www.fionasplace.net/creepysounds/THUNDER6.WAV
  victoryThunder = mini.loadSample("victory_thunder.WAV", 2048);
  //lose_scream.mp3 from http://www.omarshauntedtrail.com/MP3s/Sound%20Files%20collected/S/Scream%20Male%202.mp3
  loseScream = mini.loadSample("lose_scream.mp3", 2048);
  //select.wav from http://gs.bel-net.ru/cs/download/sound/weapons/ak47_boltpull.wav
  select = mini.loadSample("select.wav", 2048);
  //damage_barrier.wav from http://sep800.mine.nu/files/sounds/woodsplinter.wav
  damageBarrier = mini.loadSample("damage_barrier.wav", 2048);
  //damage_barrier.wav from http://sep800.mine.nu/files/sounds/woodsplinter.wav
  destroyedBarrier = mini.loadSample("destroyed_barrier.wav", 2048);
  //pain.wav from http://www-stud.rbi.informatik.uni-frankfurt.de/~longo/kat/sounds/au/sonst/Ungh00.au
  pain = mini.loadSample("pain.wav", 2048);
  //zombie_pain.wav and zombie_die.wav from http://download.toolz.ro/sound/zombie_plague/
  zombiePain = mini.loadSample("zombie_pain.wav", 2048);
  zombieDie = mini.loadSample("zombie_die.wav", 2048);
  //coins.mp3 from http://www.freesound.org/people/dobroide/sounds/60768/
  coins = mini.loadSample("coins.wav", 2048);
  
  //Modes
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
}








void draw() {
  if (gameOn) {
    paused = false;
    if (! gameOver) {
          
      if (!madeNewItems) {
         resetGame();
      }
      
      //If the shed is destroyed and Percy is dead, game over
      if (percyHealth <= 0 && shed.getHealth() <= 0) {
        println("Game lost :(");
        gameOver = true;
        gameWon = false;
        delay(500);
        loseScream.trigger();
        cursor(ARROW);
      }
      
      //If there are no more zombies, prompt restart and print victory
      if (onScreen.size() == 0 && zomIndex == numZombies) {
        println("Game won! :)");
        gameWon = true;
        gameOver = true;
        delay(500);
        victoryThunder.trigger();
        cursor(ARROW);
      }
      
      renderField();
      


      
      if (shed.getHealth() <= 0 && !dbPlayed) {
        destroyedBarrier.trigger();
        dbPlayed = true;
      }
         

      
      //this line of code caused whole program to be slow on slower computers
      //just a note to all other processing programmers
      //font = loadFont("CourierNewPS-BoldMT-48.vlw");
      
      shed.displayHealth();
      displayPauseCommand();
      displayPlayerHealth();
      displayZombiesKilled();
      displayMoney();
      shed.render();
      renderPlayer();
      drawLaser();
      store.displayGunSelection();
  
        
                
      while (onScreen.size() < maxZombOnScreen && zomIndex <= numZombies - 1) {
        if (zomIndex < zombArr.length) {
          Zombie zorro = zombArr[zomIndex];
          onScreen.add(zorro);
          zomIndex++;
          //println("ADDED ZOMBIE TO ONSCREEN Zombs on screen: " + onScreen.size());
        }
      }
      
      //Adjusts maxZombOnScreen based off the current index      
      if (zomIndex == 10) {
        maxZombOnScreen++;
      } else if (zomIndex == 50) {
        maxZombOnScreen++;
      } else if (zomIndex == 100) {
        maxZombOnScreen += 2;
      } else if (zomIndex == 150) {
        maxZombOnScreen += 2;
      } else if (zomIndex == 190) {
        maxZombOnScreen += 3;
      } else if (zomIndex == 250) {
        maxZombOnScreen += 3;
      } else if (zomIndex == 260) {
        maxZombOnScreen += 3;        
      } else if (zomIndex == 270) {
        maxZombOnScreen += 5;
      }      

      
      //removes dead zombies, living zombies act normally
      for(int n = 0; n < onScreen.size(); n++) {
        Zombie z = onScreen.get(n);
        //add money when a zombie is dead
        if (z.getHealth() <= 0) {
          onScreen.remove(n);
          zomKilled++;
          zombieDie.trigger();
          switch (z.getType()) {
            case 1:
              store.addMoney(10);
              break;
            case 2:
              store.addMoney(20);
              break;
            case 3:
              store.addMoney(30);
              break;
            case 4:
              store.addMoney(15);
              break;
          }
          n--;
        } else {
          z.render();
          z.act();
          //z.getDistance();
          z.displayHealth();
        }
      }
      
      if (mousePressed && (mouseButton == LEFT))
        MF19.fire();
      
      //changing weapons
      if(keyPressed) {
        store.makeWeaponChoice(key);
      }
            
        
    } else if (gameOver) {
      madeNewItems = false;
      promptGame();
    }     
  } else if (!gameOn){   
    promptGame();    
  } 
  
}



void resetGame() {
    println("Setting up Game...");
    
    paused = false;
  
    //Gun class
    //dmg rate machinegunDmg = 5, railgunDmg = 50, lasergunDmg = 20
    MF19 = new Gun(machinegunDmg);
    
    //hides cursor when game is in play
    noCursor();
    
    //resets health
    percyHealth = 100;
    
    //creates new store, resets money
    store = new Store(0);
    
    //constructor modifies health
    shed = new Toolshed(150);
    dbPlayed = false;
    
    //removing all zombies that were previous on the screen
    for (int n = 0; n < onScreen.size(); n++) {                   
      onScreen.remove(n);
      n--;
      //println("REMOVED ZOMBIE FROM ONSCREEN " + n + " Zombs on screen: " + onScreen.size());
    }
    
    //resetting variables... 
    zomIndex = 0;
    maxZombOnScreen = 5;
    zomKilled = 0;
    //resetting array of zombies...
    createNewZombies();
    madeNewItems = true; 
}

//stops sounds
void stop() {
  machinegun.stop();
  railgun.stop();
  lasergun.stop();
  zombieIntro.stop();
  victoryThunder.stop();
  loseScream.stop();
  select.stop();
  pain.stop();
  zombiePain.stop();
  zombieDie.stop();
  mini.stop();
  super.stop();
}

//Displays start screen and checks for enter key/r key
void promptGame() {
  //if game is off, display start screen
    
    //determines which screen to display based off keys pressed, default is middle
    if (gameOn == false) {
      if (showingMiddle) {
        displayStartScreen();
      } else if (showingLeft) {
        displayLeftScreen();
      } else if (showingRight) {
        displayRightScreen();
      }
      
      //controls to change screen
      if (keyPressed) {
        if (key == ENTER && showingMiddle) {
          //Starting Game...
          println("Starting Game...");
          select.trigger();
          zombieIntro.trigger();
          delay(500);
          gameOn = true;
        } else if (keyCode == LEFT && showingMiddle) {
          showingMiddle = false;
          showingLeft = true;
          showingRight = false;
          select.trigger();
          delay(500);
        } else if (keyCode == RIGHT && showingMiddle) {
          showingMiddle = false;
          showingLeft = false;
          showingRight = true;
          select.trigger();
          delay(500);
        } else if (keyCode == RIGHT && showingLeft) {
          select.trigger();
          delay(500);
          showingMiddle = true;
          showingLeft = false;
          showingRight = false;
        } else if (keyCode == LEFT && showingRight) {
          select.trigger();
          delay(500);
          showingMiddle = true;
          showingLeft = false;
          showingRight = false;
        }
      }
    } else if (gameOn == true && gameOver == true && gameWon == false) {
      displayGameOver();
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          //Restarting Game...
          println("Restarting Game...");
          zombieIntro.trigger();
          select.trigger();
          delay(500);
          gameOver = false;
        }
      }
    } else if (gameOn == true && gameOver == true && gameWon == true) {
      displayGameWon();  
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          //Restarting Game...
          println("Restarting Game...");
          zombieIntro.trigger();
          select.trigger();
          delay(500);
          gameOver = false;
        }
      }        
    }
    
}

//Blackground turns black and displays prompt text
void displayStartScreen() {
  textAlign(CENTER);
  background(35);
  //Startup text
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  fill(255);
  textFont(font, 48);
  text("Andromeda", midX, midY - 60);
  font = loadFont("CourierNewPS-BoldMT-28.vlw");
  textFont(font, 28);
  fill (160);
  text("By Lawrence Li", midX, midY + 10);
  fill(250, 0, 0);
  textFont(font, 32);
  text("Press Enter to Start", midX, midY + 130);
  image(enterKey, midX, midY + 170);
  
  //displays key icons and text underneath
  fill(200,0,0);
  textFont(font, 24);
  text("Credits", 100, 350);
  image(leftArrow, 100, 380);
  
  text("How to Play", 700, 350);
  image(rightArrow, 700, 380);
  
  
}



void displayLeftScreen() {
  textAlign(CENTER);
  background(35);
  fill(200,0,0);
  textFont(font, 24);
  text("Back", 700, 350);
  image(rightArrow, 700, 380);
  
  fill(255, 0, 0);
  textFont(font, 32);
  text("Credits", 100, 50);
  //content x 30, y + 25
  textAlign(LEFT);
  fill(240);
  textFont(font, 20);
  text("Programmed by: Lawrence Li", 30, 100);
  text("For Balboa High School AP Computer Science - Mr. Ferraro", 30, 125);
  
  font = loadFont("CourierNewPS-BoldMT-16.vlw");
  textFont(font, 16);
  text("Metal Slug animated images from 'http://www.fattyboy.com/Metal%20Slug.htm'", 30, 175);
  text("All other images mouse-drawn using 'http://piq.codeus.net/draw'", 30, 200);
  text("and edited using 'http://www.online-image-editor.com/'", 50, 225);
  text("Sources for sound files included in comments in source code", 30, 275);
  text("Special Thanks to: Mr. Ferraro and APCS class of 2011-2012", 30, 325);
  
}

void displayRightScreen() {
  textAlign(CENTER);
  background(35);
  fill(200,0,0);
  textFont(font, 24);
  text("Back", 100, 350);
  image(leftArrow, 100, 380);
  
  //controls
  fill(255,0,0);
  textFont(font, 32);
  text("Controls", 100, 50);
  image(oneKey, 97, 100);
  image(twoKey, 150, 100);
  image(threeKey, 200, 100);
  image(mouse, 350, 150);
  image(spacebar, 545, 100);
  
  fill(216, 20, 20);
  stroke(216, 20, 20);
  strokeWeight(2);
  line(715, 100, mouseX, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
  
  //text
  fill(190, 0 ,0);
  textFont(font, 22);
  text("Buy/Select weapons", 150, 175);
  text("Fire", 343, 255);
  text("Pause/Resume Game", 543, 175);
  text("Reticle", 715, 155);
  
  //guns
  fill(255,0,0);
  textFont(font, 32);
  text("Guns", 700, 290);
  image(mgImg, 420, 350);
  image(rgImg, 550, 350);
  image(lgImg, 680, 350);
  
  fill(190, 0 ,0);
  textFont(font, 20);
  text("  Machine Gun  Rail Gun  Laser Gun ", 540, 400);
  text(" cost: Free  cost: 400 cost: 1500 ", 550, 425);
  
  
}

void displayGameWon() {
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  fill(255);
  textFont(font, 48);
  text("You Survived...For Now.", midX, midY - 50);
  font = loadFont("CourierNewPS-BoldMT-32.vlw");
  fill(220, 40, 0);
  textFont(font, 32);
  text("Press 'R' to Restart", midX, midY + 200);
}

//Displays prompt to restart game
void displayGameOver() {
  //Startup text
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  fill(255);
  textFont(font, 48);
  text("Game Over", midX, midY);
  font = loadFont("CourierNewPS-BoldMT-32.vlw");
  fill(220, 40, 0);
  textFont(font, 32);
  text("Press 'R' to Restart", midX, midY + 200);
}


//creating list of predetermined zombies and their characteristics
void createNewZombies() {
  int[] type = {1, 2, 3, 4};
  Zombie[] temp = new Zombie[numZombies]; 
  for (int i = 0; i < numZombies; i++) {
      int randyindex = (int)(Math.random() * type.length);
    temp[i] = new Zombie(850, int(random(50, height)), type[randyindex]);
  }
  
  zombArr = temp;
}

//displays the player's health
void displayPlayerHealth() {

    if (percyHealth <=0) {
      fill(250, 70, 0);
      textFont(font, 20);
      text("HP: 0", playerX, playerY - 75);
    } else {
      fill(250, 70, 0);
      textFont(font, 20);
      text("HP: " + percyHealth, playerX, playerY - 75);
    }
}

//displays the current amount of money
void displayMoney() {
      fill(255, 140, 0);
      textFont(font, 20);
      text("Money: " + store.getMoney(), 400, 25);
}

void displayZombiesKilled() {
      fill(255, 100, 0);
      textFont(font, 20);
      text("Zombies Killed: " + zomKilled, 150, 25);
}

void displayPauseCommand() {
      fill(150);
      textFont(font, 20);
      text("[space] to pause", 650, 25);
}

//renders image of player
void renderPlayer(){
  image(Percy, playerX + 10, playerY - 10);
}

//renders the field
void renderField() {
  tint(255);
  image(footing, midX, midY);
  image(bush1, playerX - 25, playerY - 200);
  image(bush3, playerX + 100, playerY - 125);
  image(bush2, playerX - 35, playerY + 200);
  image(bush3, playerX - 20, playerY + 100);
  image(bush4, playerX - 60 , playerY - 100);
  image(bush5, playerX + 110, playerY + 110);
  image(bush1, playerX + 160, playerY + 180);

}


//pause function, created with help from Stanley H.
void keyPressed() {
  if ( key == ' ' && !paused && gameOn && !gameOver && !gameWon) {
    fill(255);
    textFont(font, 48);
    text("PAUSED", midX, midY - 75);
    cursor(ARROW);
    textFont(font, 26);
    text("[space] to resume", midX, midY - 25);
    noLoop();
  } else if (key == ' ' && paused && gameOn && !gameOver && !gameWon) {
    noCursor();
    loop();
  }
  paused =! paused;
}

//draws the gun's laser
void drawLaser() {
  fill(216, 20, 20);
  stroke(216, 20, 20);
  strokeWeight(2);
  line(playerX + 40, playerY - 30, mouseX, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
}



//mid code easter egg:
//Long live Grazer!





//Creates a zombie
public class Zombie {
  //health of the zombie
  private int health;
  //The pixel location of a zombie
  private int x, y;
  //speed of the zombie
  private float speed;
  //type of zombie this is
  private int type;
  //distance between zombie and Percy, sqrt of (x - playerX)*(x - playerX) - (y - playerY)*(y - playerY);
  private float distance;
  //times hitting the shed
  private int timesHit = 9;
  //image to be displayed based on type
  Gif zombieGIF;
  



  public Zombie(int xLoc, int yLoc, int type) {
    x = xLoc; y = yLoc; 
    distance = sqrt((x - playerX)*(x - playerX) - (y - playerY)*(y - playerY));
    this.type = type;

    if (type == 1) {
      speed = 0.3;
      health = 100;
      zombieGIF = zombie1;
    } else if (type == 2) {
      speed = 0.2;
      health = 200;
      zombieGIF = zombie2;
    } else if (type == 3) {
      speed = 0.1;
      health = 200;      
      zombieGIF = zombie3;
    } else if (type == 4) {
      speed = 0.2;
      health = 150;      
      zombieGIF = zombie4;
    }
    
    
  }
  
  //displays the image of zombie on screen
  public void render() {
    tint(255);
    if (health > 0)
      image(zombieGIF, x, y);
  }
  
  public double getDistance() {
    return distance;
  }
    
  
  //zombie moves towards (playerX, playerY)
  public void act() {
    distance = sqrt((x - playerX)*(x - playerX) - (y - playerY)*(y - playerY));
    //TESTING: PATH
    //strokeWeight(1);
    //stroke(195, 100, 0);
    //line(playerX, playerY, x, y);
    

    
    if (shed.getHealth() > 0) {
      //move in x at  var speed
      
      if (distance <= 120) {
        zombieGIF.pause();
      } else {
        zombieGIF.play();
      }
      
      if (distance < 200) {
        if (this.x > basecenter + 100) {
          x -= int(speed * random(8, 13));
        }      
        
        if (this.y != playerY) {
          if (this.y < playerY) {
            y += int(speed * random(10, 15));
          } else if (this.y > playerY) {
            y -= int(speed * random(10, 15));
          }
        }
        

       
        
      } else if (distance >= 200) {
        
        x -= int(speed * random(8, 15));
        y += int(speed * random(-8, 8));
      }
      
    } else if (shed.getHealth() <= 0) {
      
      zombieGIF.play();
      
      if (distance < 300) {
        if (this.x > basecenter) {
          x -= int(speed * random(8, 13));
        }      
        
        if (this.y != playerY) {
          if (this.y < playerY) {
            y += int(speed * random(1, 15));
          } else if (this.y > playerY) {
            y -= int(speed * random(1, 15));
          }
        }
        

       
        
      } else if (distance >= 300) {
        
        x -= int(speed * random(8, 15));
        y += int(speed * random(-8, 8));
      }

    }
    
  
    if (distance <= 135) {
      timesHit++;
      if (timesHit%10 == 0 && shed.getHealth() > 0) {
        damageBarrier.trigger();
        shed.removeHealth(1);
      }
    } 
    
    if (distance < 10) {
      timesHit++;
      if (timesHit%3 == 0 && percyHealth > 0) {
        if (timesHit%20 == 0)
          pain.trigger();
        percyHealth--;
      }
     
    }
    //if the zombie is hit, do calculated damage and draw blood splatter
    if(mousePressed && (mouseButton == LEFT)) {
      

      if(isShot() &&  MF19.getShotsfired()%2 == 0 && MF19.getDamage() == machinegunDmg) {
        fill(230,0,0);
        stroke(230,0,0);
        ellipse(x + random(-10, 10), y + random(-25, 25), 15, 15);
        health -= MF19.getDamage();
      } else if (isShot() &&  MF19.getShotsfired()%13 == 0 && MF19.getDamage() == railgunDmg) {
        fill(230,0,0);
        stroke(230,0,0);
        ellipse(x + random(-10, 10), y + random(-25, 25), 15, 15);
        health -= MF19.getDamage();
      } else if (isShot() && MF19.getDamage() == lasergunDmg) {
        fill(230,0,0);
        stroke(230,0,0);
        ellipse(x + random(-10, 10), y + random(-25, 25), 15, 15);
        health -= MF19.getDamage();
      }    
    }
    
  }
  
  
  boolean isShot() {
    if ((mouseX < x + 35 && mouseX > x - 35) && (mouseY < y + 70 && mouseY > y - 70)) {
      fill(255);
      //rect(x, y, 35, 70);
      point(x, y);

      return true;
    }
      
    return false;
  }
  
  //Returns the zombie's health
  int getHealth() {
    return health;
  }
  
  //Displays the health of the zombie
  public void displayHealth() {
    if (health <= 0) {
      fill(255, 80, 0);
      text("0", x, y - 50);
    }
    fill(255, 80, 0);
    text(health, x, y - 50);
  }
  
  int getType() {
    return type;
  }
  
}














//toolshed Class, contains information about the toolshed
public class Toolshed {
  private int health = 200;
  
  //toolshed constructor, sets health based off int n
  public Toolshed (int n) {
    health = n;
  }
  
  //returns health
  int getHealth() {
    return health;
  }
  
  void removeHealth(int h) {
    health -= h;
  }
  
  //displays health
  void displayHealth() {
    if (health <=0) {
      fill(255, 20, 0);
      textFont(font, 20);
      text("Barrier: 0", playerX, playerY + 85);
    } else {
      fill(255, 20, 0);
      textFont(font, 20);
      text("Barrier: " + health, playerX, playerY + 85);
    }
  }
  
  //draws toolshed
  void render() {
     if (shed.getHealth() > 0) {
       image(fullBarrier, basecenter, midY);     
     } else {
       image(brokenBarrier, basecenter, midY); 
     }
  }
}











//Gun Class, Handles firing
public class Gun {
  private int damageRate = machinegunDmg;
  //determines fire rate using modulo and shotsfired
  private float shotsfired = 1;
  
  public Gun(int n) {
    damageRate = n;
  }
  
  int getDamage() {
    return damageRate;
  }
  
  void modDamage(int d) {
    damageRate = d;
  }
  
  //Plays firing sound at a rate based off shotsfired
  void fire() {
    //println("Firing rate is currently: " + damageRate);
    render();
    shotsfired++;
    //plays firing sound
    if (damageRate == machinegunDmg && shotsfired%2 == 0) {
      machinegun.trigger();
    } else if (damageRate == railgunDmg && shotsfired%13== 0) {
      railgun.trigger();
    } else if (damageRate == lasergunDmg) {
      lasergun.trigger();
    }  
  }
  
  float getShotsfired() {
    return shotsfired;
  }
  
  //draws the events of a gun firing
  void render() {
    strokeWeight(0);

    //creates the tracer line
    switch (damageRate) {
      case machinegunDmg://creates tracer line of minigun
              if (shotsfired%2 ==0) {
                strokeWeight(3);
                stroke(255, 255, 0);
                line(playerX + 50 + random(3), playerY - 30 + random(3), mouseX + random(15),mouseY + random(15));
                strokeWeight(0);
                //ellipse of projectile hitting ground
                stroke(255, 280, 0);
                fill(255, 280, 0);
                ellipse(mouseX + random(15), mouseY + random(15), 10,10);
                stroke(255);
              }
              break;
      case railgunDmg: //creates tracer line of railgun
            if (shotsfired%13 ==0) {
              strokeWeight(10);
              stroke(234, 150, 14);
              line(playerX + 50, playerY - 30, mouseX + random(15),mouseY + random(15));
              strokeWeight(0);
              //ellipse of projectile hitting ground
              stroke(206, 128, 2);
              fill(255, 150, 0);
              ellipse(mouseX, mouseY, 20,20);
              stroke(255);  
             }     
             break; 
      case lasergunDmg: //creates tracer line of lasergun
              strokeWeight(20);
              stroke(150, 0, 255);
              line(playerX + 50, playerY - 30, mouseX, mouseY);
              strokeWeight(0);
              //ellipse of projectile hitting ground
              stroke(170, 0, 255);
              fill(170, 0, 255);
              ellipse(mouseX, mouseY, 25, 25);
              stroke(255);
              break;
    }
    
    //creates muzzle flash for machinegun
    if (damageRate == machinegunDmg && shotsfired%2 == 0) {
    //ellipse of outer flash
      stroke(255,230, 0);
      fill(255, 230, 0);
      ellipse(mouseX/100 + 200 + random(3), mouseY/100 + 220 + random(3), 50,50);
      
      //ellipse of muzzle flash
      fill(255, 160, 0);
      ellipse(mouseX/100 + 200 + random(3), mouseY/100 + 220 + random(3), 25,25);
      
    //creates muzzle flash for railgun
    } else if (damageRate == railgunDmg && shotsfired%13 == 0) {
    //ellipse of outer flash
      stroke(255,230, 0);
      fill(255, 230, 0);
      ellipse(mouseX/100 + 200 + random(3), mouseY/100 + 220 + random(3), 50,50);
      
      //ellipse of muzzle flash
      fill(255, 160, 0);
      ellipse(mouseX/100 + 200 + random(3), mouseY/100 + 220 + random(3), 25,25);
      
    //creates muzzle flash for lasergun
    } else if (damageRate == lasergunDmg) {
      stroke(180, 0, 255);
      fill(180, 0, 255);
      ellipse(mouseX/100 + 200 + random(3), mouseY/100 + 220 + random(1), 30,30);
    }
  }   
}


class Store {
  boolean purchasedMGun = true;
  boolean purchasedRGun = false;
  boolean purchasedLGun = false;
  private int money = 0;

  public Store(int n) {
    money = n;
  }

  //changes weapon if purchasedWPN is true, else, purchase the weapon.
  void makeWeaponChoice(char c) {
      if(key == '1' && MF19.getDamage() != machinegunDmg) {  
        if(purchasedMGun) {
          MF19.modDamage(machinegunDmg);
          select.trigger();
        } else if (money >= 0){
          purchasedMGun = true;
          MF19.modDamage(machinegunDmg);
          coins.trigger();
          select.trigger();
        }
        
      } else if(key == '2' && MF19.getDamage() != railgunDmg) {     
        if(purchasedRGun) {
          MF19.modDamage(railgunDmg);
          select.trigger();
        } else if (money >= 400){
          money -= 400;
          purchasedRGun = true;
          MF19.modDamage(railgunDmg);
          coins.trigger();
          select.trigger();
        }          
        
      } else if(key == '3'&& MF19.getDamage() != lasergunDmg) {
        if(purchasedLGun) {
          MF19.modDamage(lasergunDmg);
          select.trigger();
        } else if (money >= 1500){
          money -= 1500;
          purchasedLGun = true;
          MF19.modDamage(lasergunDmg);
          coins.trigger();
          select.trigger();
        }   
      }
      
  }
  
  void addMoney(int n ) {
    money += n;
  }
  
  int getMoney() {
    return money;
  }
  
  //displays purchased guns, displays currently selected gun
  //pixel displaces py 75
  void displayGunSelection() {
    //displays selected image if the gun is machine gun
    if (MF19.getDamage() == machinegunDmg) {
      tint(255);
      fill(255, 20, 0);
      textFont(font, 20);
      text("[1]", 75, 60);
      image(mgImg, 75, 100);
      //else, display darkened image and number and '$' sign
    } else {
      tint(100);
      fill(120);
      textFont(font, 20);
      text("[1]", 75, 60);
      image(mgImg, 75, 100);
      if (!purchasedMGun) {
        textFont(font, 20);
        fill(200, 185, 0); 
        text ("0", 75,100);
      }
    }
    
    //displays selected image if the gun is rail gun
    if (MF19.getDamage() == railgunDmg) {
      tint(255);
      fill(255, 20, 0);
      textFont(font, 20);
      text("[2]", 150, 60);
      image(rgImg, 150, 100);
      //else, display darkened image and number and '$' sign
    } else {
      tint(100);
      fill(120);
      textFont(font, 20);
      text("[2]", 150, 60);
      image(rgImg, 150, 100);
      if (!purchasedRGun) {
        textFont(font, 20);
        fill(200, 185, 0); 
        text ("400", 150,100);
      }
    }
    
    //displays selected image if the gun is laser gun
    if (MF19.getDamage() == lasergunDmg) {
      tint(255);
      fill(255, 20, 0);
      textFont(font, 20);
      text("[3]", 225, 60);
      image(lgImg, 225, 100);
      //else, display darkened image and number and '$' sign
    } else {
      tint(100);
      fill(120);
      textFont(font, 20);
      text("[3]", 225, 60);
      image(lgImg, 225, 100);
      if (!purchasedLGun) {
        textFont(font, 20);
        fill(200, 185, 0);
        text ("1500", 225,100);
      }
    }
    
  }
  
}
  

