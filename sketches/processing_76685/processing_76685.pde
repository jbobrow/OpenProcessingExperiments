
/*****************************************
 * Assignment 4
 * Name:         Louis Cipriano
 * E-mail:       lciprian@haverford.edu
 * Course:       CS 110 - Section 001
 * Submitted:    October 23, 2012
 * 
 * The following code depicts three snowmen in a winter nighttime snowfall.
 * Clouds appear and move when the program is run . Clicking the mouse and each subsequent click displays more clouds (on area mouse was clicked) that move.
 * Snow falls from the sky and continually falls the first time the mouse is clicked.
 * Please see the attached word document for a more full description.
 ***********************************************/
 
Snowman mySnowman1; //declare snowman1
Snowman mySnowman2; //declare snowman 2
Snowman mySnowman3; //declare snowman3
Snowflake [] snowflakes = new Snowflake[100]; // declare array of snowflakes that fall

boolean mouseClickedOnce = false; //for snow and clouds to stay on screen & continue to fall when mouseClicked and boolean becomes true
int idxCloudIndex = 0; //shows where to save next new object
int MaxNumObjects = 3; //maximun number of cloud clusters that can be displayed at once
Cloud [] clouds = new Cloud [MaxNumObjects]; // declare array of clusters of clouds that move

void setup () {
  size (500, 500);
  smooth ();
  //initialize snowmen
  mySnowman1 = new Snowman(100, 360, 100, 80);
  mySnowman2 = new Snowman(250, 360, 100, 80);
  mySnowman3 = new Snowman(400, 360, 100, 80);

//for loop to initialize snowflake array - includes color, random location values, and falling speed
  for (int i = 0; i<snowflakes.length; i++) {
    snowflakes[i] = new Snowflake(color(255), random(width), random(height), 1/20.0);
  }
  
  //for loop to initialize cloud array - includes color, starting location values, and speed
  for (int i = 0; i<clouds.length; i++) {
    clouds[i] = new Cloud(color(255), 50, i*20, (i+1)/4.0);
  }
}

void draw () {
  noStroke();
  fill(255);
  rect(0, 400, width, height); //makes ground covered in white snow
  fill(0, 0, 128);
  rect(0, 0, width, 400); //makes blue night sky

  //call dislay method for snowmen objects
  mySnowman1.display();
  mySnowman2.display();
  mySnowman3.display();

//move and display cloud clusters
  for (int i = 0; i < clouds.length; i++) {
    if (clouds[i] != null) { //to test each element of the cloud array to see if it is a object or is empty
      clouds[i].move(); //clouds move - speed declared in void move
      clouds[i].display(); //clouds displayed - clouds to be displayed are made in constructor
    }
  }
//display snowflakes and make them fall when mouse is clicked
  if (mouseClickedOnce) { //snow falls when mouse is clicked one time
    for (int i = 0; i < snowflakes.length; i++) {
      snowflakes[i].fall(); //snow falls from sky - speed of falling snow declared in void fall
      snowflakes[i].display(); // snowflakes displayed - snowflakes to be displayed are made in constructor
    }
  }
}

//mouseClicked allows more clouds to appear and move on the location where the mouse was clicked
void mouseClicked () { 
  mouseClickedOnce = true; //makes clouds remain in picture after mouse is clicked
  clouds[idxCloudIndex] = new Cloud(color(255), mouseX, mouseY, (idxCloudIndex+1)/4.0); //each click, new clouds will appear on spot mouse is clicked and move 
  idxCloudIndex = (idxCloudIndex + 1) % MaxNumObjects; //increment the index into clouds - stays within range between 0 and MaxNumObjects
}

class Snowman { //define snowman class and declare variables to build snowman
  int X;
  int Y;
  int w;
  int h;

  Snowman (int tempx, int tempy, int tempw, int temph) { //constructor snowman
    X = tempx;
    Y = tempy;
    w = tempw;
    h = temph;
  }

  void display () { //function to display snowman
    //snowman's body - 3 balls of snow
    noStroke();
    fill(255);
    ellipse( X, Y, w, h); //base of snowman
    ellipse(X, Y-75, w-20, h-10); //middle of snowman
    ellipse(X, Y- 140, w - 30, h - 20); //head of snowman

    //snowman's eyes - made to look like they were made with black rocks
    fill(0);
    ellipse(X-10, Y-150, 10, 10);
    ellipse(X+10, Y-150, 10, 10);

    //snowman's nose - made to look like it wa made with an orange carrot
    stroke(205, 133, 0);
    strokeCap(ROUND);
    strokeWeight(3);
    line(X, Y-145, X+10, Y-135);

    //snowman's smile - made to look like it was made with black rocks
    noStroke();
    fill(0);
    ellipse(X-15, Y-130, 8, 8);
    ellipse(X-5, Y-125, 8, 8);
    ellipse(X+5, Y-125, 8, 8);
    ellipse(X+15, Y-130, 8, 8);

    //SNOWMAN'S HAT

    fill(0);
    rect(X-40, Y-180, 80, 10);
    rect(X-25, Y-220, 50, 40);
  }
}

class Snowflake { //define snowflake class and declare variables
  color c;
  float xpos;
  float ypos;
  float yspeed;

  Snowflake(color c_, float xpos_, float ypos_, float yspeed_) { //constructor for snowflake 
    c=c_;
    xpos = xpos_;
    ypos = ypos_;
    yspeed = yspeed_;
  }

  void display () { //function to display snowflakes
    ellipseMode(CENTER);
    fill(255);
    stroke(255);
    ellipse(xpos, ypos, 10, 20); //snowflake
  }

  void fall() { //makes snow fall from sky
    ypos = ypos + yspeed*10; //speed of snow falling
    if (ypos > height ) {
      ypos = 0;
    }
  }
}

class Cloud { //define cloud class and declare variables
  color c;
  float x;
  float y;
  float xspeed;

  Cloud(color c_, float x_, float y_, float xspeed_) { //constuctor for cloud clusters
    c=c_;
    x = x_;
    y = y_;
    xspeed = xspeed_;
  }

  void display() { //function to display clouds
    stroke(240);
    fill(255);
    //cloud cluster
    ellipse(x, y, 80, 30);
    ellipse(x+60, y, 80, 30);
    ellipse(x+120, y, 80, 30);
    ellipse(x+180, y, 80, 30);
    ellipse(x+240, y, 80, 30);
    ellipse(x-30, y+15, 80, 30);
    ellipse(x+30, y+15, 80, 30);
    ellipse(x+90, y+15, 80, 30);
    ellipse(x+150, y+15, 80, 30);
    ellipse(x+210, y+15, 80, 30);
    ellipse(x+30, y+55, 80, 30);
    ellipse(x+90, y+55, 80, 30);
    ellipse(x+150, y+55, 80, 30);
    ellipse(x+210, y+55, 80, 30);
  }


  void move () { //function to allow clouds move
    x = x + xspeed; //speed clouds move
    if (x > width ) {
      x = 0;
    }
  }
}
