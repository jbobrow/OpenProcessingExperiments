
PImage menu;
PImage[] images = new PImage[8];
PFont title;
int stage, screensizex, screensizey;
String[] questions = new String[8];
char[] choices = new char[8]; 
int i = 0;
int x = 0;
// int i = (int)random(0, choices.length);  ;
// int[] questionsasked = new int[8];
// int counter = 0;

//Audio
import ddf.minim.*;
Minim minim;
AudioPlayer player;


void setup() {


  images[0] = loadImage("COW.jpg");
  images[1] = loadImage("BIRD.jpg");
  images[2] = loadImage("FISH.jpg");
  images[3] = loadImage("MOUSE.jpg");  
  images[4] = loadImage("ELEPHANT.jpg");
  images[5] = loadImage("SNAKE.jpg");
  images[6] = loadImage("ZEBRA.jpg");
  images[7] = loadImage("PIG.jpg");  


  questions[0] = "What is this Animal? Press 1 for Snake, 2 for Cow, 3 for Worm or 4 for Bug";
  questions[1] = "What is this Animal? Press 1 for Rabbit, 2 for Snail, 3 for Bird or 4 for Eagle";
  questions[2] = "What is this Animal? Press 1 for Horse, 2 for Cat, 3 for Worm or 4 for Fish";
  questions[3] = "What is this Animal? Press 1 for Worm, 2 for Mouse, 3 for Worm or 4 for Bat";
  questions[4] = "What is this Animal? Press 1 for Lizard, 2 for Lion, 3 for Worm or 4 for Elephant";
  questions[5] = "What is this Animal? Press 1 for Spider, 2 for Snail, 3 for Snake or 4 for Pigeon";
  questions[6] = "What is this Animal? Press 1 for Snake, 2 for Rabbit, 3 for Butterfly or 4 for Zebra";
  questions[7] = "What is this Animal? Press 1 for Cat, 2 for Pig, 3 for Dog or 4 for Bug";

  choices[0] = '2';
  choices[1] = '3';
  choices[2] = '4';
  choices[3] = '2';
  choices[4] = '4';
  choices[5] = '3';
  choices[6] = '4';
  choices[7] = '2';



  if (stage==1); // the following is all for the menu (stage 1)
  screensizex = round(displayWidth*0.95);    //Sets the window to 95% of the display size and rounds it to the nearest int. This allows the game to be displayed on a number of different screen sizes.
  screensizey = round(displayHeight*0.95); 
  size(screensizex, screensizey);

  title = loadFont("AppleCasual-74.vlw");  
  textFont(title, 90);
  textAlign(CENTER);



  minim = new Minim(this);        //plays the background music - ambler.mp3
  player = minim.loadFile("Ambler.mp3");
  player.play();
}

void draw() {

  if (i == 8) {
    rect(0, 0, 500, 500, 255);
    fill(0);
    gameComplete();
    noLoop();
  }
  else
  {
    //  questionsasked[counter]=i;
    if (stage==1);
    {       //Everything in stage 1 is the start screen
      menu = loadImage("menu.jpg");
      image(menu, 0, 0, screensizex, screensizey);   // sets the image to take up the whole screen
      fill(0);   
      text("Hit Any Key To Continue!", screensizex*0.50, screensizey*0.95);   //Creates a drop shadow behind the green text
      text("Name That Animal! ", screensizex*0.50, screensizey*0.1);
      fill(#33DB31);
      text("Name That Animal! ", screensizex*0.503, screensizey*0.103);
      text("Hit Any Key To Continue!", screensizex*0.503, screensizey*0.953);






      if (keyPressed == true) {
        stage = 2;             //When a key is pressed the game will move from stage 1 (title screen) to stage 2 (the game)
      }
    }


    if (stage==2) {

      background(#9DDBF7);  //temporary background for stage 2
      image(images[i], 0, 0, screensizex, screensizey*0.85);
      textSize(36);
      fill(50);
      text(questions[i], screensizex*0.5, screensizey*0.95);
    }
  }
}


void keyPressed() //keys pressed will check the answers array and increment counter.
{
  if (stage==2) { 
    if (i < 8) {

      if (key == choices[i])

      {
        //make i a random number
        //check if its already in the array             was working on making the questions display in a random order - did not have time to fully complete complete.
        //if it is break loop
        //if not keep going

        i++;  //increments i counter
      }

      else {
        fill(#33DB31);
        textSize(32);
        text("Sorry, that was not correct", screensizex*0.5, screensizey*0.1);  //text will display when the incorrect number is pressed.
      }
    }
  }
}
void gameComplete() { 
  menu = loadImage("end.jpg");
  image(menu, 0, 0, screensizex, screensizey);  
  textFont(title, 30); 
  fill(#33DB31); 
  text("Fun fact: " + myfacts[int(random(16))], screensizex*0.5, screensizey*0.95);
}

 





//animal facts that will be randomly displayed at the completion of the game.

String [] myfacts  = {

  "Oysters can change gender depending on which is best for mating", 
  "Ostriches can run faster than horses and male ostriches can roar like lions", 
  "A blue whales belly button is only about the size of a salad plate", 
  "Chihuahuas were raised by the Aztecs for sacrificial purposes and for food", 
  "An elephant is able to pick up a single blade of grass with its trunk", 
  "At birth, a panda is smaller than a mouse", 
  "Hummingbirds beat their wings 60-80 times per second", 
  "The flamingo can only eat when its head is upside-down", 
  "Cats can actually learn to bark", 
  "The oldest known animal in the world was Ming, the 405-year old clam, discovered in 2007", 
  "For every human in the world, there are one million ants", 
  "Koalas have human-like fingerprints.", 
  "A crocodile cannot stick its tongue out", 
  "A cat's meow is usually not directed at another cat, but at a human. ", 
  "Sloths take two weeks to digest their food.", 
  "Elephants are the largest land-living mammal in the world.",
  
};




