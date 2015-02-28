
/*LeapDrawing by Sonia Martin
 Libraries needed: ControlP5 and Leap Motion for Processing
 LeapMotion software must be installed, and the controller must be functioning
 
 LeapDrawing is an educational game that uses LeapMotion to teach younger children shapes.  
 It has a game mode and a learn mode, and uses the LeapMotion controller to allow the user to draw shapes on screen.
 
 References
 -help from Ms. Freed
 -LeapMotion help and advice form Pauline
 Websites:
 -http://www.learningprocessing.com/examples/chapter-9/example-9-9/
 -Processing Reference
 -ControlP5 website:www.sojamo.de/libraries/controlP5/‎
 -COMING SOON: idea from coolmath.com for the trailing pointer obejcts on the first page
 -LeapMotion site, software, and forums; developer.leapmotion.com
 */

//First import the libraries, and initialize ControlP5 and the Leap controller
import de.voidplus.leapmotion.*;
import controlP5.*;
ControlP5 cp5;
LeapMotion leap;

//variables for background color:
//float background1=random(50, 200);
//float background2=random(50, 200);
//float background3=random(50, 150);
float background1=110;
float background2=245;
float background3=156;
//Initialize all of the ControlP5 text boxes:
Textlabel titleText;
Textlabel titleTextGame;
Textlabel titleTextLearn;
Textlabel titleTextCircle;
Textlabel titleTextRhombus;
Textlabel titleTextTriangle;
Textlabel titleTextSquare;
Textlabel titleTextParallelogram;
Textarea titleSubtext;
Textarea titleSubtextGame;
Textarea titleSubtextLearn;
//Make arrays for the shapes on the title and in the gamee:
TitleShape[] titleObject=new TitleShape[9];
Shapes[] gameLearnShapes=new Shapes[5];

//These booleans are to determine whether there has been a recognized gesture:
boolean keyTap = false;
boolean swipe = false;
boolean screen = false;
//Counter helps with showing the path of the user's finger (see Shapes class below)
int counter=0;


void setup() {
  size(850, 650);
  background(background1, background2, background3);
  //Set the Leap controller and CP5, and let the controller recognize three gesturesL Swipe, Key Tap, and Screen Tap:
  leap = new LeapMotion(this);
  //leap = new LeapMotion(this).withGestures();
  leap = new LeapMotion(this).withGestures("swipe, key_tap, screen_tap");
  cp5 = new ControlP5(this);
  //These for loops set the shapes that appear on the title and in the game, respectively:
  for (int i=0; i<9; i++) {
    titleObject[i]=  new TitleShape(i, int(random(1, 3)), random(10, 50), random(width), random(height) );
  }
  for (int i=0; i<5; i++) {
    gameLearnShapes[i] = new Shapes(i);
  }

  //The following code sets the font, text, position, color, etc. of each text label or area.  
  //Also, the text labels and areas that do not show up on the title page are hidden.
  titleText = cp5.addTextlabel("label")
    .setText("Welcome to LeapDrawing!")
      .setPosition(100, 50)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 60))
            ;
  titleSubtext = cp5.addTextarea("txt")
    .setPosition((width/2-300), 175)
      .setSize(650, 205)
        .setFont(createFont("Garamond", 20))
          .setLineHeight(25)
            .setColor(color(10))
              .setColorBackground(color(background1, background2, background3))
                .setColorForeground(color(200));
  ;
  titleSubtext.setText("The LeapMotion controller detects your hands in the area above the device, and extends almost a foot above the controller.  For best results, gesture and draw with your hands right below eye level.  With one whole hand out, tap lightly downwards in the air with one finger to begin Game Mode, and tap forwards with a finger to start Learning Mode.  Or, practice first by using your pointer finger only to drag these shapes around this page before you begin.  This will help you get the hang of the range of the Leap controller.");

  titleSubtextGame = cp5.addTextarea("txt1")
    .setPosition((width/2-250), 250)
      .setSize(500, 300)
        .setFont(createFont("Garamond", 25))
          .setLineHeight(25)
            .setColor(color(10))
              .setColorBackground(color(177, 243, 250))
                .setColorForeground(color(200));
  ;
  // titleSubtextGame.setText("Instructions: When a shape is given, trace it in the air.  If you trace the shape accurately enough, you will be moved to the next shape.  There are five shapes total.  Swipe to begin.");
  titleSubtextGame.setText("Instructions: When a shape is given, trace it in the air. Game mode coming soon. Swipe across the screen with your whole hand to begin. Click the mouse to return to the title page.");
  titleSubtextGame.hide();

  titleSubtextLearn = cp5.addTextarea("txt2")
    .setPosition((width/2-250), 250)
      .setSize(500, 300)
        .setFont(createFont("Garamond", 25))
          .setLineHeight(25)
            .setColor(color(10))
              .setColorBackground(color(242, 247, 101))
                .setColorForeground(color(200));
  ;
  titleSubtextLearn.setText("Instructions: In the air, trace the shape given.  Swipe across the screen with your whole hand to begin.  Click the mouse to return to the title page.");
  titleSubtextLearn.hide();


  titleTextGame = cp5.addTextlabel("label1")
    .setText("Game Mode")
      .setPosition((width/3)-10, 50)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 60))
            ;
  titleTextLearn = cp5.addTextlabel("label2")
    .setText("Learning Mode")
      .setPosition((width/3)-10, 50)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 60))
            ;
  titleTextLearn.hide();
  titleTextGame.hide();

  titleTextCircle = cp5.addTextlabel("label3")
    .setText("Circle")
      .setPosition((width/2)-30, height-70)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 40))
            ;
  titleTextRhombus = cp5.addTextlabel("label4")
    .setText("Rhombus")
      .setPosition((width/2)-10, height-70)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 40))
            ;
  titleTextTriangle = cp5.addTextlabel("label5")
    .setText("Triangle")
      .setPosition((width/2)-10, height-70)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 40))
            ;
  titleTextSquare = cp5.addTextlabel("label6")
    .setText("Square")
      .setPosition((width/2)-20, height-70)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 40))
            ;
  titleTextParallelogram = cp5.addTextlabel("label7")
    .setText("Parallelogram")
      .setPosition((width/2)-10, height-70)
        .setColorValue(color(10))
          .setFont(createFont("Garamond", 40))
            ;
  titleTextCircle.hide();
  titleTextTriangle.hide();
  titleTextRhombus.hide();
  titleTextSquare.hide();
  titleTextParallelogram.hide();
}


