
int playerscore = 0;
int cpuscore = 0;
float pluckspeed = 5;
float cpupaddleSpeed = 7.5;
int lastlevel = 5;
Paddle paddle;
Paddle cpupaddle;
Pluck  pluck;
boolean keypress = false;
boolean endgame = false;

void setup() {
  size(550, 400);
  smooth(); 
  cpupaddle = new Paddle(20, 200);
  paddle = new Paddle(530, 200);
  pluck = new Pluck();
}

void draw() {
  //table
  background(0);
  stroke(255);
  strokeWeight(6);
  line(width/2, 0, width/2, height);

  //show score
  fill(0, 0, 255);
  textSize(50);
  text(playerscore, width/2+20, 50);
  fill(255, 0, 0);
  text(cpuscore, width/2-50, 50);

  //displays
  paddle.display();
  cpupaddle.display();
  pluck.display();
  if (endgame) {   // if game ends
    textSize(20);
    fill(255);
    text("Press Enter Key", width/2+width/4-80, height/2+135);
    text("To Start Again", width/2+width/4-80, height/2+160);
    textSize(50);
    text("End\nof\nGame", width/2-width/4 +200, height/2-80);
    whowins();
  } 
  else {  // if game not ends
    if (keypress == true) {
      pluck.move(pluckspeed);
      paddle.moveY(mouseY);
      cpupaddle.cpuAi(pluck);
      cpupaddle.intersectRight(pluck);
       
      
      paddle.intersectLeft(pluck);
      pluck.checkGoal();
    } 
    else {
      textSize(20);
      fill(255);
      if (cpuscore >=lastlevel || playerscore >=lastlevel) {
        endgame = true;
      } 
      else {
        text("Press Enter Key", width/2+width/4-80, height/2+25);
        text("To Start", width/2+width/4-40, height/2+50);
      }
    }
  }
} 

void whowins() {  //display on screen who wins and who loses.
  if (cpuscore >= lastlevel || playerscore >= lastlevel) {
    textSize(30);

    if (cpuscore > playerscore) {
      fill(0, 255, 0, 180);
      text("Cpu Wins", width/4-80, 50); 
      fill(255, 0, 0, 180);
      text("Player Lose", width/2+80, 50);
    } 
    else {
      fill(255, 0, 0, 180);
      text("Cpu Lose", width/4-80, 50); 
      fill(0, 255, 0, 180);
      text("Player Wins", width/2+80, 50);
    }
  }
}

//start & pause
void keyPressed() {
  pluckspeed = 5;
  if ( key == ENTER) {
    if (endgame) {
      endgame = false;
      cpuscore = 0;
      playerscore = 0;
    } 
    else {
      keypress = !keypress;
    }
  }
}

class Paddle {
  int x;
  int y;
  int w = 20;
  int h = 80;
  Paddle(int tx, int ty) {
    x = tx;
    y = ty;
  }  

  void display() {
    rectMode(CENTER);
    fill(255);
    noStroke();
    rect(x, y, w, h);
  }

  void moveY(int ty) {
    y = ty;
    //boundries
    if (y > height-h/2) {
      y = height-h/2;
    } 
    else if ( y < 0 + h/2) {
      y = h/2;
    }
  }

  void cpuAi(Pluck p) {
    if (p.x <= width/2) {
      if (y < p.y-p.r*2) {
        y +=cpupaddleSpeed;
      } 
      else if (y > p.y +p.r*2) {
        y -= cpupaddleSpeed;
      }
    } 
    else {
      if (y < height/2) {
        y+=cpupaddleSpeed;
        ;
      } 
      if ( y > height/2) {
        y-=cpupaddleSpeed;
      }
    }
  }

  void intersectLeft(Pluck p) {
    if (p.x > x-w/2 && (p.y > y - h/2 && p.y < y + h/2)) {
      p.directionX = -p.directionX;
      pluckspeed+=0.3;
      println(pluckspeed);
    }
  }

  void intersectRight(Pluck p) {
    if (p.x < x+w/2 && (p.y > y - h/2 && p.y < y + h/2)) {
      p.directionX = -p.directionX;
      pluckspeed+=0.3;
      println(pluckspeed);
    }
  }
}

class Pluck {
  int x = width/2;
  int y = height/2;
  int r = 7;  //radius
  float speed;
  int directionX = 1;
  int directionY = 1;
  Pluck() {
  }  

  void display() {
    noStroke();
    fill(#00ff00);
    rect(x, y, r*2, r*2);
  }

  void move(float tspeed) {
    speed = tspeed;
    x += speed * directionX;
    y += speed * directionY;
    //boundries
    if ( y < r) {
      y = r;
      directionY = -directionY;
    } 
    else if ( y > height-r) {
      y = height-r;
      directionY = -directionY;
    }
  }


  void checkGoal() {
    if ( x > width+r) {
      x = width/2;
      y = height/2;
      keypress = false;
      cpuscore = cpuscore+1;
      directionX = -directionX;
      directionY = -directionY;
      println("Score for CPU!");
    } 
    else if (x < -r) {
      x = width/2;
      y = height/2;
      keypress = false;
      playerscore = playerscore+1;
      directionX = -directionX;
      directionY = -directionY;
      println("Score for Player");
    }
  }
}



