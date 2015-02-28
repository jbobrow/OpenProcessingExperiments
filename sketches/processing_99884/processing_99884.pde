
/* Image Credits:
Arrow key image: 
http://shortcutqueen.com/wp-content/uploads/2009/08/dec-arrow-keys-300x206.png
Gardener:
http://pixelpeople.wikia.com/wiki/Farmer
Squirrel:
http://www.minecraftforum.net/uploads/profile/photo-1883159.png?_r=1357966847
Shovel:
http://piq.codeus.net/static/media/userpics/piq_15239_400x400.png
Fence:
http://www.whisperstutorials.com/ww-pixfence/Pixel_Fence_jean.gif
*/

Gardener player;
ArrayList<Flower> flowers = new ArrayList<Flower>();
ArrayList<Squirrel> squirrels = new ArrayList<Squirrel>();
ArrayList<Shovel> shovels = new ArrayList<Shovel>();
ArrayList<Shovel> usedShovels = new ArrayList<Shovel>();
int numShovels = 50;
int numSquirrels = 20;
int numSquirrelsDead = 0;
int flowerPower = 0;
//positions of flowers displayed
int flowerY = 50;
int flowerX = 350;
//player's health
int playerHealth = 200;
int hitDelay = 0;
boolean canHit = true;
//start screen booleans
boolean start = false;
boolean instruct = false;
boolean begin = true;
boolean canStart = true;
//end game booleans
boolean end = false;
boolean won = false;