//In the draw loop, the program recognizes if there has been a screen tap or key tap gesture.  If it sees neither of them, it will continue to run the title script.
//If it sees a key tap, it will run gameMode, and if it sees a screen tap, it will run learnMode.
void draw() {
  background(background1, background2, background3);
  if (keyTap==false && screen==false) {
    title();
  }
  if (keyTap) {
    gameMode();
  }
  if (screen) {
    learnMode();
  }
}

//These next three void loops are copied from the LeapMotion Processing example called Gestures.  
//They are each constantly checking for their specific type of gesture, and if they see it, their corresponding boolean will turn true.
void leapOnKeyTapGesture(KeyTapGesture g) {
  keyTap = true;
  println("keytap");
}
void leapOnScreenTapGesture(ScreenTapGesture g) {
  screen = true;
}
void leapOnSwipeGesture(SwipeGesture g, int state) {
  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    swipe = true;
    println("SwipeGesture");

    break;
  }
}

//The title loop is run from the beginning of the program.  The titleObjects that move are the shapes that trail after the mouse.
void title () {
  println("title");
  background1=110;
  background2=245;
  background3=156;
  background(background1, background2, background3);
  titleSubtext.show();
  titleText.show();
  titleSubtextGame.hide();
  titleTextGame.hide();
  titleTextCircle.hide();
  titleTextParallelogram.hide();
  titleTextTriangle.hide();
  titleTextRhombus.hide();
  titleTextSquare.hide();
  for (int i=0; i<9; i++) {
    titleObject[i].show();
    titleObject[i].move();
  }
}


void gameMode() {
  //As gameMode begins, there is no swipe, so the first if statement runs.  It simply displays the gameMode text and resets the counter and background.
  if (swipe == false) {
    counter=0;
    println(swipe);
    titleSubtext.hide();
    titleText.hide();
    titleSubtextLearn.hide();
    titleTextLearn.hide();
    titleSubtextGame.show();
    titleTextGame.show();
    background1=177;
    background2=243;
    background3=250;
    println("game");
    // noLoop();
  }
  //If the user has swiped, then the instructional text will be hidden, and the large shape will begin to show.  
  //The gameLearnshapes[].show() function includes tracking and showing the user's finger movement; see class Shapes below.
  if (swipe) {
    println("Gamemodeinitiate");
    titleSubtextGame.hide();
    titleTextGame.hide();

    //int s = int(random(0,4));
    // gameLearnShapes[s].show(s);
    gameLearnShapes[0].show(0);
  }
  if (mousePressed) {
    keyTap = false;
    screen = false;
    draw();
  }
}
void learnMode() {
  //As learnMode begins, there is no swipe, so the first if statement runs.  It displays the learnMode text and resets the counter and background.
  if (swipe == false) {
    counter=0;
    println("swipefalse");
    titleSubtext.hide();
    titleText.hide();
    titleSubtextLearn.show();
    titleTextLearn.show();
    background1=242;
    background2=247;
    background3=101;
    println("learn");
    // noLoop();
  }
  //If the user has swiped, then the instructional text will be hidden, and the large shape will begin to show.  
  //The gameLearnshapes[].show() function includes tracking and showing the user's finger movement; see class Shapes below.
  if (swipe) {
    println("learnmodeinitiate");

    titleSubtextLearn.hide();
    titleTextLearn.hide();

    gameLearnShapes[0].show(0);
  }
  if (mousePressed) {
    keyTap = false;
    screen = false;
    draw();
  }
}

