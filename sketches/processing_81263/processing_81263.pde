

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 16th, October, 2012
//*  email: akadir@sfu.ca
//*  Project 2: Create a computer game in Processing.

/*
/*  Project Discription: the inspiration of this game comes from my chilhood. My little brother 
/*  and I used to play similer game with Tetris. He passed away from a car accident when he was 7 years old.
/*  Not only I miss him a lot when I am designing this game but also with this game 
/*  I would like to show people to raise the awarness when they are driving.
/*  If you make little mistake like when you are turning around you will die in this game.
/*  You have to have 100% concentration and make quick and right decisions when driving.
/*  In the real life with you could kill someone by a small neglegence.
/*  so play this game and learn how to consentrate when you driving. hope you enjoy it!
 */
// RULES: Arraw keys:  you can move your car
//        Control Key:  change car speed
//        A key: change road speed
//        R key: you can replay
//
//       You have two Warnings before Game Over.

//import libraries
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.event.KeyEvent;
import java.util.ArrayList;

// declare global variables
public int xx;// declare a variable xx , it is X position of car
public int yy;// declare a variable yy, it is Y position of Y car
public int speed = 5; // declare and assign variable for speed of little car
public int space = 0; //
public PImage img;// declare a class for import imae

/*
   * / proportion of width of the road on game screen
 */
public float road = 0.15f; // width of road

boolean up, down, left, right;// declare boolean representation
// declare fields
public ArrayList<Point> list;
public int roadW;
public boolean isKey;
public int gameSpeed = 5;
public int prevSpeed;
DrawModel drawer;
PointBuilder pointBuilder;
IButton buttons[];
public Run() {
  pointBuilder = new PointBuilder();
  drawer = new DrawModel(this);
}

boolean instanceStart=false;
@Override
public void draw() { // Declare a method
  background(0, 0, 0); // color of background
  PFont font = createFont("Autumn", 24); // // font of calculation numbers
  textFont(font);
  if (!instanceStart) {
    buttons[2].draw();
    return;
  }

  drawRoad();

  drawer.drawModel();
  fill(0xf0, 0x0f, 0x55); // color of calculation numbers
  //100 pixel are equal to 100M on calculation numbers
  String str = String.format("%s.%sM", space / 100, space % 100);
  textFont(font);
  text(str, 10, 30); //demonstrate the numbers

  /*Every time when car out of the road display warning*/
  if (inter<2 && isInter) {
    infoTime++;
    fill(0xffff0000);
    text(texts[inter], width / 2 - 120, 500);
    if (infoTime%30==0) {
      inter++;
    }
  }
  if (inter>=2 && isInter) {// player die
    buttons[0].draw();
    buttons[1].draw();
  }
}
// Define a method called drawRoad
// attributes of road
public void drawRoad() {
  noStroke();// no outline
  space += gameSpeed;
  fill(0xff, 0xff, 0xff); // color of road
  Point p1 = list.get(0);
  Rectangle rectangle = new Rectangle(xx, yy, 20, 20);// position of car
  Rectangle rectangle2 = new Rectangle(); // position of road
  boolean safe = false;// check if the car on safe road
  for (int i = 1; i < list.size(); i++) {
    Point p2 = list.get(i);
    if (p2.y > space + height) {// position of coming up road 
      break;//ends the execution of a structure for loops
    }
    int y1 = space - p1.y;
    int h1 = roadW; // width of road
    int x2 = p2.x;
    if (p1.x != x2) {// draw the vertical road
      int abs = abs(p1.x - x2);
      int x1 = min(p1.x, x2);
      int w1 = abs + h1;
      rect(x1, y1, w1, h1);
      if (!safe) {
        rectangle2.setBounds(x1, y1, w1, h1);
        boolean contains = rectangle2.contains(rectangle);
        if (contains) {
        }
        safe = contains;
      }
    }

    rect(x2, y1, h1, p1.y - p2.y);// draw the hirozontal road
    if (!safe) {
      rectangle2.setBounds(x2, space - p2.y, h1, abs(p1.y - p2.y)
        + roadW);
      boolean contains = rectangle2.contains(rectangle);
      if (contains) {
      }
      safe = contains;
    }

    p1 = p2;
    if (p1.y < space - height) {// keep road on screen
      list.remove(i);
      i--;
    }
    pointBuilder.createPoints(list, roadW, space, width, height);// make this road randomly change
  }
  Rectangle secreen = new Rectangle(width, height);
  if (isInter=(!safe || !secreen.contains(rectangle))) {
    if (inter>=2) {
      image(img, width / 3, height / 3);
      speed = gameSpeed = 0;
      gameOver += 0.2;
      if (gameOver % 12 < 1) {
        int random = (int) random(0x00ffffff);
        gameOverColor = 0xff000000 | random;// color of Gameover randomly change
      }
      if (gameOver % 12 > 3) {
        PFont createFont = createFont("Autumn", 60f); // font of Gameover
        textFont(createFont);
        fill(gameOverColor);
        text(texts[2], width / 2 - 120, 500); //position of Game over text
      }
      // noStroke();
    }
  }
}
String[] texts= {
  "Warning", "Warning", "GAME OVER"
};
int inter=0;//declare variable for fail number
public float gameOver; //declare variable for gameover
private int gameOverColor;// declare variable for the color of gameover
int infoTime=0;
boolean isInter=false;
  // use the arrow keys on the keyboard
  // when pressed the car moves
