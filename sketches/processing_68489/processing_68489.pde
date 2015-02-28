
/*This is an update from my final project, for Creativity & Computation Lab. I am going to try 
to update it so that the hair in the hair reserve falls down to the bottom after you grab hair from it. 
*/
/*This is my pseudo code for my final Code Project. My idea is to make an online
 interactive Hairy Harry game. The original game is a cheapo toy where you move a magnet
 across a board with an image of a bald man. There is clear plastic on top of the picture, 
 in which is encased a bunch of little tiny "hairs" that attract to the magnet in clumps
 when you press it to the board. Then you drag those hairs to the spot you like on the face
 and pick up the magnet. This is sort of like mousePressed, mouseReleased, so I want to do this for my game.
 There will also be a button to press to SAVE --> save() <---- to keep your image, and a button
 to restart, a button to change the background picture, and a button to change the color of the hair. 
 */

//I will make an array to make tons of little hairs
int gameState;

int hairX;

float hairY;

PImage wand;
PImage howto;
PImage gameboard;
int facenumber;
PImage face1;
PImage face2;
PImage face3;
PImage face4;
//PImage face5;

int r;
int g;
int b;

//a variable for saving the completed image as a file on your computer
//string filename;
//since all of the hairs need to be the same length of line, I will not need
//to make a hairY position...it will simply be hairX plus four or five

float[] hairXpos = new float[5000];
float[] hairYpos = new float[5000];

//int[] facenumber = new int[5];

//a boolean array will let us know if hairs are close to the magnet
boolean[] isBeingMoved = new boolean[5000];


void setup() {
  //the background needs to be the image that I make of Wooly Willy (give a new name - HairyHumans). I want it to have a frame around it like the original game
  //to keep the similar aesthetics. Another image will be loaded on top of that(?)will that work, in the center
  //which will be the face. That is the only part that will change. 
  background(255);
  gameState = 0;
  //set background width, height based on size of image (all images will be same size that I load, done in PS)
  size(700, 800);
  //hairs will be line, so a line gives the xpos, ypos of start, xpos, ypos of finish. hairXpos will be the start x
  //hairs start at bottom of screen, so will have to constrain the placement with hairY to begin
  noCursor();
  //this seems to be landing all of them still on almost exactly the same y coord, why is that?
  //I want the magnet wand image to be loaded at the cursor at all times
  wand = loadImage("magnetwand.png");
  
  howto = loadImage("hairyhumanshowTo.jpg");

  gameboard = loadImage("hairyhumans_frame.jpg");
  
  //color integers set to black for beginning of game for the black stroke of hair
  r = 0;
  g = 0;
  b = 0;

//CRAZY FACE ARRAY!
 // for(i=0; i<5; i++){
   // facenumber[i]+=1;
  //}
    
facenumber = 0;

   face1 = loadImage("face1.jpg"); //image borrowed from easyvectors.com
   
  face2 = loadImage("face2.jpg"); //image borrowed from graphichive.net
   
  face3 = loadImage("face3.jpg"); //image borrowed from 
   
   face4 = loadImage("face4.jpg"); //my own image woohoooooo
 

  for (int i=0; i < 5000; i++) {
    hairXpos[i] = random(138, 575);
    //also need to have it set as a color
  }

  for (int i=0; i < 5000; i++) {
    hairYpos[i] = random(590, 650);
    isBeingMoved[i] = false;
  }
}

void draw() {
  //replace white background with the photo of course, once I have them all
  background(255);
  
  if (gameState == 0){
    image(howto, 0, 0);
  }
  
  if (gameState == 1){
    image(gameboard, 0, 0);
  noCursor();
  //image(facenumber[i], 140, 100);

  //colored areas to choose color of hair from
  //take off stroke on outside or else it changes when hair color changes
  //can't see yellow hair, so put all this in it's own little grey box
  fill(209, 204, 204);
  rect(190, 690, 350, 40);

  noStroke();
  fill(240, 158, 27);
  rect(200, 700, 25, 20);
  fill(0);
  rect(250, 700, 25, 20);
  fill(209, 209, 17);
  rect(300, 700, 25, 20);
  fill(144, 3, 3);
  rect(350, 700, 25, 20);
  fill(85, 65, 9);
  rect(400, 700, 25, 20);
  fill(237, 240, 239);
  rect(450, 700, 25, 20);
  fill(216, 21, 227);
  rect(500, 700, 25, 20);
  
   if(facenumber == 0) {
 image(face1, 140, 90);
 }
 if (facenumber ==1) {
 image(face2, 140, 90);
 }
 if (facenumber == 2) {
 image(face3, 140, 90);
 }
 if (facenumber == 3) {
 image(face4, 140, 90);
 }
// if (facenumber == 4) {
 //image(face5, 140, 90);
 //}
 //go back to start like a loop once you get to the last drawing face
 if (facenumber > 3) {
 facenumber = 0;
 }
 //same thing with pressing left arrow, reset if less than 0
 if (facenumber < 0) {
 facenumber = 3;
 }

  //now set an array to make a whole slew of hairs (100 I'll try to start) that are all at the bottom of the screen)

  //here, I am trying to make all of the lines 10 px long 
  //I want the hair to be thicker than 1 stroke
  strokeWeight(2);
  stroke(r, g, b);
  for (int i=0; i < 5000; i+=2) {
    line(hairXpos[i], hairYpos[i], (hairXpos[i] + 5), (hairYpos[i] + 5));
//    isBeingMoved[i] = false;
    //the above causes all of the hairs to be at the same angle, which isn't good. So, I will 
    //make another array for ones slanted the other way by giving the xpos - 10 
    //100 is definitely not enough hairs! Let's up it to 500!
  }
  for (int i=1; i< 5000; i+=2) {
    line(hairXpos[i], hairYpos[i], (hairXpos[i] - 5), (hairYpos[i] + 5));
//    isBeingMoved[i] = false;
  }
  
  for (int i = 0; i < 5000; i++) {
   if (isBeingMoved[i] == true) {
    hairXpos[i] = mouseX + random(-12, 12);
    hairYpos[i] = mouseY + random(-12, 12);
   } 
   //here i will try to make my change, for the hairs to fall down
  /* Adding this caused all the hairs to move and no hairs to stay on the face. NO GOOD! else {
     if (dist(hairXpos[i], hairYpos[i], hairXpos[i], hairYpos[i]) < 1){
     //so isBeingMoved[i] is false here...I want the hair to fall DOWN, so it is the yPos
     hairYpos[i] = random(630, 650); 
  }
   }
  */
  /*this attempt isn't working either, all the hair falls right from the start and keeps moving, and the game runs super slow
  else{
  for (int k = 0; k < 4996; k++){
  if (isBeingMoved[i] == false && hairYpos[i] >= 590 && dist(hairXpos[i], hairYpos[i], hairXpos[k], hairYpos[k]) < 4){
    hairYpos[i] = random(640, 650);
  }
    
  } */
}
image(wand, mouseX, mouseY - wand.height);
}
  }

