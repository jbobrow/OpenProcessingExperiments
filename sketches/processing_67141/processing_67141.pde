
PImage discoBall; //imagename

//The disco balls
float [] circleX=new float [10]; //array for sphereX position
float [] circleY=new float [10]; //array for sphereY position
float [] yVel = new float [10]; //yVel for spheres
float [] d = new float[10]; // diameter for sphere

//The squares
float [] xVelSquare = new float [5]; //xVelsquare for square
float [] squareX = new float [5]; // X position for squares
float [] squareY = new float[5]; // Y position for squares (we'll multiply these in the for loop in setup)
float [] squareW = new float[5];
float [] squareH = new float[5];

PFont myFont; //fontloading
//int fontPosY=n;
float startingTime= 0; //this variable will indicate the starting time of whatever phenomenon you want to have for an interval of time
float interval= 3000; //this variable indicates the interval (in milliseconds), so this is 3 seconds
boolean on = false; //switch for next countdown number
String state = "countdown"; 


void setup() {
  size(600, 600);
  smooth();
  noStroke();
  //  String [] fontList =PFont.list();

  frameRate(30);

  //Setting up the squares
  for (int i=0;i<5; i++) {
    squareX[i] = -120;
    squareY[i] = (i+1)*100; //Spacing out the squares
    squareW[i] = 120;
    squareH[i] = 20;
    xVelSquare [i]=random(1, 5); //Setting the X speed for each sqaure
  }

  //Setting up the circles
  for (int i=0; i<10; i++) {
    circleX[i]=50*(i+1);
    d[i] = 20;
    //  circleY[i]=9*(i+1);
    yVel[i] = random(0, 10);
  }
  discoBall= loadImage("sphere.png");
}

void draw () {


  if (state == "countdown") {
    background(255);
    if (millis()<1000) {
      println (3);
      text("3", 20, 300);
    }

    if (millis()>1000 && millis()<2000) {
      println(2);
    }

    if (millis()>2000 && millis()<3000) {
      println(1);
    }

    if (millis()>3000 && millis()<4000) {
      println ("Go");
    }

    if (millis()>=3000) {
      state="balls";
    }
  }
  if (state == "balls") {
    background(0);


    //Draw the squares
    for (int i=0; i<5; i++) {
      fill(255, 255, 255, 90);
      rect(squareX[i], squareY[i], squareW[i], squareH[i]);

      //  myFont =createFont ("Helvetica", 24, true);
      //  textFont(myFont);
    }

    for (int i=0; i <10; i++) {
      fill(255);
      //    println(discoBall+ " " + circleX[i] + " " + circleY[i]);
      image(discoBall, circleX[i], circleY[i], d[i], d[i]);
    }
    update();
  }
}

void update () {

  //Collision of balls  
  for (int i = 0; i < 10; i++) {
    //Making each ball check every squre X position one at a time
    for (int j = 0; j < 5; j++) {
        println("Paddle " + j + "at X position: " + squareX[j]);      
      //going through current X position of all sqaures and checking if the ball collides with them
      if ((circleY[i] + d[i]/2) >= squareX[j] && (circleY[i] + d[i]/2) >= squareX[j] - squareW[j] && circleY[i] + d[i]/2 <= squareX[j] + squareW[j]) {
        println("collision happened at " + (circleY[i] + d[i]/2) + " with Square " + j);
        yVel[i] = yVel[i]*(-1);
      }
    }
  }

  //Updating the circle Y positions
  for (int i=0; i<10; i++) {
    circleY[i]=circleY[i]+yVel[i];
  }

  //Update the square X positions
  for (int i=0; i<5; i++) {
    squareX[i] = squareX[i] + xVelSquare[i];
  }
}