@Override
public void keyPressed() { // the event when you press keyboard 
  if (keyCode == KeyEvent.VK_RIGHT) { // move right with right arrow key
    right = true;
  }
  if (keyCode == KeyEvent.VK_LEFT) { //move left with left arrow key
    left = true;
  }

  if (keyCode == KeyEvent.VK_DOWN) { // move down with down arrow key
    down = true;
  }
  if (keyCode == KeyEvent.VK_UP) { // move up with up arrow key
    up = true;
  }
  if (keyCode == KeyEvent.VK_CONTROL) { //change car speed with control key
    speed = 8;
  }
  if (keyCode == KeyEvent.VK_R) { // Replay the game
    xx = width / 2;
    yy = height / 2;
    setup();
  }
  if (keyCode == KeyEvent.VK_A) { // accelerate road speed
    if (prevSpeed == 0) {
      prevSpeed = gameSpeed;
    }
    if (gameSpeed < 20 && gameSpeed > 0) {
      gameSpeed = 10;
    }
  }
}

@Override
 // when the arrow keys are released the car stops
public void keyReleased() { // then event when keyboard are released
  if (keyCode == KeyEvent.VK_RIGHT) { //dose not move if right arrow key is released
    right = false;
  }
  if (keyCode == KeyEvent.VK_DOWN) {//does not move if down arrow key is released
    down = false;
    isKey = false;
  }
  if (keyCode == KeyEvent.VK_UP) {//dose not move if up arraw key is released
    up = false;
    isKey = false;
  }
  if (keyCode == KeyEvent.VK_LEFT) {//dose not move if left arrow key is released
    left = false;
  }
  if (keyCode == KeyEvent.VK_A) {// when you not press A it will remain previous speed
    gameSpeed = prevSpeed;
    prevSpeed = 0;
  }
}

@Override
public void setup() { // design the game canvas
  gameSpeed = 1;
  space = 0;
  speed = 5;
  gameOver = 0;
  inter=0;
  img = loadImage("image/one.png"); // import image
  int frameWidth = 600;
  int frameHeight = 600;
  size(frameWidth, frameHeight); // size of image
  yy = frameHeight / 2;
  xx = frameWidth / 2;

  buttons=new IButton[3];// display buttons

  int x=10;
  int y=frameHeight-40;
  int w=100;
  int h=35;
  buttons[0]=new YButton(x, y, w, h, "RePlay", 24, this); // display replay button
  x=width-w-10;
  buttons[1]=new YButton(x, y, w, h, "Exit", 24, this); // display exit button
  buttons[2]=new YButton(frameWidth/2-50, frameHeight/2-25, 100, 40, "START", 24, this);// display star button


  list = new ArrayList();
  roadW = (int) (frameWidth * road);//make the width of road
  list.add(new Point(frameWidth / 2 - roadW / 2, -frameHeight)); // last point of virtical road
  list.add(new Point(frameWidth / 2 - roadW / 2, 0));  //begining point of vertical road
}


//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 16th, October, 2012
//*  email: akadir@sfu.ca

//Declare a DrawModel class for keep the car on canvas
class DrawModel {
 