/*This is where the image will be loaded. What other functionality needs to go here?*/
/*I need to create the red stick with black magnet on the end to be the pointer. Will have to make that image, 
 then load it at (mouseX, mouseY) so it takes over as the cursor*/

//}
//when mousePressed is true, hairs within 10 px of mouse will move with the mouse
//will have to go back and change how hairY is created, need it to also move with the mouse being pressed, not just make line extend really far to where x becomes
void mousePressed() {
  //for hair on the mousepoint diameter and 10px around it..How do I write that?
  for (int i = 0; i < 5000; i++) {
    if (dist(mouseX, mouseY, hairXpos[i], hairYpos[i]) < 8) {
     isBeingMoved[i] = true; 
    }
  }
}

//when mouseReleased occurs, the hairs that were attached to the cursor will drop onto the x, y coordinate they are over
void mouseReleased() {
  for (int i = 0; i < 5000; i++) {
   isBeingMoved[i] = false; 
  }
}

//when the user clicks on the square that is filled with a color they like, all of the hairs will turn into that color
//this means I have to have squares on one part of the screen, where the instructions are, that are colored different colors
//when the mouse clicks on one of the squares, the same color will be assigned to the stroke of the hairs
//this means I need to make a variable of hair color that can change when the mouse is clicked
void mouseClicked() {
  if (mouseX >= 200 && mouseX <= 225 && mouseY >=700 && mouseY <= 720) {
    r = 240;
    g = 158;
    b = 27;
  }
  if (mouseX >= 250 && mouseX <= 275 && mouseY >=700 && mouseY <=720) {
    r = 0;
    g = 0;
    b = 0;
  }
   if (mouseX >= 300 && mouseX <= 325 && mouseY >=700 && mouseY <=720) {
    r = 209;
    g = 209;
    b = 17;
  }
   if (mouseX >= 350 && mouseX <= 375 && mouseY >=700 && mouseY <=720) {
    r = 144;
    g = 3;
    b = 3;
  }
   if (mouseX >= 400 && mouseX <= 425 && mouseY >=700 && mouseY <=720) {
    r = 85;
    g = 65;
    b = 9;
  }
   if (mouseX >= 450 && mouseX <= 475 && mouseY >=700 && mouseY <=720) {
    r = 237;
    g = 240;
    b = 239;
  }
   if (mouseX >= 500 && mouseX <= 525 && mouseY >=700 && mouseY <=720) {
    r = 216;
    g = 21;
    b = 227;
  }
}

//when the user clicks the right or left arrows, the background image scrolls for a bunch of different options
//I will have to do some illustrator and photoshop work to create a guy, a girl, a hipster, an animal of some sort, maybe a baby or something weird
void keyPressed(){
  //RESTART with hair at bottom of screen 
  if(key==ENTER) {
    setup();
    gameState = 1;
  }
  if(key==RETURN) {
    setup();
    gameState = 1;
  }
//change gameState so that we go from welcome/instructions screen to the play screen
//this uses the spacebar to go from welcome screen to game
  if (key == 32) {
    gameState++;
      if (gameState > 1) {
        gameState = 0;
      }
  }
//change face canvas to a different face
 if(keyCode == RIGHT) {
 facenumber += 1;
 }
if(keyCode == LEFT){ 
facenumber -= 1;
}

//save your current drawing (doesn't work on web browser though)
//keycode 112 is P, so they have to click p to print the screen
  if (key ==112){
    save("myHairyHuman" + int(random(1, 1000000))+".jpg");
 }
}


//there should also be save() functionality so that the finished drawing can be 

//To make this more of a game and less of a drawing tool, there could be a finished image at the top when you scroll...rather
//than changing the face you draw on, it scrolls through finished products of funny hair-dos. The goal of the game would be
//to get as close to that finished drawing as possible within a time limit. If you don't do it in time, it resets hairs to bottom of screen
//How would I be able to let the computer tell if the user is creating the same facial hair, though?


