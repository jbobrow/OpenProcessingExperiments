
PFont metro;
PFont hand;
snake test;
food food1;

PImage squa;
PImage tria;
PImage circ;
PImage cursor;

int highScore;

float startx, y;
float r;
float xspeed;
int counter =0; //counts number of times 
int wordL = 6;
int pointer = 0;
String[] word = {
  "S", "Q", "U", "A", "R", "E"
};






void setup() {
  size(1024, 768);
  frameRate(15);
  test = new snake();
  food1 = new food();

  metro = loadFont("MetroMediumLT-Two-48.vlw");
  hand = loadFont("FFErikrighthand-Caps-48.vlw");

  PImage[] images = new PImage[4];
  images[0] = circ;
  images[1] = squa;
  images[2] = tria;
  images[3] = cursor;
  circ = loadImage("shapes-01.png");
  squa = loadImage("GrabbyGardenGame_noSeeds-02.jpg");
  tria = loadImage("shapes-03.png");
  cursor = loadImage("GAME_DESIGN-14.png");



  rectMode(CENTER);
  textAlign(CENTER, CENTER);


  highScore = 0;
}



void draw() {

  background(250, 250, 250);
  image(squa, 0, 0, 1024, 768);
  drawScoreboard();

  test.move();
  test.display();
  food1.display();




  if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sidelen ) {
    pointer = pointer+1;
    stroke(random(0, 255));
    food1.reset();
    test.addLink();
  }


  if (test.len > highScore) {
    highScore= test.len;
  }

  if (pointer >= 6) {
    textFont(metro, 20);
    background(random(0, 255), random(0, 255), random(0, 255));
    text("SQUARE COMPLETE!", width/2, height/2);
  }
}




void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      test.dir = "left";
    }
    if (keyCode == RIGHT) {
      test.dir = "right";
    }
    if (keyCode == UP) {
      test.dir = "up";
    }
    if (keyCode == DOWN) {
      test.dir = "down";
    }
  }
}



void drawScoreboard() {
  // All of the scode for code and title



  textFont(metro, 30);
  fill(0);
  //text( "Grabby Farm Game", width/2, height/4-100);




  // draw scoreboard

  strokeWeight(3);
  stroke(179, 140, 198);
  fill(255, 50);
  // rect(90, 70, width-200, height-100);
  fill(random(0, RGB));
  textFont(metro, 20);
  text( "Score:" + test.len, width-150, height-100);

  fill(118, 22, 167);
  textSize(17);
  text( "High Score: " + highScore, width-150, height-75);
}





class food {


  // define varibles
  float xpos, ypos;
  int[] axpos, aypos;



  //  for (int i = 0; i< 6; i++) {
  // for (int l = 0; l<6;l++) {
  // text("S", axpos[i], aypos[i]);
  // ellipse(axpos[i], aypos[i], 20, 20);

  //  xpos = axpos[i]; 
  // ypos = aypos[i];


  food() {

    axpos = new int[7];
    axpos[0] = 360;   //345; 
    axpos[1] = 656;    //670;
    axpos[2] = 656;    //670;
    axpos[3] = 360;   //345; 
    axpos[4] = 512;    //670;
    axpos[5] = 512;    //670;
    axpos[6] = 512;    //670;

    aypos = new int[7];
    aypos[0] = 265;   //137;
    aypos[1] = 265;   //137;
    aypos[2] = 566;   //462;
    aypos[3] = 566;   //137;
    aypos[4] = 265;   //137;
    aypos[5] = 566;   //462;
    aypos[6] = 566;   //462;

    xpos = axpos[pointer];
    ypos = aypos[pointer];
    println(axpos[pointer]);




    // xpos = random(100, width - 100);
    // ypos = random(100, height - 100);
  }


  void display() {

    textFont(metro, 18);
    fill(246, 235, 19);
    text(word[pointer], xpos, ypos, 17, 17);

    //text("E", xpos2, ypos2, 17, 17);
  }


  void reset() {
    // pointer = pointer+1;
    xpos = axpos[pointer];
    ypos = aypos[pointer];
  }
}

class snake {

  //define varibles
  int len;
  float sidelen;
  String dir;
  ArrayList <Float> xpos, ypos ;

  // constructor
  snake() {
    len = 1;
    sidelen = 17;
    dir = "right";
    xpos = new ArrayList();
    ypos = new ArrayList();
    xpos.add( random(width) );
    ypos.add( random(height) );
  }

  // functions


  void move() {
    for (int i = len - 1; i > 0; i = i -1 ) {
      xpos.set(i, xpos.get(i - 1));
      ypos.set(i, ypos.get(i - 1));
    }
    if (dir == "left") {
      xpos.set(0, xpos.get(0) - sidelen);
    }
    if (dir == "right") {
      xpos.set(0, xpos.get(0) + sidelen);
    }

    if (dir == "up") {
      ypos.set(0, ypos.get(0) - sidelen);
    }

    if (dir == "down") {
      ypos.set(0, ypos.get(0) + sidelen);
    }
    xpos.set(0, (xpos.get(0) + width) % width);
    ypos.set(0, (ypos.get(0) + height) % height);



    /*  // check if hit itself and if so cut off the tail
     if( checkHit() == true){
     len = 1;
     float xtemp = xpos.get(0);
     float ytemp = ypos.get(0);
     xpos.clear();
     ypos.clear();
     xpos.add(xtemp);
     ypos.add(ytemp);
     }*/
  }


  //THE SNAKEEEE 
  void display() {
    for (int i = 0; i <len; i++) {
      textFont(metro, 18);
      stroke(246, 235, 19);  
      fill(246, 235, 19, map(i-1, 0, len-1, 250, 50));
      text(word[pointer], xpos.get(i), ypos.get(i), sidelen, sidelen);
      // text("e", xpos2.get(i), ypos2.get(i), sidelen, sidelen);
      //  line(xpos,20,20,20);
    }
  }


  void addLink() {
    xpos.add( xpos.get(len-1) + sidelen);
    ypos.add( ypos.get(len-1) + sidelen);
    // println(xpos.get(len-1));

    len++;
  }

  boolean checkHit() {
    for (int i = 1; i < len; i++) {
      if ( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sidelen) {

        return true;
      }
    }
    return false;
  }
}



