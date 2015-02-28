
int score = 0;
int lives = 3;
final int MOVE_INCREMENT = 5;
ArrayList<Stars> stars = new ArrayList<Stars>();
ArrayList<Comets> comets = new ArrayList<Comets>();
Goods bucket = new Goods();
boolean leftPressed = false;
boolean rightPressed = false;
boolean start = true;
boolean play = false;
boolean end = false;
int create = 0;

void starting() {
  background(0);
  fill(0, 234, 234);
  textSize(31.5);
  text("Catch A Falling Star", 105, 200);
  text(" ");
  textSize(22);
  text("Press Enter to start.", 150, 300);
  textSize(16);
  text("Use the left and right arrow keys", 125, 375);
  text("to move the bucket.", 170, 400);

  if ( keyCode == ENTER ) {
    play = true;
    start = false;
  }
}

void playing() {
  background(0); 
  bucket.appear();
  score();
  lives();
  move();
  bucket.move();
  if ( create % 50 == 0) {
    stars.add(new Stars());
  }
  if ( create % 300 == 0 ) {
    comets.add(new Comets());
  }

  for ( Stars now : stars ) {
    now.show();
  }
  for ( Comets c : comets ) {
    c.show();
  }
  if ( lives == 0 ) {
    end = true;
    play = false;
  }
}

void ending() {
  //System.out.println("HI");
  background(0);
  fill(0, 234, 234);
  textSize(25);
  text("Your total score is " + score, 115, 230);
  text(" ");
  textSize(20);
  text("Press Enter to start a new game.", 90, 325);

  if ( keyCode == ENTER) {
    play = true;
    end = false;
    score = 0;
    lives = 3;
  }
}
void setup() {
  size(500, 600);
  smooth();
}

void draw() {
  create++;
  move();
  bucket.move();
  if ( start == true) {
    starting();
  }

  if ( play == true ) {
    playing();

    for ( int i = 0; i < stars.size(); i++ ) {
      Stars using = stars.get(i);
      //System.out.println("Star " + using);
      if ( using.y + 20 < 0 || using.y > 600 ) {
        break;
      }
      //System.out.println("running second?");
      if ( using.hit() == true ) {
        //System.out.println("runninvfgesg?");
        //System.out.println("x = "+ using.x + "   y = " + using.y);
        //System.out.println("BUCKET    x = "+ bucket.x + "   y = " + (bucket.x + 100));
        if (((using.x + 20 >= bucket.x) && (using.x + 20 <= bucket.x + 100))  || ((using.x - 20 >= bucket.x) && (using.x - 20 <= bucket.x + 100))) {
          //System.out.println("STAR GOT HIT");
          score++;
          stars.remove(i);
          break;
        }
      }
      if ( using.gone() == true ) {
        lives --;
        if ( score == 0 ) {
        }
        else {
          score -= 5;
        }
        stars.remove(i);
        i--;
        break;
      }
      if ( score < 0 ) {
        score = 0;
      }
    }

    for ( int a = 0; a < comets.size(); a++) {
      Comets c = comets.get(a);
      if ( c.y >= 600 ) {
        comets.remove(a);
        a--;
      }
      if ( c.hit() == true ) {
        int bottomC = c.x;
        int end = c.x + 80;
        int touch = 0;
        if ( bottomC > (bucket.x + 100) || end < bucket.x ) {
          //System.out.println("Comet out of range");
          break;
        }
        else {
          lives--;
          score -= 15;
          //System.out.println("Removing life and score");
        }
        /*while ( touch == 0 && bottomC <= end ) {
         System.out.println("Touch?");
         System.out.println("BUCKET " + bucket.x + " - " + (bucket.x + 100));
         System.out.println("COMET " + bottomC);
         if ( bottomC >= bucket.x && bottomC <= bucket.x + 100 ) {
         System.out.println("Yes, TOUCHING!");
         touch++;
         }
         bottomC++;
         }
         
         if ( touch == 1 ) {
         lives--;
         score -= 15;
         System.out.println("Removing life and score");
         }
         */
      }
      if ( score < 0 ) {
        score = 0;
      }
    }
  }
  if ( end == true ) {
    ending();
    for ( int s = (stars.size() - 1); s >= 0; s-- ) {
      stars.remove(s);
    }
    if ( comets.size() > 0 ) {

      for ( int c = (comets.size() - 1); c >= 0; c-- ) {
        comets.remove(c);
      }
    }
  }
}

