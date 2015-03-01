
PImage pear;
PImage apple;
PImage banana;
PImage orange;

int op1 = 90;
int op2 = 90;
int op3 = 90;
int op4 = 90;

int i = 0;
int ii = 1;
int speedup = 30;
int timer = -30;

int b = 1;
int a = 2;
int o = 3;
int p = 4;
int v = 0;

int[] fruitList = { b, a, o, p };

int go=0;


void setup() {
  frameRate(20);
  background(255);
  size(600, 600);
  // Make a new instance of a PImage by loading an image file
  pear = loadImage("pear.jpg");
  pear.resize(200, 200);
  apple = loadImage("apple.jpg");
  apple.resize(200, 200);
  banana = loadImage("banana.jpg");
  banana.resize(200, 200);
  orange = loadImage("orange.jpg");
  orange.resize(200, 200);
}

void draw() {

  background(255);
  image(pear, height/12, width/12);
  image(orange, height/1.72, width/12);
  image(apple, height/12, width/1.72);
  image(banana, height/1.72, width/1.72);
  noStroke();

  i+=1;
  //print(i, " ");
  timer+=1;

  //if the timer-counter gets over 30, game over
  if (timer>=speedup) {
    //print (" GAMEOVER on time ");
    //print (" ii: ", ii);
    //print (" speedup: ", speedup);
    //print (" timer: ", timer);
    //print ("score: ", 30-speedup);
    gameover();
  }


  //early game
  if (i<300) { 
    //every 30 frames, request a new fruit
    if (i%30==0) {
      //requested fruit: v
      v=fruitList[ (int) random(fruitList.length) ];
      op1 = 90;
      op2 = 90;
      op3 = 90;
      op4 = 90;
      timer=0;
      print("request ");
    }
  } else if (i==300) {
    timer=0;
  } else { //late game
    ii+=1;
    if (ii%speedup==0) {
      //requested fruit: v
      v=fruitList[ (int) random(fruitList.length) ];
      op1 = 90;
      op2 = 90;
      op3 = 90;
      op4 = 90;
      timer=0;
      speedup-=1;
      ii=0;
      print("request ");
    }
  }

  //coloring the requested fruit
  if (go==0) {
    if (v == p) {
      fill(200, 0, 0, op1);
      rect(0, 0, 300, 300);
    }
    if (v == b) {
      fill(200, 0, 0, op2);
      rect(300, 300, 300, 300);
    }
    if (v == a) {
      fill(200, 0, 0, op3);
      rect(0, 300, 300, 300);
    }
    if (v == o) {
      fill(200, 0, 0, op4);
      rect(300, 0, 300, 300);
    }
  }
}


//decoloring fruit; gameover on key press

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) { //pear
      if (v==p) {
        op1 = 0;
        op2 = 90;
        op3 = 90;
        op4 = 90; 
        timer=0;
        print ("pressed ");
      } else {
        gameover();
      }
    } else if (keyCode == DOWN) { //banana
      if (v==b) {
        op1 = 90;
        op2 = 0;
        op3 = 90;
        op4 = 90; 
        timer=0;
        print ("pressed ");
      } else {
        gameover();
      }
    } else if (keyCode == LEFT) { //apple
      if (v==a) {
        op1 = 90;
        op2 = 90;
        op3 = 0;
        op4 = 90; 
        timer=0;
        print ("pressed ");
      } else {
        gameover();
      }
    } else if (keyCode == RIGHT) { //orange
      if (v==o) {
        op1 = 90;
        op2 = 90;
        op3 = 90;
        op4 = 0; 
        timer=0;
        print ("pressed ");
      } else {
        gameover();
      }
    } else {
      gameover();
    }
  }
  if (key == ' ') {
    op1 = 90;
    op2 = 90;
    op3 = 90;
    op4 = 90;
    v=0;

    i = 0;
    ii = 1;
    speedup = 30;
    timer = -30;
    
    go=0;
    loop();
  }
}

void resetop() {
  op1 = 0;
  op2 = 0;
  op3 = 0;
  op4 = 0;
}



//gameover
void gameover() {
  go=1;
  noLoop();
  fill(0);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  ellipse(200, 200, 40, 40);
  ellipse(400, 200, 40, 40);
  arc(300, 400, 200, 200, PI, TWO_PI);
  fill(0);
  arc(300, 400, 150, 150, PI, TWO_PI);
  fill(255, 0, 0);
  textSize(34);
  fill(255, 0, 0);
  
  text("Noooooooooo!!", 180, 70);
  textSize(28);
  text("Game over.", 80, 500); 
  text("Hit reset to play again.", 180, 550);
  
}