//The class TitleShape makes the shapes that appear on the title screen.  
class TitleShape {
  float shape;
  float radius;
  float spotX;
  float spotY;
  float fingerNumber;
  int objectNumber;
  int index;
  //When declared, the Titleshapes have a index, type of shape (explained below), radius, x, and y value:
  TitleShape(int tempIndex, int tempShape, float tempRadius, float tempSpot1, float tempSpot2) {
    shape = tempShape;
    radius = tempRadius;
    spotX = tempSpot1;
    spotY = tempSpot2;
    index = tempIndex;
  } 

  //The show function draws the shapes according to their type of shape, radius, and coordinate.  Here, if a TitleShape's "shape" ==1, it is a circle, and if "shape" ==2 it is a rectangle.
  void show() {
    if (shape==1) {
      noFill();
      ellipse(spotX, spotY, radius, radius);
    }
    if (shape==2) {
      noFill();
      rect(spotX, spotY, radius, radius);
    }
  }
  //The move function changed the place of the TitleShape.
  void move() {
    // println(this);
    //objectNumber = this;
    //This line is copied from the Leap Motion for Processing example "Basic."  It tells the program to get the hand's and fingers' positions.
    for (Hand hand : leap.getHands()) {
      //This array list makes each Finger object a part of an array list, so its position can be easily accessed.
      ArrayList<Finger> finger1 = hand.getFingers();
      //This line of code asks for the size of the array list, which is equivalent to the number of fingers that the controller detects at that time.
      fingerNumber = finger1.size();
      //This if statement runs if the controller only recognizes one finger, such as the pointer finger when it is pointing.
      if (fingerNumber ==1) {
        for (int i=1; i<index+2; i++) {
          //Now, the Title Shapes' positions are updated according to the position of the one finger.  Their index number + 1 multiplied by 10 makes the TitleShapes appear in a slanted line below the finger.
          spotX = finger1.get(0).getPosition().x+10*(index+1) ;
          spotY = finger1.get(0).getPosition().y+10*(index+1) ;
        }
      }
    }
  }
}
//The Shapes class defines the shapes in game and learn mode that have to be traced.
class Shapes {
  //Like the "shape" variable in the class TitleShapes, typeOfShape is the index of the Shape and determines what shape it will be.
  int typeOfShape; 
  //The array list of points is used to draw the path of the finger.  The Points class is below.
  ArrayList<Point> points;
  //X and Y value for the line that shows the finger's path.
  float spotY;
  float spotX;


  float fingerNumberGL;
  //To declare these shapes, the index is brought in and it becomes typeOfShape
  Shapes(int temptos) {
    int typeOfShape = temptos;
    points = new ArrayList<Point>();
  }
  void show(int temp) {
    //First, hide all irrelevant text:
    titleSubtextLearn.hide();
    titleTextLearn.hide();
    titleSubtextGame.hide();
    titleTextGame.hide();
    //Copied code from the Leap Processing example Basic. 
    for (Hand hand : leap.getHands()) {
      //Make an array list for all of the finger objects that the controller detects.
      ArrayList<Finger> finger1 = hand.getFingers();
      for (Finger finger : hand.getFingers()) {
        //FingerNumberGL becomes the size of the array list, or how many fingers the controller detects.
        fingerNumberGL = finger1.size();
        //If the controller only detects one finger (e.g. pointer finger), then:
        if (fingerNumberGL ==1) {
          counter = counter+1;
          //Add the current position of the finger into the points array list, and, above, add one to the counter.
          points.add(new Point(finger1.get(0).getPosition().x, finger1.get(0).getPosition().y));
          //If the counter is greater than 1:
          if (counter >1) {
            //In this for loop, change the spotX and spotY variable for every position of the finger that has been recorded.
            for (int i=0; i<counter; i++) {
              fill(0);
              spotX=points.get(i).x;
              spotY=points.get(i).y;
              //If it has recorded more than 1 positions, draw a line from the previous position to the next position, creating the path onscreen of the finger.
              if (i>0) {
                line(points.get(i-1).x, points.get(i-1).y, points.get(i).x, points.get(i).y);
              }
              // ellipse(spotX, spotY, 5, 5);
            }
          }
        }
      }
    }

    //Now, since this code is in the Shapes class, draw the shape (circle, rectangle, etc.), according to the called index value temp, that the user is trying to trace.
    if (temp == 0) {
      noFill();
      ellipse(width/2, (height/2)-30, 300, 300);
      titleTextCircle.show();
    }

    if (temp == 1) {

      titleTextTriangle.show();
    }
    if (temp == 2) {

      titleTextRhombus.show();
    }
    if (temp == 3) {

      titleTextSquare.show();
      rect(100, 100, 100, 100);
    }
    if (temp == 4) {

      titleTextParallelogram.show();
    }
  }
}

//This class point is used so that the flexible-size array list can be used to store the current and previous finger positions so the movement can be show on screen.  
//It only includes x and y values, so that each Point object becomes the coordinates of the finger position in any point in time.  
class Point {
  float x;
  float y;
  Point(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
}