void score() {
  fill(255);
  textSize(15);
  text("Score: " + score, 230, 15);
}

void lives() {
  int d = 400;
  fill(255);
  textSize(15);
  text("Lives: ", 350, 15);
  for ( int l = 0; l < lives; l++ ) {
    fill( 139, 69, 19 );
    stroke(139, 69, 19);
    quad(d, 5, d + 15, 5, d + 11, 15, d + 4, 15);
    d += 20;
  }
}

void move() {
  if ( leftPressed ) {
    bucket.x -= MOVE_INCREMENT;
  }
  if ( rightPressed ) {
    bucket.x += MOVE_INCREMENT;
  }
} 
void keyPressed() {
  //System.out.println("Working?!");
  if ( keyCode == LEFT ) {
    leftPressed = true;
  }
  if ( keyCode == RIGHT ) {
    rightPressed = true;
  }
} 

void keyReleased() {
  //System.out.println("Stop!");
  if ( keyCode == LEFT ) {
    leftPressed = false;
  }
  if ( keyCode == RIGHT ) {
    rightPressed = false;
  }
}

class Goods {
  int x = 200;

  void appear() {
    fill(139, 69, 19);
    stroke(139, 69, 19);
    smooth();
    quad(x, 500, x + 100, 500, x + 80, 575, x + 20, 575);
  }

  void move() {
    //System.out.println("Hello");
    if ( x >= 400) {
      x = 400;
    }
    if ( x <= 0 ) {
      x = 0;
    }
  }
}
public class Stars {
  PVector star;
  PVector movingS;
  int x, y;
  float xStar, yStar;
  public Stars() {
    int sx = (int)(Math.random() * 500);
    star = new PVector(sx, 0);
    x = (int)(star.x);
    y = (int)(star.y);
    int ty = (int)(Math.random() * 5) + 5;
    movingS = new PVector(0, ty);
  }
  void show() {
    //took shape from Red Star on OpenProcessing
    beginShape();
    for (int i = 0; i <= 5; i++) {
      fill(255, 255, 0);
      stroke(255, 255, 0);
      yStar = sin(radians(i*144.5)) * 20 + star.y;
      xStar = cos(radians(i*144.5)) * 20 + star.x;
      vertex(xStar, yStar);
    }
    endShape();

    star.add(movingS);
    x = (int)(star.x);
    y = (int)(star.y);
    //System.out.println(" x " + x);
    //System.out.println(" y " + y);
  }
  boolean hit() {
    //System.out.println("running hit?");
    if ( y >= 490 && y <= 510 ) {
      //System.out.println(" RUNNING HIT TRUE");
      return true;
    }
    return false;
  }
  boolean gone() {
    if ( y + 20 >= 550 ) {
      return true;
    }
    return false;
  }
}

public class Comets {
  PVector ball;
  PVector moving;
  int x, y;
  public Comets() {
    int ax = (int)(Math.random() * 500);
    ball = new PVector(ax, 0);
    int by = (int)(Math.random() * 5) + 3;
    moving = new PVector(0, by);
  }
  void show() {
    x = (int)(ball.x);
    y = (int)(ball.y);
    fill(84, 84, 84);
    stroke(84, 84, 84);
    ellipse(x, y, 80, 80);

    ball.add(moving);
  }

  boolean hit() {
    if ( y + 80 == 500 ) {
      return true;
    }
    return false;
  }
}


