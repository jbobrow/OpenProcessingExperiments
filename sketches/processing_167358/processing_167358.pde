
ArrayList<Integer> snakex = new ArrayList<Integer>();
ArrayList<Integer> snakey = new ArrayList<Integer>();
PImage snake;
PImage snakeover;
PImage grass;
PImage apple;
PFont font;
PFont font1;
int score = 0;
int snakespeed = 3;
boolean gameover = false;
boolean spacePressed = true;
int applex = 10;
int appley = 10;
int boardwidth = 25;
int boardheight = 20; 
int blocksize = 20;
int direction = 2;

int[] directionx = {
  0, 0, 1, -1
}
, directiony = {
  1, -1, 0, 0
}; 

void setup() {
  size(500, 400);
  font = loadFont("VCROSDMono-48.vlw");
  font1 = loadFont("04b30-48.vlw");

  //snake starting position
  snakex.add(5);
  snakey.add(5);

  //images
  apple = loadImage("appleguy.png");
  grass = loadImage("background.png");
  snake = loadImage("snakeguy.png");
  snakeover = loadImage("gameover.png");
}

void draw() { 
  background(grass);

  //snake
  for (int i = 0; i < snakex.size (); i++) {
    //    rect(snakex.get(i) * blocksize, snakey.get(i) * blocksize, blocksize, blocksize);
    image(snake, snakex.get(i) * blocksize, snakey.get(i) * blocksize);

    //speed
    //    snakex.get(0) += snakespeed + directionx[1];
    //    snakey.get(0) += snakespeed + directiony[1];
  }

  if (!gameover) {

    fill(255);
    textFont(font, 30);
    // textSize(30);
    text("SCORE:"+score, 10, 30);

    //apple
    // fill(255, 0, 0);
    // rect(applex * blocksize, appley * blocksize, blocksize, blocksize);   
    image(apple, applex * blocksize, appley * blocksize); 


    //adds blocks to end of snake
    if (frameCount%5 == 0) {
      snakex.add(0, snakex.get(0) + directionx[direction]);
      snakey.add(0, snakey.get(0) + directiony[direction]);


      //if snake hits top
      if (snakey.get(0) >= boardheight) {
        gameover = true;
      }

      //if snake hits bottom of screen
      if (snakey.get(0) < 0) {
        gameover =true;
      }

      //if snake hits left side of screen
      if (snakex.get(0) < 0) {
        gameover = true;
      }

      //if snake hits right side of screen
      if (snakex.get(0) >= boardwidth) {
        gameover = true;
      }


      //if snake touches tail
      for (int i = 1; i < snakex.size (); i++)
        if (snakex.get(0) == snakex.get(i) && snakey.get(0) == snakey.get(i))
          gameover = true;

      //snake eats apple, new apple appears
      if (snakex.get(0) == applex && snakey.get(0) == appley) {
        applex = (int)random(0, boardwidth);
        appley = (int)random(0, boardheight);

        score++;
        //to increase speed 
        //directiony += (snakespeed + 1);
        //directionx += (snakespeed + 1);
      } else {

        //removes tail blocks
        snakex.remove(snakex.size()-1);
        snakey.remove(snakey.size()-1);
      }
    }
  } else {

    //gameover screen
    image(snakeover, 150, 80);
    fill(255);
    //textSize(30);
    textFont(font1, 50);
    text("GAME OVER", 60, 150);

    textFont(font, 30);
    text("SCORE:"+score, 200, height/2 + 33);

    textSize(25);
    text("PRESS SPACE TO RESTART", 100, height/2 + 60);

    if (keyPressed && key == ' ') {

      //clears array list, snake will have one block again
      snakex.clear();
      snakey.clear();

      //snake goes back to starting point
      snakex.add(7);
      snakey.add(7);

      gameover = false;
      score = 0;
    }
  }
}

//controls
void keyPressed() {
  if (key == CODED)
  {
    int newdirection = keyCode == DOWN ? 0 : (keyCode == UP ? 1 : (keyCode == RIGHT ? 2 : (keyCode == LEFT ? 3 : -1)));
    if (newdirection != -1) 
      direction = newdirection;
  }
}

