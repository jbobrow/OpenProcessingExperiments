
PImage field;
PFont font;

ArrayList<Ball> balls;

int Storedtime;
int intervall = 400; 

int Width=100;
int Height=10;

int points=0;
int highscore=0;

int count=0;

//game variables
boolean gameStart = false;


void setup() {
  size(500, 500); 
  noStroke();

  //intialize ball arraylist
  balls=new ArrayList();

  Storedtime=0; 
  field=loadImage("field.jpg"); 
  field.resize(width, height); 
  frameRate(90); 
  imageMode(CENTER); 
  font=loadFont("SquaresBold-36.vlw");
  count=0;
}



void draw() {
  image(field, width/2, height/2, width, height);

  if (gameStart == false) {
    textAlign(CENTER);
    textSize(28);
    text("Press any key to start", width/2, height/2);
  }
  
  if (gameStart == true) {
    int timecounter=millis()-Storedtime; 
    if (timecounter>intervall) { 
      createBall();
      Storedtime=millis();
    } 

    for (int x=0; x<balls.size (); x++) {
      Ball ball=(Ball) balls.get(x);
      ball.update();
      ball.drawBall();
      ball.collision();
    }

    rect(mouseX, 430, 100, 10);
    fill(255, 0, 0);

    fill(0, 0, 0);
    textAlign(LEFT, TOP);
    textFont(font, 20);
    text("Score:", 10, 40);
    text("Highscore:", 280, 40);
    text(points, 220, 40);
    text(highscore, 450, 40);


    if (count > 10) {
      textAlign(CENTER);
      textSize(28);
      text("GAME OVER", width/2, height/2);
      //gameStart = false;
    }
  }
    //if ((key =='c') || (key == 'C')) {
      
  }
    

  void createBall() {
  balls.add(new Ball());
}

void keyPressed(){
  gameStart = true;
}

class Ball {

  int radius;
  float posX;
  float posY;
  float speed;
  PImage myImage;

  Ball() {
    posX = int(random(width));
    posY = 0;
    radius = 40;
    speed = random(1, 4);
    myImage = loadImage("ball.png");
  }

  public void drawBall() {
    image(myImage, posX, posY, radius, radius);
  }

  public void update() {
    posY += speed;
  }

  public void collision() {
    if (posY + radius/2 < 430 + 10 && posY + radius/2 >= 430 && posX > mouseX && posX < mouseX + 100) { 
      balls.remove(this); 
      points += 1;
    } else if(posY + radius/2 > 430 + 10){
      balls.remove(this);
      count += 1;
      println(count);
    }
    if (points > highscore) highscore = points;
  }
}



