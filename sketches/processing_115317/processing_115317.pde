
/*
For this project I had to make a sketch that would random two cards and compare 
 them to see which was highest before printing the results below then (with the addition of aces being high).
 
 I decided to improve upon this by allowing cards to be randomed with a mouse click and when the mouse is released it updates the comparison result.
 This also helped during testing of the results.
 
 */


PImage[] cards = new PImage[13]; //Created an array of the PImage datatype called cards and then specified that it would have 14 items in the array
PFont f; //Created an instance of PFont class and called it f

int j = int(random(13)); //made an integer variable called j and made it initially equal to a random float between 1 and 13 converted to an integer.
int k = int(random(13)); //same for k
String verdict = ""; //made a string variable called verdict, this would be the comparison result which is initially empty

void setup() { //this is where I set up the sketch at the start, contents here load once and cannot be interacted with from the draw command
  size(600, 600); //set the size of the stage
  smooth(); // called upon the smooth function so the graphics would be smoother
  imageMode(CENTER); //set the image mode to center thus changing the registration point of images for the sketch

  for ( int i = 0; i < cards.length; i++ ) { //for loop for loading in the images in the data folder into the cards array while i is less than the length of the cards array
    cards[i] = loadImage( "heart_" + (i+1) + ".jpg" ); //makes the i instance of the cards array equal to the image that is named 1 above the the current i poisiton of the array e.g the 0 position in the array is equal to hearts_1.jpg
  }
  f = loadFont("HelveticaNeueLTCom-Lt-48.vlw"); //made the PFont instance load in the font helvetica neue
  textFont(f, 32); //made the text equal to the loaded in helvetica in f and the size of the font 32
  textAlign(CENTER); //centred the text horizontally
  mouseReleased(); //runs the mouseReleased function once at the start, as the cards will have been randomed once already and the verdict is to be issued with a release of the mouse button which can't happen at the start otherwise
}


void draw() { //draw command which will run at 60 times per second as default as I haven't changed it with the frameRate command
  background(255); //makes the background white
  fill(0); //makes the fill black
  text(verdict, width/2, (height-height/6)); //the text function prints the text within verdict at the x position of the width of the screen divided by two and the y position of the height minus the height divided by 6
  image(cards[j], (width/3 - 5), height/2, cards[j].width/2, cards[j].height/2); //the image function prints the image in the j position in the cards array in the middle of the screen (- 5 x) and makes it half the size of the original image loaded in
  image(cards[k], (width/3+width/3 + 5), height/2, cards[j].width/2, cards[j].height/2); //does the same but uses the k position in the cards array and is placed + 5 x from the middle to provide the cards a gutter between them
}

void mousePressed() { //a function to run when a mouse button is pressed
  j = int(random(13)); //makes the j variable equal to a random number between 1 and 13
  k = int(random(13)); //same for k
  verdict = ""; //makes the verdict blank
}

void mouseReleased() { //when the mouse button is released the verdict is displayed on screen
  if (j > k && k != 0 || (j == 0 && k != 0)) { //if j is more than k and k isn't 0 (the ace, which is high) OR j is the ace and k isn't the ace then j is the higher number
    verdict = "The first card is higher"; //changes the verdict to be printed
  }
  else if (k > j && j!= 0 || (k == 0 && j != 0)) { //same as previous but with j and k reversed - the OR section is how I decided to handle the aces high aspect. It states that if say, k isn't higher than j but k is 0 and j isn't then k is the higher card
    verdict = "The second card is higher";
  }
  else { //the only other eventualities are the cards being the same in which case this plays
    verdict = "The cards are the same";
  }
}



