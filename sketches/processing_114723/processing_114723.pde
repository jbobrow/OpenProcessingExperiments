
ArrayList <Ball> balls = new ArrayList<Ball>();
int totalball = 30;

//Ball[] balls = new Ball[30];
//int[] a = new int[10]


void setup() {
  size(600, 700);
  frameRate(100);


  for (int i = 0; i < totalball/3 ; i++ ) {
    balls.add(new Ball(50, 80, 80, 0+i*90, 0, 0.005, 15, i));
  }
  for (int i = totalball/3; i < totalball*2/3; i++ ) {
    balls.add(new Ball(150, 150, 150, 30+(i - totalball/3)*90, 0, 0.01, 25, i +totalball/3));
  }

  for (int i = totalball/3*2; i < totalball; i++ ) {
    balls.add(new Ball(80, 100, 100, 60+(i- totalball/3*2)*90, 0, 0.05, 28, i +totalball/3*2));
  }
}


void draw() {
  drawBgColor();


  for (int i=0; i < balls.size(); i++) {
    Ball ball = balls.get(i);

    ball.display();
    ball.beat();


    if (!ball.selected) {
      ball.move();
    }
  }

  int ballCount = balls.size();
  //println(ballCount);
  textSize(30);
  text(ballCount, width/2 -30, 650);
  
  textSize(18);
  text("balls", width/2 +20, 650);
}

void drawBgColor() {

  noStroke();

  fill(230, 230, 230, 80);
  rect(0, 0, width, 300);
  fill(255, 255, 255, 80);
  rect(0, 300, width, 600);

  fill(0);
  rect(0, 600, 600, 700);
}

void keyPressed() {
  if (key==' ') {
    for (int i = balls.size()/3; i < balls.size()/3*2; i++ ) {
      Ball ball = balls.get(i);
      ball.boundary = 580;
      ball.gravity = -random(.1, .5);
    }
  }
  else if (key=='a') {
    for (int i = 0; i < balls.size(); i++ ) {
      Ball ball = balls.get(i);
      ball.gravity = -random(.04, .08);
      ball.speed = -ball.speed;
      ball.gravity = -ball.gravity;
    }
  }
  
    if (key == 'c') {
    //  if(clickMe){

    for (int i = 0; i < balls.size(); i++ ) {
      int ballNum = 0;
      Ball ball = balls.get(i);
      ballNum = ball.tellID();

      if (ballNum >= 0) {
        //        println(ballNum);
        balls.remove(ballNum);
      }
    }
  }
}

void mousePressed() {

  //    balls[i].size = random(10, 50);
  for (int i = 0; i < balls.size()/3; i++ ) {
    Ball ball = balls.get(i);
    ball.clickMe();

    ball.gravity = random(0.01, 0.03);
  }
  for (int i = balls.size()/3; i < balls.size()/3*2; i++ ) {
    Ball ball = balls.get(i);
    ball.clickMe();

    ball.gravity = random(0.09, 0.12);
  }

  for (int i = balls.size()/3*2; i < balls.size(); i++ ) {
    Ball ball = balls.get(i);
    ball.clickMe();

    ball.gravity = random(.5, .7);

    //        print(ball.c1);
    //        print(" ");
    //        print(ball.c2);
    //        print(" ");
    //        println(ball.c3);
  }
}




void mouseDragged( ) {
  for (int i = 0; i < balls.size(); i++ ) {
    Ball ball = balls.get(i);
    if (ball.selected) {
      ball.x = mouseX;
      ball.y = mouseY;
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < balls.size(); i++ ) {
    Ball ball = balls.get(i);
    if (ball.selected = false) {

      ball.c3 = 255;
      ball.c2 = 255;
    }
  }
}
void keyReleased() {

  if (key==' ') {
    for (int i = balls.size()/3; i < balls.size()/3*2; i++ ) {
      Ball ball = balls.get(i);
      ball.boundary = 580;
      ball.speed = -ball.speed;

      ball.gravity = -ball.gravity;
    }
  } 
  else if (key == 'b') {
    balls.add(new Ball(255, 0, 0, mouseX, mouseY, 0.05, 25, balls.size()-1));
  }


}

class Ball {
  int c1;
  int c2;
  int c3;
  int id;
  float x;
  float y;
  float py;
  float size;
  float speed;
  float boundary;
  float gravity;
  float change;
  float max;
  float min;
  boolean selected;
  boolean beatOn;

  Ball(int _c1, int _c2, int _c3, float _x, float _y, float _gravity, float _size, int _id) {
    c1 = _c1;
    c2 = _c2;
    c3 = _c3;
    x = _x;
    y = _y;
    py = 0;
    size = _size;
    speed = 0;
    boundary = 300;
    gravity = _gravity;
    selected = false;
    change = 1;
    beatOn = false;
    max = _size +4;
    min = _size -4;
    id = _id;
  }

void clickMe(){
  
  if (dist(x, y, mouseX, mouseY) < size/2){
    selected = true;
//    return(true);
    beatOn = true;
  }
 else{
   selected = false;
//   return(false); 

  }

  
}

void beat(){
  if(beatOn == true){
    size = size +change;
//            println("hello");

}
if(size > max){
    change = -change;
//        println(size);

}
else if(size < min){
  change = -change;
}
}

  void move() {   
    y = y + speed;
    speed = speed + gravity;

    if (gravity > 0) {
      if ((y > boundary) && (py < boundary)) {
        speed = speed * -0.95;

      }
    }
    else if (gravity < 0) {
      if ((y < 0) && (py > 0)) {
        speed = speed *-0.95;
        println("");
      }
    }
    
   py = y;
  }

  void display() {
    noStroke();
//    colorMode(HSB, 100);
    fill(c1, c2, c3);
    ellipse(x, y, size, size);
  }
  
  int tellID(){
  
  if (dist(x, y, mouseX, mouseY) < size/2){
    return id;
  }
  else{
    return -1;
  }
  }
  
}
