
Robot skater = new Robot();
Timer timer;
Planet planet = new Planet();
Planet planet2 = new Planet();
Planet planet3 = new Planet();
Planet planet4 = new Planet();
Planet planet5 = new Planet();
Planet planet6 = new Planet();
Planet planet7 = new Planet();
Planet planet8 = new Planet();
Planet planet9 = new Planet();



//directional button pressed booleans start at false
boolean rightPress = false;
boolean leftPress = false;
boolean upPress = false;
boolean downPress = false;

//collected will help keep track of 
//what planets have been hit and the order
int collected;

int savedTime;

int gameState = 0;

String scoreDivvy;
String welcomeText;

PImage bg;
PImage title;
PImage gamestart;
PImage ice;

void setup() {
  size(800, 700);
  
  bg = loadImage("spacebg.png");
  title= loadImage("title.png");
  gamestart = loadImage("gamestart.png");
  ice = loadImage("iceice.png");

  //add in skater class and planets
  skater.build(100, 120);
  planet.materialize(670, 530, 1);
  planet2.materialize(260, 280, 2);
  planet3.materialize(350, 450, 3);
  planet4.materialize(370, 120, 4);
  planet5.materialize(100, 460, 5);
  planet6.materialize(550, 180, 6);
  planet7.materialize(420, 300, 7);
  planet8.materialize(90, 300, 8);
  planet9.materialize(400, 600, 9);


  timer = new Timer(670, 50) ; // make the display at location (10,60)
  

 

  collected = 0;
}


void draw() {
  background(bg);
  

  if (gameState == 0) {
    image(title,100,15);
    image(gamestart,100,100);
    
    
    if(mousePressed==true){
      gameState++;
      timer.start() ;
    }
    
    
  }

  if (gameState == 1) {
    image(ice, 0, 100);

    image(title,15,15);
    planet.create();
    planet2.create();
    planet3.create();
    planet4.create();
    planet5.create();
    planet6.create();
    planet7.create();
    planet8.create();

    timer.DisplayTime() ;

    //int passedTime = millis() - savedTime;
    
    String plutoString = "Don't forget pluto!";





    //IF statements for when robot hits the planets. Here we go.


    if (dist(skater.x, skater.y, planet.px, planet.py)<skater.robotWidth && collected==0) {

      planet.px = -800;
      planet.py = -800;

      collected++;
    }
    
  if(dist(skater.x,skater.y,planet2.px,planet2.py)<skater.robotWidth && collected==1){
     
     planet2.px = -900;
     planet2.py = -900;
     
     collected++;
     
     }
     
     if(dist(skater.x,skater.y,planet3.px,planet3.py)<skater.robotWidth && collected==2){
     
     planet3.px = -950;
     planet3.py = -950;
     
     collected++;
     
     }
     
     if(dist(skater.x,skater.y,planet4.px,planet4.py)<skater.robotWidth && collected==3){
     
     planet4.px = -970;
     planet4.py = -970;
     
     collected++;
     
     }
     
     if(dist(skater.x,skater.y,planet5.px,planet5.py)<skater.robotWidth && collected==4){
     
     planet5.px = -930;
     planet5.py = -930;
     
     collected++;
     
     }
     
     if(dist(skater.x,skater.y,planet6.px,planet6.py)<skater.robotWidth && collected==5){
     
     planet6.px = -920;
     planet6.py = -920;
     
     collected++;
     
     }
     
     if(dist(skater.x,skater.y,planet7.px,planet7.py)<skater.robotWidth && collected==6){
     
     planet7.px = -910;
     planet7.py = -910;
     
     collected++;
     
     }
     
      if(dist(skater.x,skater.y,planet8.px,planet8.py)<skater.robotWidth && collected==7){
     
     planet8.px = -910;
     planet8.py = -910;
     
     collected++;
     
     }
     
     if(collected==8){
     
     planet8.px = -910;
     planet8.py = -910;
     textAlign(CENTER);
     text(plutoString, width/2,height/2);
     
     planet9.create();
     
     
     
     
     
     }
     
     if(dist(skater.x,skater.y,planet9.px,planet9.py)<skater.robotWidth && collected==8){
     
     planet9.px = -910;
     planet9.py = -910;
     
     
     
     collected++;
     
     gameState++;
     
     //println(passedTime);
     

     
     }
     
     
     
     
    skater.display();
    skater.go();
     
     
     
     
  }
  
  if (gameState == 2) {
    
    //fill(25,25,25,50);
    //rect(200,200,600,600);
    
    if(timer.seconds <= 10){
      scoreDivvy = "You have nothing else to live for now.";
    }else if(timer.seconds <= 20){
      scoreDivvy = "You're really talented. I wish we were related.";
    }else if(timer.seconds <= 40){
      scoreDivvy = "Try harder next time.";
    }else if(timer.seconds <= 60){
      scoreDivvy = "meh";
    }else if(timer.seconds <= 80){
      scoreDivvy = "You knew this was timed, right?";
    }else if(timer.seconds<= 100){
      scoreDivvy = "That was...awful.";
    } else{
      scoreDivvy = "Never play video games ever again";
    }
    textAlign(CENTER);
    fill(255);
    textSize(35);
    text(timer.seconds + " seconds", width/2, 350);
    textSize(25);
    text(scoreDivvy, width/2, 400);
  }
  
  
  
}

