
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + "_" + nf(i, 1) + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
class ScrollingImage {
  int offsetA, offsetB, yOffset, speed;
  PImage image;
  
  ScrollingImage(PImage i, int y, int s) {
    image = i;
    offsetA = 0;
    offsetB = image.width;
    // Vertical offset on the canvas
    yOffset = y;
    // Speed of the scrolling
    speed = s;
  }
  void draw() {
    image(image, offsetA, yOffset);
    image(image, offsetB, yOffset);
    offsetA -= speed;
    offsetB -= speed;
    if(offsetA == -image.width) {
      offsetA = image.width;
    }
    if(offsetB == -image.width) {
      offsetB = image.width;
    }
  }
}
PImage player_standing, path, background, mountains, sign;
Animation player_running, monster;
ScrollingImage scrolling_path, scrolling_background, scrolling_mountains;
PFont mrsmonster;
int playerOffset, monsterOffset, textOffset, runningBuffer;
boolean gameOn;
String text, typed_text;

void setup() {
  size(800,600);
  background(#6D6E71);
  frameRate(24);
  
  // Game variables
  playerOffset = 360;
  monsterOffset = 100;
  textOffset = 100;
  runningBuffer = 0;
  text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful.";
  typed_text = "";
  gameOn = false;
  
  // Load font
  mrsmonster = loadFont("Mrs.Monster-90.vlw");
  // Initialize animations
  player_running = new Animation("Running", 19);
  monster = new Animation("Monster", 10);

  // Initialize images
  sign = loadImage("Sign.png");
  player_standing = loadImage("Standing.png");
  path = loadImage("Path.png");
  background = loadImage("Background.jpg");
  mountains = loadImage("Mountains.png");
  
  // Create scrolling images
  scrolling_background = new ScrollingImage(background, 0, 0);
  scrolling_mountains = new ScrollingImage(mountains, 267, 0);
  scrolling_path = new ScrollingImage(path, 451, 0);
}

// Draw 
void draw() {
  
  // Draw the game layers
  background(#724d27);
  scrolling_background.draw();
  scrolling_mountains.draw();
  scrolling_path.draw();
  
  
  
  if(gameOn == true) {
    // Draw the text
    fill(#FFFFFF);
    textSize(25);
    text(text, textOffset - (int(textWidth(typed_text)) - 300) + textWidth(typed_text), 560);
    fill(#555555);
    text(typed_text, textOffset - (int(textWidth(typed_text)) - 300), 560);
    
    // Is the player running?
    if(runningBuffer > 0) {
      // Player is RUNNING
      
      // Draw player, monster
      player_running.display(playerOffset,370);
      monster.display(monsterOffset, 350);
      // Scroll the backgrounds in different speeds - Parallax effect
      scrolling_background.speed = 4;
      scrolling_mountains.speed = 8;
      scrolling_path.speed = 16;
      // Make the monster go away from player
      if(monsterOffset > 50) {
        monsterOffset--;
      }
      runningBuffer--;
    } else {
      // Player is NOT RUNNING
      
      // Draw player, monster
      image(player_standing, playerOffset, 370);
      monster.display(monsterOffset, 350);
      // Stop the scrolling layers
      scrolling_background.speed = 0;
      scrolling_mountains.speed = 0;
      scrolling_path.speed = 0;
      // Move the monster closer
      monsterOffset+=3;
      if(monsterOffset > 280) {
        noLoop();
        fill(#FFFFFF);
        textFont(mrsmonster, 90);
        textAlign(CENTER, BOTTOM);
        text("Game over!", 400, 300);
        // DEATH!!
      }
    }
    // End sign
    if(text.length() == 0) {
      noLoop();
      fill(#FFFFFF);
      textFont(mrsmonster, 90);
      textAlign(CENTER, BOTTOM);
      text("Congratulations!", 400, 300);
      // You won!
     }
  } else {
    // IF THE GAME IS NOT ON
    noLoop();
    imageMode(CENTER);
    image(sign, 400,240);
    imageMode(CORNER);
  }
}

// Typing functionality
void keyPressed() {
  // If the user types in the right key
  if(gameOn == false) {
    gameOn = true;
    loop();
  }
  if(!(text.length() == 0)) {
    if(key == text.charAt(0))  {
      typed_text += key;
      text = text.substring(1);
      // Increase the running buffer
      runningBuffer += 5;
    }
  }
}





