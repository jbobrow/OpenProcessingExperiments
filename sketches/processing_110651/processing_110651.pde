
float diameter = 50;
float y = diameter;
float directiony = 3;
float x = diameter;
float directionx = 5;
int count = 0;
int losercount = 0;

void setup() {
  size(800, 700);
  smooth();
}

void draw() {
  background(0);

  ellipse(x, y, diameter, diameter);

  rectMode(CENTER);
  rect(mouseX, height-25, 100, 10);
  
  y += directiony;
  x += directionx;
  if (y > height-diameter/2) {
    directiony = -directiony;
    println("YOU MISSED UGH");
    fill(random(255), random(255), random(255));
    losercount ++;
    println(losercount);
  } 
  else if (y < diameter/2) {
    directiony = -directiony;
    fill(random(255), random(255), random(255));
  }
  if (x > width-diameter/2) {
    directionx = -directionx;
      println("righty tighty.");
      fill(random(255), random(255), random(255));
  } 
  else if (x < diameter/2) {
    directionx = -directionx;
    x += directionx;
      println("lefty loosey.");
      fill(random(255), random(255), random(255));
  }
  if ((x > mouseX - 100) && (x < mouseX + 100) && (y == height-50)) {
    directiony = -directiony;
    println("IT HIT IT HIT");
    fill(random(255), random(255), random(255));
    count ++;
    println(count);
  }
  if (count == 5) {
    noLoop();
    textSize(50);
    textAlign(CENTER);
    text("YOU WIN", width/2, height/2);
  }
  if (losercount == 5) {
    noLoop();
    textSize(50);
    textAlign(CENTER);
    text("YOU LOSE", width/2, height/2);
  }
}