//key press means that robot will slide
void keyPressed() {
  if (key==CODED) {  
    if (keyCode==UP) {
      upPress=true;
    }

    else if (keyCode==DOWN) {
      downPress=true;
    }

    else if (keyCode==LEFT) {
      leftPress=true;
    }

    else if (keyCode==RIGHT) {
      rightPress=true;
    }
  }
}

//keyrelease will stop adding speed to the robots slide
void keyReleased() {
  if (key==CODED) {  
    if (keyCode==UP) {

      upPress=false;
    }

    else if (keyCode==DOWN) {
      downPress=false;
    }

    else if (keyCode==LEFT) {
      leftPress=false;
    }

    else if (keyCode==RIGHT) {
      rightPress=false;
    }
  }
}

class Planet{
  
  float px;
  float py;
  float planetWidth = 50;
  PImage img;
  
  
  void materialize(float _px, float _py, int number){
    px = _px;
    py = _py;
    
    img = loadImage(number + ".png");
    
    
  }
  
  
  void create(){
    image(img,px,py);
    //ellipse(px,py,planetWidth,50);
    }
    
  
  
  
  
  
  
  
  
  
  
  
}
class Robot {

  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float xVel;
  float yVel;
  float friction;
  float robotWidth=50;
  
  PImage robotguy;


  void build(float _x, float _y) {
    x = _x;
    y = _y;
    xSpeed = .2;
    ySpeed = .2;

    xVel = 0;
    yVel = 0;

    friction = .042;
    
    robotguy = loadImage("robot.png");
  }


  void display() {
    image(robotguy, x, y);
  }

  void go() {
    x+=xVel;
    y+=yVel;
    
    //if statements determine whether to add or subtract friction based
      //on direction
    
    if (xVel>0) xVel-=friction;
    if (xVel<0) xVel+=friction;
    if (yVel>0) yVel-=friction;
    if (yVel<0) yVel+=friction;
    
    //button press if statements check to see if they should continue to add
      //speed to the velocity of both x and y

    if (upPress==true) {
      yVel-=ySpeed;
      
    }

    if (downPress==true) {
      yVel+=ySpeed;
    }

    if (leftPress==true) {
      xVel-=xSpeed;
    }

    if (rightPress==true) {
      xVel+=xSpeed;
    }
    
    //robot bounces off the walls left and right
    if(x<=5 || x+100>width){
      xVel*= -1;
    }
    
    //robot bounces off the walls top and bottom
    if(y<=100 || y+100>height){
      yVel*= -1;
    }
    

    //if (x > width - 45) {
      //????xVel*=-1;
    //}
  }
}


class Timer {
  
  long startTime ; // time in msecs that timer started
  long timeSoFar ; // use to hold total time of run so far, useful in 
  // conjunction with pause and continueRunning
  boolean running ;
  int x, y ; // location of timer output
  
  int seconds ;
  
  
  Timer(int inX, int inY){
    x = inX ;
    y = inY ;
    running = false ;
    timeSoFar = 0 ;
  }
  
  int currentTime(){
    if ( running )
      return ( (int) ( (millis() - startTime) / 1000.0) ) ;
    else
      return ( (int) (timeSoFar / 1000.0) ) ;
  }
  
  
  void start(){
    running = true ;
    startTime = millis() ;
  }

 
  
  void DisplayTime()
  {
    
    int minutes;
    int minutecount = 0;
    String output = "";
    seconds = currentTime() ;
    
    /*if(seconds>=60){
      seconds-=60;
      minutecount++;
      
    }*/
    minutes = minutecount;
    output = output + seconds + ":" + (millis()%100) ;
    // println("output = " + output) ;
    fill(180, 0, 230) ;
    //PFont font ;
    //font = loadFont("ArialMT-48") ;
    //textFont(font) ;
    textSize(25);
    text(output, x, y) ;
  }
  
  
}

/*

  void moveup() {


    y-=yVel;
    yVel+=ySpeed;
    ySpeed-=friction;

    if (ySpeed<=0) {
      upPress=false;
    }

    if (y < 50) {
      y+=yVel;
      yVel+=ySpeed;
    }
    
  }

  void movedown() {

    y+=yVel;
    yVel+=ySpeed;
    ySpeed-=friction;

    if (ySpeed<=0) {
      downPress=false;
    }

    if (y > height - 45) {
      y-=yVel;
      yVel+=ySpeed;
    }
    
    
  }

  void moveleft() {


    x-=xVel;
    xVel+=xSpeed;
    xSpeed-=friction;

    if (xSpeed<=0) {
      leftPress=false;
    }

    if (x < 20) {
      x+=xVel;
      xVel+=xSpeed;
    }
    
    
  }

  void moveright() {

    //probably needs a forloop
    x+=xVel;
    xVel+=xSpeed;
    xSpeed-=friction;

    if (xSpeed<=.01) {
      rightPress=false;
    }
    
    */


