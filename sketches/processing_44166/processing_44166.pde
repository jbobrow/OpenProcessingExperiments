
// Current level//
int level;
 
//point count//
int score;
 
// Object moves as time passes//
float time;
 
// Time speed. Time++ when game progresses, called each time draw is called//
float tspeed;
 
// The game can shows messages when the level increases
// and when the game is over
String message = "";
 
// how many frames for msg text (time elapsed)//
// If it's 0, no message is displayed//
int message_time = 0;

//load images//
PImage field;
PImage shepherd;
PImage sheep1;
PImage zombie2;
 
// This list indicates which circles have been eaten and which not//
// false means not eaten, so display this circle.//
//true means eaten, so don't display this circle anymore.//
//NEED TO CHANGE BOOLEAN!!! so the eaten == true; circle will rotate along//

boolean[] goodSheep = {};
 
void setup() {
  size(480, 640); //set to cellphone resolution//
  imageMode(CENTER);
  field = loadImage("background.png");
  shepherd = loadImage("shepherd.png");
  sheep1 = loadImage("sheep1.png");
  zombie2 = loadImage("zombie2.png");
  
  
  noFill();
  strokeWeight(2);
  textAlign(CENTER);
  game_start();
}
 
// Initialize variables
void game_start() {
  tspeed = 0.004;
  time = 0;
  score = 0;
  level = 1;
  goodSheep = new boolean[1];
  goodSheep[0] = false;
}
 
//all circles get eaten; level++//
void next_level() {
   
  //++ the time speed per level//
  tspeed += 0.0002;
  level++;
   
  //++ the size of the goodSheep array//
  goodSheep = (boolean[]) append(goodSheep, false);
   
  // Reset the goodSheep array//
  for (int i=0; i< level; i++) {
    goodSheep[i] = false;
  }
   
  // Show this message//
  //NEED TO CHANGE TO COOLER MSG!//
  message = "Collect all the " + level + "sheep!";
   
  // Show the message for this many frames//
  //refresh rate x frames = seconds//
  message_time = 110;
}
 
// You were touched by zombieSheep//
//you suxx0rsss//

void game_over() {
   
  message = "Game over!\nScore: " + score;
  message_time = 230;
   
  //Reset//
  
  game_start();
}
 
// boolean tests if all goodSheep have been collected//
// next level++//

boolean allCollect() {
   
  // number of goodSheep = the current level//
  // Run through all the sheep 
  for (int i=0; i< level; i++) {
    
    //if all the goodSheep haven't been collected, then screw it.//
    //only 1 item need to be tested in the array, no need to grab all//
    
    if(!goodSheep[i]) {
      return false;
    }
  }
  //didn't return before == all items are true.//
  //That means all sheep were collected, new level++//
  return true;
}
 
// Main game loop//

void draw() {
  image(field, width/2, height/2);
  
  //test for message display//
  if(message_time > 0) {
    
    text(message, width/2, height/2);  // show it in the middle of the screen//
    message_time--; //counter decrease so msg will disappear after count end//

    return;
  }
   
  // Set main player color
  fill(0);
  // main player//
  image(shepherd, mouseX, mouseY);
  //ellipse(mouseX, mouseY, 50, 50);
 
  // draw elements//
  //zombie sheep+good sheep amt == current level//
  
  int i = 0;
  while(i < level) {
    
    /* zombieSheep position//
    // use noise() to calculate the position.//
    // use time as one of the parameters, so position changes over time.//
    // use the zombieSheep number (i) as well, so each enemy is on a different position//
    // use two random values (200 and 100) so x and y are not identical.*/
    
    float x = map(noise(time, i, 400), 0, 1, 0, width);
    float y = map(noise(time, i, 600), 0, 1, 0, height);
    
    fill(250,0,0);
    // Draw zombieSheep//
    image(zombie2, x, y);
    //ellipse(x, y, 60, 60);
    // If the distance between you and this enemy is too small you are touching each other//
   // equation = player radius/2 + zombie/2 //
   
    if(dist(x,y,mouseX,mouseY) < 55) {
      //if you touch zombies you're dead//
      game_over();
      return;
    }
 
    // if item not collected yet, draw it//
    
    if(!goodSheep[i]) {
      x = map(noise(i, time, 400), 0, 1, 0, width);
      y = map(noise(i, time, 600), 0, 1, 0, height);
      
      //draw your goodSheep//
      image(sheep1, x,y);
      //fill(0,0,250); 
      //ellipse(x, y, 30, 30);
      //same equation as the one for zombie sheep//
      if(dist(x,y,mouseX,mouseY) < 40) {
        //COLLECTION POINT!//
        //sheep should start rotating//
        goodSheep[i] = true;
        score += level;
        
        
        //check for collection//
        if (allCollect()) {
          //call our new level//
          next_level();
          return;
        }
      }
    }
     
    //go through everything//
    i++;
  }
 
  //screen score//
  text("Score: " + score, 40, 20);
 
  //++speed/level//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
  time += tspeed;
}

