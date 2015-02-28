
float x = 100, y = 100;
float xSpeed = random(2, 4);
float ySpeed = random(2, 4);
int xDir=1;
int yDir=1;
int i=0;
boolean pause = false;

Timer timer;
void setup() {

  size(300, 300);
  noStroke();
  timer = new Timer(1000);
  timer.start();
}


void draw() {
  if (timer.isFinished()) {
    i++;
    timer.start();
  }
  if (pause) return;

  background(0);
  ellipse(x, y, 10, 10);
  rect(mouseX - 10, mouseY-10, 20, 20);


  textSize(32);
  text(int(i),240,30);
  x = x + xSpeed*xDir;
  y = y + ySpeed*yDir;

  if (x > width-5 || x < 5) {
    xSpeed+=0.3;
    xDir*=-1;
  }

  if (y > height-5 || y < 5) {
    ySpeed+=0.3;

    yDir*=-1;
  }

  if (x > mouseX-10 && x<mouseX+10 && y > mouseY-10 && y<mouseY+10)
  {
    pause = true;
    println("you got hit!");
    textSize(32);
    text("You got hit!", 10, 30); 
    //fill(0, 102, 153);
    
  }
}//

void keyPressed() {
  pause = true;
  println("mouseX:"+int(mouseX));
  println("x:"+int(x));
}

void mousePressed(){
  if (pause == true){
    i=0;
    xSpeed = random(2, 4);
    ySpeed = random(2, 4);
    pause = false;
    setup();
  }
}


