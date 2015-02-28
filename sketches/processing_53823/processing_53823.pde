
/*  This is an entry for bus-tops contest on OpenProcessing.org.
 *  Bus-Tops (http://bus-tops.com) is a public art project
 *  in London where they have placed 30 monochromatic red LED screens
 *  on the roofs of bus shelters across the city. Sketches from
 *  OpenProcessing Collections will be selected to be exhibited
 *  on these screens.
 *  For contest information and example sketches and submission:
 *  http://www.openprocessing.org/collections/?collectionID=1337
 *
 *  @name Bus_pong
 *  @credit Julien "juego" Deswaef
 *  @url http://xuv.be/static/processing/Bus_pong 
 *  @created 2012-02-28
 *
 */

Pong pong;

int pixel = 10;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);

  pong = new Pong();
}

void draw() {
  background(0); //keep background black (LEDs are brightness based)
  //LEDs are on the scale of red
  fill(255, 0, 0);   //LEDs are on the scale of red

  pong.update();
  pong.draw();
}

class Ball {
  PVector pos;
  PVector speed;
  boolean out = false;

  Ball() {
    pos = new PVector(0, 0);
    speed = new PVector(random(-15., 15.), random(-15., 15.)); 
    if ( abs(speed.x) < 4 ) {
      speed.x *= pixel;
    }
  }

  void move() {
    pos.add(speed);
  }

  void update() {
    this.move();
    if ( (pos.y >= height/2-pixel/2) || (pos.y <= pixel/2-height/2) ) {
      if (pos.y < 0) pos.y = pixel/2-height/2;
      if (pos.y > 0) pos.y = height/2-pixel/2;
      speed.y = -speed.y;
    }
  }
  void draw() {
    rectMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    rect(pos.x, pos.y, pixel, pixel);
  }
}

class Player {
  PVector pos;
  PVector speed;  
  float target;
  int score;

  Player(int x) {
    pos = new PVector(x, 0);
    speed = new PVector(0, 0);
  }

  void update(float t) {
    speed.y = (t - pos.y)/5;
    this.move();
  }

  private void move() {
    pos.add(speed);
    if ( (pos.y <= 2*pixel-height/2 ) || (pos.y >= height/2-2*pixel) ) { 
      if (pos.y < 0 ) pos.y=2*pixel-height/2;
      if (pos.y > 0 ) pos.y=height/2-2*pixel;
    }
  }

  void draw() {
    rectMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    rect(pos.x, pos.y, pixel, 4*pixel);
  }
}

class Pong {
  Player player1, player2;
  Ball ball;

  Pong() {
    ball = new Ball();
    player1 = new Player(2*pixel-width/2);
    player2 = new Player(width/2-2*pixel);
  }

  void update() {
    ball.update();

    // if ball is coming toward a player
    if ( ball.speed.x < 0) {
      player1.update(ball.pos.y);
      player2.update(0);
    } 
    else {
      player2.update(ball.pos.y);
      player1.update(0);
    }

    // if ball touches a player 1
    if ( ball.pos.x < player1.pos.x + pixel ) {
      if (!ball.out) {
        if ( ball.pos.y <= player1.pos.y+2*pixel && ball.pos.y >= player1.pos.y-2*pixel ) {
          ball.pos.x = player1.pos.x + pixel;
          ball.speed.x = - ball.speed.x*random(0.5, 1.5);
          ball.speed.y *= random(0.5, 2);
        } 
        else {
          ball.out = true;
        }
      }
    }

    //if ball touches player 2 
    if ( ball.pos.x > player2.pos.x - pixel ) {
      if (!ball.out) {
        if ( ball.pos.y <= player2.pos.y+2*pixel && ball.pos.y >= player2.pos.y-2*pixel ) {
          ball.pos.x = player2.pos.x - pixel;
          ball.speed.x = - ball.speed.x*random(0.5, 1.5);
          ball.speed.y *= random(0.5, 2);
        }
        else {
          ball.out = true;
        }
      }
    }

    // if ball passes a player
    if ( ball.pos.x < - width/2 ) {
      ball = new Ball();
      if (player2.score < 9) {
        player2.score++;
      } 
      else {
        this.newGame();
      }
    } 

    if ( ball.pos.x > width/2 ) {
      ball = new Ball();
      if (player1.score < 9) {
        player1.score++;
      } 
      else {
        this.newGame();
      }
    }
  }

  void draw() {
    pushMatrix();
    translate(width/2, height/2);
    drawCenter();
    drawScore();
    ball.draw(); 
    player1.draw();
    player2.draw();
    popMatrix();
  }

  private void newGame() { 
    ball = new Ball();
    player1 = new Player(2*pixel-width/2);
    player2 = new Player(width/2-2*pixel);
  }

  private void drawCenter() {
    for (int i = -height/2; i <= height/2; i++) {
      if (i%pixel == 0) {
        stroke(255, 0, 0);
        strokeWeight(2);
        line(0, i, 0, i+pixel/2);
      }
    }
  }

  private void drawScore() {
    //println("Player1: "  + player1.score + " - Player2: " + player2.score);
    drawNumber( -width/4, player1.score);
    drawNumber( width/4, player2.score);
  }



  private void drawNumber( float x, int n ) {
    pushMatrix();
    translate(x, -height/2+pixel);
    noFill();
    switch( n ) {
    case 0 :
      rectMode(CORNER);
      rect(0, 0, pixel/2, pixel);
      break;
    case 1 :
      line(pixel/2, 0, pixel/2, pixel); 
      break;
    case 2 :
      line(0, 0, pixel/2, 0);
      line(pixel/2, 0, pixel/2, pixel/2);
      line(pixel/2, pixel/2, 0, pixel/2);
      line(0, pixel/2, 0, pixel);
      line(0, pixel, pixel/2, pixel);
      break;
    case 3:
      line(0, 0, pixel/2, 0);
      line(pixel/2, 0, pixel/2, pixel);
      line(pixel/2, pixel, 0, pixel);
      line(pixel/2, pixel/2, 0, pixel/2);
      break;
    case 4:
      line(0, 0, 0, pixel/2);
      line(0, pixel/2, pixel/2, pixel/2);
      line(pixel/2, pixel/2, pixel/2, pixel);
      break;
    case 5:
      line(0, 0, pixel/2, 0);
      line(0, 0, 0, pixel/2);
      line(0, pixel/2, pixel/2, pixel/2);
      line(pixel/2, pixel/2, pixel/2, pixel);
      line(0, pixel, pixel/2, pixel);
      break;
    case 6:
      line(0, 0, 0, pixel);
      line(0, pixel/2, pixel/2, pixel/2);
      line(pixel/2, pixel/2, pixel/2, pixel);
      line(0, pixel, pixel/2, pixel);
      break;
    case 7:
      line(0, 0, pixel/2, 0);
      line(pixel/2, 0, pixel/2, pixel);
      break;
    case 8:
      line(0, 0, pixel/2, 0);
      line(0, pixel/2, pixel/2, pixel/2);
      line(0, pixel, pixel/2, pixel);
      line(0, 0, 0, pixel);
      line(pixel/2, 0, pixel/2, pixel);
      break;
    case 9:
      line(0, 0, pixel/2, 0);
      line(0, pixel/2, pixel/2, pixel/2);
      line(0, 0, 0, pixel/2);
      line(pixel/2, 0, pixel/2, pixel);
      break;
    }
    popMatrix();
  }
}