  Run pa;
  public DrawModel(Run pa) { // DrawMode class is inheritanted from Run
    this.pa = pa;
  }
// define the available going area of car
  public void drawModel() {
    pa.fill(0xff00ff00); // color of little car
    if (!pa.isKey) {
      pa.yy += pa.gameSpeed; // car speed with road speed
    }
    if (pa.left) {
      if (pa.xx - 10 > 0) { // evn can move, it stop in 10 pixel before from left side of canvas
        pa.xx -= pa.speed;
      }
    }
    if (pa.right) {
      if (pa.xx + 10 < pa.width) { // even car move, it stop in 10 pixel before from right side of canvas
        pa.xx += pa.speed;
      }
    }
    if (pa.down) {
      if (pa.yy + 10 < pa.height) { // even car move, it stop in 10 pixel before from down side of canvas
        pa.yy += pa.speed;
      }
      pa.isKey = true;
    }
    if (pa.up) {
      if (pa.yy - 10 > 0) { //even car move, it stop in 10 pixel before from up side of canvas
        pa.yy -= pa.speed;
      }
      pa.isKey = true;
    }
    pa.rect(pa.xx, pa.yy, 20, 20);// draw the game car
  }
}


//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 16th, October, 2012
//*  email: akadir@sfu.ca

// declare a abstract class IButton for buttons
abstract class IButton{
  int x;
  int y;
  int w;
  int h;
  String t;
  int fs;
  Run run;
  // call IButton presedure
   public IButton(int x,int y,int w,int h,String t,int fs,Run run){
     this.x=x;
     this.y=y;
     this.w=w;
     this.h=h;
     this.t=t;
     this.fs=fs;
     this.run=run;
   }
   
   /*button event*/
   public abstract void draw();
} 

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 16th, October, 2012
//*  email: akadir@sfu.ca

import java.awt.Point;
import java.util.List;
import java.util.Random;
// Define a class called PointBuilder, this class use for keep the continuety and randomness of game road
class PointBuilder {
 // call a method named creat points
  void createPoints(List list, int roadW, int space, int width, int height) {
    int roadWieght = roadW / 2;
    Point lastPoint =(Point) list.get(list.size() - 1);
    if (lastPoint.y > space + height) {// If no any point left then creat a point 
      return;
    }
    Random random = new Random();//continue to draw random road
    int xx = random.nextInt(width);
    if (xx < roadWieght) {
      xx = roadWieght;
    } else {
      // when draw horizintal road find smallest value and draw ractangle
      xx = Math.min(xx, width - roadWieght - roadW); 
    }
     // when draw vertical road find biggest value and draw ractangle
    int yy = Math.max(random.nextInt(height), roadW + roadWieght);
    int xxx = xx;
    int yyy = yy + lastPoint.y;
    lastPoint = new Point(xxx, yyy);
    list.add(lastPoint);
    createPoints(list, roadW, space, width, height);// draw creatPoints, gameroad
  }


}

//*  IAT 800 Instructed by Phillipe Pasquire
//*  submitted by AYINUERGULI KADEER (Aynur Kadir)
//*  Date: 16th, October, 2012
//*  email: akadir@sfu.ca

//declare a YButton that subclass of Ibutton
class YButton extends IButton{
  // call the public button presedure
  public YButton(int x,int y,int w,int h,String t,int fs,Run run){ 
    super(x,y,w,h,t,fs,run);
  }
  //declare method to draw buttons
 public void draw(){
  int tc=0;// color of text
  PFont font = createFont("Autumn", fs);// text forn of buttons
  run.textFont(font);
       if(run.mouseX>=x && run.mouseX<=x+w  && run.mouseY>=y && run.mouseY<=y+h){
          if(run.mousePressed && (run.mouseButton == run.LEFT)){ // if mouse left pressed
            run.fill(0xffcc00cc);//color of button when mouse pressed 
            tc=0xff00ccc0;
            if(t=="RePlay"){// replay the game
               run.setup();
            }
            if(t=="Exit"){// exit from this game
              run.exit();
            }
            if(t=="START"){ // start this game
               run.instanceStart=true; 
            }
          }
          else{
            run.fill(0xffcccc00);//color of when mouse on the button 
            tc=0xff;
          }
       }else{
         run.fill(0xff00cccc);// color of button without mouse interaction
       }
       run.rect(x, y, w,h);
       run.fill(tc);
       run.text(t, x+10 ,y+28);//  print left button
 } 
}