void setup() {
  frameRate(60);
  
  //create the player
  player = new Gardener(5, width, height, loadImage("farmer.png"));
  
  //create green background
  size(1000, 500);
  background(34, 139, 34);

  //create flowers
  for (int i= 0; i < 12; i++) {
    if (i==0) {
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
    else if (i<4) {
      flowerY += 100;
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
    else if (i == 4) {
      flowerY = 100;
      flowerX += 100;
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
    else if (i< 8) {
      flowerY+= 100;
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
    else if (i==8) {
      flowerY = 50;
      flowerX += 100;
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
    else {
      flowerY += 100;
      flowers.add(new Flower(flowerX, flowerY, loadImage("retroflower.png")));
    }
  }

  //create squirrels
  for (int i = 0; i < numSquirrels; i++) {
    Squirrel temp = new Squirrel((int)(random(1100, 2500)), (int)(random(30, 450)), loadImage("squirrel.png"));
    squirrels.add(temp);
  }

}

void draw() {
  //start screen
  if(begin) {
    
    //start screen background image
    image(loadImage("begin.png"), 0, 0);
    
    //start button
    fill(0,102,0);
    rect(380, 300, 250 , 100, 10, 10, 10, 10);
    textSize(60);
    fill(102,255,102);
    text("START", 410, 370);
    
    //how to play button
    fill(0,102,0);
    rect(380, 50, 250 , 50, 10, 10, 10, 10);
    textSize(28);
    fill(102,255,102);
    text("HOW TO PLAY", 410, 85);
    
    //check for hovering over instruction button
    if (mouseX > 380 && mouseX < 630 && mouseY > 50 && mouseY < 100) {
      //tints button when hovered over
      fill(4,164,30);
      rect(380, 50, 250 , 50, 10, 10, 10, 10);
      textSize(28);
      fill(102,255,102);
      text("HOW TO PLAY", 410, 85);     
      
      //check for clicking of instruction button
      if(mousePressed) {
        instruct = true;
        begin = false;
      }
      
    //check for hovering over start button
    }else if (mouseX > 400 && mouseX < 650 && mouseY > 300 && mouseY < 400) {
      //tints button when hovered
      fill(4,164,30);
      rect(380, 300, 250 , 100, 10, 10, 10, 10);
      textSize(60);
      fill(102,255,102);
      text("START", 410, 370);
      
      //check for clicking of start button
      if(mousePressed) {
        start = true;
        begin = false;
      }
    }
  }
  
  //display instructions page
  if(instruct && !begin) {
    image(loadImage("instruct.png"),0,0);
  
    fill(4,164,30);
    rect(75, 400, 250, 75, 10, 10, 10, 10);
    textSize(30);
    fill(255);
    text("CLICK to Start", 95, 450);
    
    //check for click of button to start game
    if (mouseX > 75 && mouseX < 325 && mouseY > 400 && mouseY < 475) {
      if(mousePressed) {
         canStart = false;
        instruct = false;
        start = true;
      }
    }
  }
  
  //begin actual game
  if(start && !begin) {
    //draw gardener
    player.display();
    
    //draw all flowers
    for (Flower flower: flowers) {
      flower.display();
    }
    
    //draw fence
    image(loadImage("fence.png"), width/4 + 20, 0);
    
    //drawing all squirrels
    displaySquirrels();
    
    //check if throwing shovel
    player.updateThrow();
    
    //drawing all shovels
    displayShovels();
    
    //check for all collisions
    shovelSquirrelCollision();
    squirrelFlowerCollision();
    squirrelPlayerCollision();
    
    //draw all stats
    displayHealth();
    displayNumShovels();
    displayFlowerPower();
    
    //check end of game
    if(flowers.size() == 0 || playerHealth == 0) {
      begin = false;
      end = true;
    }
    
    //check if won
    if(numSquirrelsDead == numSquirrels) {
      begin = false;
      won = true;
    }
  }
  
  //display end picture
  if(end) {
    image(loadImage("end.png"), 0, 0);
  }
  
  //display winning picture
  if(won) {
    image(loadImage("win.png"),0,0);
    fill(255);
    textSize(36);
    text(flowerPower, 800, 280);
  }
  
}

//displays health of the player
void displayHealth() {
  textSize(20);
  fill(0);
  text("HEALTH", 110, 29);
  fill(181, 181, 181);
  rect(200, 10, 200, 20, 10, 10, 10, 10);
  if (playerHealth >0) {
    fill(210,69,69);
    stroke(0);
    strokeWeight(2);
    rect(200, 10, playerHealth, 20, 10, 10, 10, 10);
    fill(0);
    text(playerHealth, 350, 28);
  }
}

//displays number of shovels left
void displayNumShovels() {
  textSize(20);
  fill(0);
  image(loadImage("shovel2.png"),450, 0);
  text(numShovels, 530, 28);
}

//display how much flower power you've earned by killing squirrels
void displayFlowerPower() {
  textSize(20);
  fill(0);
  image(loadImage("retroflower2.png"), 600, 0);
  text(flowerPower, 650, 29);
}

//draws shovels if the gardener shoots them
void displayShovels() {
    for (Shovel shovel: shovels) {
      
      if (shovel.w < 900) {
        shovel.display();
      }
      else {
        //places shovel off screen
        shovel.xPos = -1000;
        shovel.yPos = -1000;
      }
    }
}

//displays all squirrels
void displaySquirrels() {
  for (int i = squirrels.size()-1; i >=0; i--) {
      if (squirrels.get(i).xPos > 0) {
        squirrels.get(i).display();
      }
      else if(squirrels.get(i).xPos != -1000 && squirrels.get(i).xPos != -2000) {
        //places squirrel off screen
        squirrels.get(i).xPos = -2000;
        squirrels.get(i).yPos = -2000;
        numSquirrelsDead +=1;
      }
    }
}

//check if a shovel has collided with a squirrel
void shovelSquirrelCollision() {
  for (int i = 0; i <shovels.size(); i++) {
    for (int j = 0; j < squirrels.size(); j++) {
      Shovel tempShovel = shovels.get(i);
      Squirrel tempSquirrel = squirrels.get(j);
      //if the squirrel is not placed off screen/ it is still moving
      if(tempSquirrel.xPos != -1000 && tempSquirrel.xPos != -2000) {
        //check if there is a collision
        if (tempShovel.collision(tempSquirrel.xPos, tempSquirrel.yPos)) {
          //place both the shovel and squirrel off screen
          shovels.get(i).xPos = -1000;
          shovels.get(i).yPos = -1000;
          squirrels.get(j).xPos = -1000;
          squirrels.get(j).yPos = -1000;
          //increase the amount of flower power
          flowerPower += 10;
          //increases the number of squirrels dead
          numSquirrelsDead++;
        }
      }
    }
  }
}

//checks if a squirrel has "eaten"/collided a flower
void squirrelFlowerCollision() {
  for (int i = 0; i < squirrels.size(); i++) {
    for (int j = flowers.size()-1; j>=0; j--) {
      Squirrel tempSquirrel = squirrels.get(i);
      Flower tempFlower = flowers.get(j);
      
      //check squirrel and flower collision
      if (tempSquirrel.collision(tempFlower.xPos, tempFlower.yPos)) {
        //places flower off screen   
        flowers.get(j).xPos = -1000;
        flowers.get(j).yPos = -1000;
        flowers.remove(j);
      }
    }
  }
}
  
//checks squirrel has collided with gardener 
void squirrelPlayerCollision() {
  for (int i = 0; i < squirrels.size(); i++) {
      //check if squirrel has made a collision with gardener
      if (squirrels.get(i).collision(player.posSide, player.posDown) && canHit ) {
        //if hit, decrease health by 2
        playerHealth -= 2; 
        //set a delay for the number of times checked for collision
        canHit = false;
        hitDelay = 0;
      }
      hitDelay++;
      
      //once the delay is over
      if (hitDelay >= 100) {
        //start checking for collision again
        canHit = true;
      }
    }
}

//---------------------GARDENER CLASS----------------------------------------
class Gardener {
  //x coordinate
  int posSide;
  //y coordinate
  int posDown;
  //speed of gardener
  int speed;
  PImage gardenerImage;
  boolean canThrow;
  int throwDelay;
  
  //create a gardener
  Gardener(int speed, int w, int h, PImage img) {
    this.speed = speed;
    posDown = h/2;
    posSide = w/2;
    gardenerImage = img;
  }

  //displays gardener
  void display() {
    move();
    background(34, 139, 34);
    image(gardenerImage, posSide, posDown);
  }

  //moves gardener based on which arrow key is pressed
  void move() {
    if (keyPressed == true) {
      if (keyCode == UP && posDown > 0) {
        posDown -= speed;
      }

      if (keyCode == DOWN && posDown < width) {
        posDown += speed;
      }
      
      if(keyCode == LEFT && posSide > 0) {
        posSide -= speed;
      }
      
      if(keyCode == RIGHT && posSide < height) {
        posSide += speed;
      }
      
    }

    if (posDown < 30) {
      posDown = 30;
    }
    else if (posDown > height - 100) {
      posDown = height - 100;
    }
    
    if(posSide < 0) {
      posSide = 0;
    }else if(posSide > width/5) {
      posSide = width/5;
    }
  }
  
  //updates the shovels that are thrown
  void updateThrow() {
    if (keyPressed && keyCode == CONTROL && canThrow && numShovels != 0) {
      shovels.add(new Shovel(posSide, posDown, loadImage("shovel.png")));
      numShovels--;
      //creates delay for throwing of shovel
      canThrow = false;
      throwDelay = 0;
    }
    throwDelay++;

    //once delay is over
    if (throwDelay >= 20) {
      //gardener can throw another shovel
      canThrow = true;
    }
  }
}
//------------------------FLOWER CLASS------------------------------------
class Flower {
  int xPos;
  int yPos;
  int width;
  int height;
  PImage flowerImage;

  //constructs a flower
  Flower(int x, int y, PImage img) {
    xPos = x;
    yPos = y;
    flowerImage = img;
  }

  //displays flower
  void display() {
    image(flowerImage, xPos, yPos);
  }
}
//---------------------SQUIRREL CLASS----------------------------------------
class Squirrel {
  int xPos;
  int yPos;
  int speed = 2;
  //int topHeight;
  //int bottomHeight;
  PImage squirrelImage;
  int w;
  int h;

  //creates squirrel
  Squirrel(int x, int y, PImage img) {
    xPos = x;
    yPos = y;
    squirrelImage = img;
    w = img.width;
    h = img.height;
  }
  
  //changes the x position based on speed
  void move() {
    xPos -= speed;
  }
  
  //draws squirrel
  void display() {
    move();
    image(squirrelImage, xPos, yPos);
  }
  
  //checks for collision given the coordinate of an object
  boolean collision(int x, int y) {
    //if the x position of the object is between the width of the squirrel image
    //and the y position is between the height of the squirrel image, there is a collision
    return (x > xPos - w + 25  && x < xPos + w + 25 && y > yPos - h && y < yPos + h);
  }
}
//-----------------SHOVEL CLASS-------------------------
class Shovel {
  int xPos;
  int yPos;
  int speed = 3;
  PImage shovelImage;
  int w;
  int h;
  
  //creates shovel
  Shovel(int x, int y, PImage img) {
    shovelImage = img;
    xPos = x + 50;
    yPos = y + 30;
    w = img.width;
    h = img.height;
  }
  
  //checks for collision
  boolean collision(int x, int y) {
    //if the x position of the object is between the width of the squirrel image
    //and the y position is between the height of the squirrel image, there is a collision
    return (x > xPos - w && x < xPos + w && y > yPos - (h+5) && y < yPos + (h+5) );
  }
  
  //decreases the x position based on speed
  void move() {
    xPos += speed;
  }
  
  //draws the shovel
  void display() {
    move();
    image(shovelImage, xPos, yPos);
  }
}





