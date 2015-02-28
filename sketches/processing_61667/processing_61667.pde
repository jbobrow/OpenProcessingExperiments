
/** ANDROMEDA V1.0
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
final int playerX = basecenter - 20;
final int playerY = midY;
boolean gameOver = false;
boolean gameOn = false;
boolean gameWon = false;
boolean madeNewItems = false;
//checks if barrier destroyed sound has been played
boolean dbPlayed = false;
PFont font;
//weapons
final int machinegunDmg = 5;
final int railgunDmg = 50;
final int lasergunDmg = 20;

//Player's Health;
int percyHealth = 100;

//Percy's Cash
int money = 0;

//Zombies killed
int zomKilled = 0;

//Toolshed class
Toolshed shed;

//Gun class
Gun MF19;

//Zombie class
int maxZombOnScreen;
Zombie[] zombArr;
int zomIndex;
final int numZombies = 5;
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

AudioSample damageBarrier;
AudioSample destroyedBarrier;

//images
Gif zombie1;
Gif zombie2;
Gif zombie3;
Gif zombie4;
  
  
  
  
void setup() {
  //loading window...
  println("Loading Andromeda v1.0");
  println("Loading window...");
  size(800,500);
  smooth();
  frameRate(30);
  background(80);
  
  //loading zombies...
  println("Loading zombies...");
  //metal slug GIFS from http://www.fattyboy.com/Metal%20Slug.htm
  //images edited using Online Image Editor http://www.online-image-editor.com/
  zombie1 = new Gif(this, "zombie1.gif");
  zombie2 = new Gif(this, "zombie2.gif");
  zombie3 = new Gif(this, "zombie3.gif");
  zombie4 = new Gif(this, "zombie4.gif");
  
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
  
  //Modes
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
}








void draw() {
  if (gameOn) {
    if (! gameOver) {
          
      if (!madeNewItems) {
         resetGame();
      }
      
      //If the shed is destroyed and Percy is dead, game over
      if (percyHealth <= 0 && shed.getHealth() <= 0) {
        gameOver = true;
        gameWon = false;
        loseScream.trigger();
        cursor(ARROW);
      }
      
      //If there are no more zombies, prompt restart and print victory
      if (onScreen.size() == 0 && zomIndex == numZombies) {
        gameWon = true;
        gameOver = true;
        victoryThunder.trigger();
        cursor(ARROW);
      }
      
      renderField();
      
      fill(216, 20, 20);
      stroke(216, 20, 20);
      strokeWeight(2);
      line(playerX, playerY, mouseX, mouseY);
      ellipse(mouseX, mouseY, 10, 10);
      
      if (percyHealth > 0)
        renderPlayer();
      
      if (shed.getHealth() <= 0 && !dbPlayed) {
        destroyedBarrier.trigger();
        dbPlayed = true;
      }
         
      if (shed.getHealth() > 0) {
        shed.render();    
      }
      
      font = loadFont("CourierNewPS-BoldMT-48.vlw");
      shed.displayHealth();
      displayPlayerHealth();
      displayZombiesKilled();
      displayMoney();
  
        
                
      while (onScreen.size() < maxZombOnScreen && zomIndex <= numZombies - 1) {
        if (zomIndex < zombArr.length) {
          Zombie zorro = zombArr[zomIndex];
          onScreen.add(zorro);
          zomIndex++;
          

          println("ADDED ZOMBIE TO ONSCREEN Zombs on screen: " + onScreen.size());
        }
      }
      
      //Adjusts maxZombOnScreen based off the current index      
      if (zomIndex == 10) {
        maxZombOnScreen++;
      } else if (zomIndex == 50) {
        maxZombOnScreen++;
      } else if (zomIndex == 100) {
        maxZombOnScreen++;
      } else if (zomIndex == 150) {
        maxZombOnScreen++;
      } else if (zomIndex == 190) {
        maxZombOnScreen++;
      }      
      

      
      //removes dead zombies, living zombies act normally
      for(int n = 0; n < onScreen.size(); n++) {
        Zombie z = onScreen.get(n);
        //add money when a zombie is dead
        if (z.getHealth() <= 0) {
          onScreen.remove(n);
          zomKilled++;
          switch (z.getType()) {
            case 1:
              money += 10;
              break;
            case 2:
              money += 20;
              break;
            case 3:
              money += 30;
              break;
            case 4:
              money += 15;
              break;
          }
          n--;
        } else {
          z.render();
          z.act();
          z.getDistance();
          z.displayHealth();
        }
      }
      
      if (mousePressed && (mouseButton == LEFT))
        MF19.fire();
      
      //changing weapons
      if(keyPressed) {
        if(key == '1')
          MF19.modDamage(machinegunDmg);
        if(key == '2')
          MF19.modDamage(railgunDmg);
        if(key == '3')
          MF19.modDamage(lasergunDmg);
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
    //Gun class
    //dmg rate machinegunDmg = 5, railgunDmg = 50, lasergunDmg = 20
    MF19 = new Gun(machinegunDmg);
    
    //hides cursor when game is in play
    noCursor();
    
    //resets health
    percyHealth = 100;
    
    //resets money
    money = 0;
    
    //constructor modifies health
    shed = new Toolshed(100);
    dbPlayed = false;
    
    //removing all zombies that were previous on the screen
    for (int n = 0; n < onScreen.size(); n++) {                   
      onScreen.remove(n);
      n--;
      println("REMOVED ZOMBIE FROM ONSCREEN " + n + " Zombs on screen: " + onScreen.size());
    }
    
    //resetting variables... 
    zomIndex = 0;
    maxZombOnScreen = 5;
    zomKilled = 0;
    //resetting array of zombies...
    createNewZombies();
    zombieIntro.trigger();
    madeNewItems = true; 
}


//Displays start screen and checks for enter key/r key
void promptGame() {
  //if game is off, display start screen
  
    if (gameOn == false) {
      displayStartScreen();
      if (keyPressed) {
        if (key == ENTER) {
          //Starting Game...
          println("Starting Game...");
          select.trigger();
          gameOn = true;
        }
      }
    } else if (gameOn == true && gameOver == true && gameWon == false) {
      displayGameOver();
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          //Restarting Game...
          println("Restarting Game...");
          select.trigger();
          gameOver = false;
        }
      }
    } else if (gameOn == true && gameOver == true && gameWon == true) {
      displayGameWon();  
      if (keyPressed) {
        if (key == 'r' || key == 'R') {
          //Restarting Game...
          println("Restarting Game...");
          select.trigger();
          gameOver = false;
        }
      }        
    }
    
}

//Blackground turns black and displays prompt text
void displayStartScreen() {
  background(0);
  //Startup text
  font = loadFont("CourierNewPS-BoldMT-48.vlw");
  fill(255);
  textFont(font, 48);
  text("Andromeda", midX, midY - 50);
  font = loadFont("CourierNewPS-BoldMT-28.vlw");
  textFont(font, 28);
  fill (160);
  text("By Lawrence Li", midX, midY + 25);
  fill(230, 0, 0);
  textFont(font, 32);
  text("Press Enter", midX, midY + 200);
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
    temp[i] = new Zombie(850, int(random(height)), type[randyindex]);
  }
  
  zombArr = temp;
}

//displays the player's health
void displayPlayerHealth() {

    if (percyHealth <=0) {
      fill(14, 155, 22);
      textFont(font, 20);
      text("0", playerX - 50, playerY - 30);
    } else {
      fill(14, 155, 22);
      textFont(font, 20);
      text(percyHealth, playerX - 50, playerY - 30);
    }
}

//displays the current amount of money
void displayMoney() {
      fill(255, 140, 0);
      textFont(font, 20);
      text("Money: " + money, 350, 25);
}

void displayZombiesKilled() {
      fill(255, 100, 0);
      textFont(font, 20);
      text("Zombies Killed: " + zomKilled, 150, 25);
}

//renders image of player
void renderPlayer(){
  int dmg = MF19.getDamage();
  if (dmg == machinegunDmg) {
    fill(55, 255, 100);
    strokeWeight(0);
    ellipse(playerX, playerY, 15, 15);
  } else if (dmg == railgunDmg) {
    fill(55, 280, 100);
    strokeWeight(0);
    ellipse(playerX, playerY, 15, 15);
  } else if (dmg == lasergunDmg) {
    fill(55, 300, 100);
    strokeWeight(0);
    ellipse(playerX, playerY, 15, 15);
  }
}

//renders the field
void renderField() {
  background(80);
}











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
      health = 50;
      zombieGIF = zombie1;
    } else if (type == 2) {
      speed = 0.1;
      health = 150;
      zombieGIF = zombie2;
    } else if (type == 3) {
      speed = 0.1;
      health = 200;      
      zombieGIF = zombie3;
    } else if (type == 4) {
      speed = 0.2;
      health = 100;      
      zombieGIF = zombie4;
    }
    
    
  }
  
  //displays the image of zombie on screen
  public void render() {
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
    strokeWeight(1);
    stroke(195, 100, 0);
    line(playerX, playerY, x, y);
    
    if (shed.getHealth() > 0) {
      //move in x at  var speed
      if (distance < 250) {
        if (this.x > basecenter + 100) {
          x -= int(speed * random(8, 13));
        }      
        
        if (this.y != playerY) {
          if (this.y < playerY) {
            y += int(speed * random(8, 10));
          } else if (this.y > playerY) {
            y -= int(speed * random(8, 10));
          }
        }
      } else if (distance >= 250) {
        
        x -= int(speed * random(8, 15));
        y += int(speed * random(-8, 8));
      }
      
    } else if (shed.getHealth() <= 0) {
      
        if (this.x > playerX) {
          x -= (speed * 100)/10;
        }      
        
        if (this.y != playerY) {
          if (this.y < playerY) {
            y += int(speed * random(1, 10));
          } else if (this.y > playerY) {
            y -= int(speed * random(1, 10));
          }
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
  
  //toolshed construcot, sets health based off int n
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
      text("Barrier: 0", playerX + 25, playerY + 75);
    } else {
      fill(255, 20, 0);
      textFont(font, 20);
      text("Barrier: " + health, playerX + 25, playerY + 75);
    }
  }
  
  //draws toolshed
  void render() {
      strokeWeight(10);
      stroke(0);
      noFill();
      rect(basecenter, midY, 100, 100);   
  }
}











//Gun Class, Handles firing
public class Gun {
  private int damageRate = machinegunDmg;
  //determines fire rate using modulo and shotsfired
  float shotsfired = 1;
  
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
                line(basecenter, midY, mouseX + random(15),mouseY + random(15));
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
              line(basecenter + random(3), midY + random(5), mouseX + random(15),mouseY + random(15));
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
              line(basecenter, midY, mouseX, mouseY);
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
      ellipse(mouseX/100 +140 + random(3), mouseY/100 + 250 + random(3), 50,50);
      
      //ellipse of muzzle flash
      fill(255, 160, 0);
      ellipse(mouseX/100 +140 + random(3), mouseY/100 + 250 + random(3), 25,25);
      
    //creates muzzle flash for railgun
    } else if (damageRate == railgunDmg && shotsfired%13 == 0) {
    //ellipse of outer flash
      stroke(255,230, 0);
      fill(255, 230, 0);
      ellipse(mouseX/100 +140 + random(3), mouseY/100 + 250 + random(3), 50,50);
      
      //ellipse of muzzle flash
      fill(255, 160, 0);
      ellipse(mouseX/100 +140 + random(3), mouseY/100 + 250 + random(3), 25,25);
      
    //creates muzzle flash for lasergun
    } else if (damageRate == lasergunDmg) {
      stroke(180, 0, 255);
      fill(180, 0, 255);
      ellipse(mouseX/100 +140 + random(3), mouseY/100 + 250 + random(1), 25,25);
    }
  }   
}

  

