
Tree[] tree = new Tree[6];// total of six trees
person o = new person();//player
healthPt q ;
PImage gameOverPg, face2, face3, face1, face4, heartPic, Back, Heart2,watchYou;
int Heart = 4;//HP
boolean game = true, start = false;
PFont font, font2;
float score;
int hasPlayed = 1;
float highest = 0;
void setup() {
  size(600, 400);
  noStroke();
  smooth();
  for (int i = 0 ; i < tree.length; i ++ ) 
    tree[i] = new Tree((int)(random(600)), 0);
  score = 0;
  face1 = loadImage("4h.png");
  face2 = loadImage("3h.png");
  face3 = loadImage("2h.png");
  face4 = loadImage("1h.png");
  gameOverPg = loadImage("rage1.png");
  heartPic = loadImage("heart.png");
  Back = loadImage("begin.png");
  watchYou = loadImage("WatchingYou.png");
  font = loadFont("Arial-Black-48.vlw");
  font2 = loadFont("Jokerman-Regular-48.vlw");
  Heart2 = loadImage("heart2.jpg");
}
void mousePressed() {
  start = true;
    if(!game){//if gameover
  game = true; 
  reset();
  }
}
void reset() {//reset the game setting
  for (int i = 0 ; i < tree.length; i ++ ) {
    tree[i] = new Tree((int)(random(600)), height);
  }
  Heart = 4;
  score = 0;
  hasPlayed++;
}



void draw() {
  if (game) {       // if game is true
    if ( start ) {     // if game has started   
      background(0);
      if ( Heart <= 0 )
        game = false;     //gameover if no health point
      o.putMeInTheWorld();
      o.healthPt();
      score++;
      fill(255);    //color: red
      text("Score: "+ (int)(score), 450, 50);
      for ( int i = 0 ; i < tree.length ; i++) 
        tree[i].die();
      for (int i = 0 ; i < tree.length; i ++ ) { //for each tree
        if (tree[i].y > height ) { //if off screen
         tree[i] = new Tree( (int)(random(width)), 0);//new tree & new position
          tree[i].makeTree();        // draw tree
        }
        else {
          tree[i].y += tree[i].speed;   // set y to increase(fall down)
          tree[i].makeTree();
        }
        if (q != null) {   // if the falling heart is not there
          image(watchYou, 600-q.y*3/2,0,50,50);    // notice the speed has changed and a heart is falling
          q.makeHeart();
          q.addHeart();
          q.y+=q.speed;
          if (q.y > height)   //if heart is off screen
            q = null;
        }
        if (score % 400 == 0 && q == null ) //every 400 score, a heart falls
          q = new healthPt((int)(random(20, 580)));
      }
    }
    else {       // the game has not started, but game is true(front page)
      textFont(font, 22);             // print "welcome" statement
      image(Back, 0, 0, 600, 400);
      fill(255, 0, 0);    //color: red
      text("Welcome to the end of the world, "+"\nclick to begin!", 0, height*3/4);
    }
  }
  else {        //if game is false
    image(gameOverPg, 0, 0, width, height);     //gameover
    textFont(font2, 22);
    if(highest < score)
    highest = score;
    fill(255, 255, 0);
    text("You have played this game "+hasPlayed+" times\n",0,250);
    text("YOUR SCORE IS ", 0, 350);
    text("left click to play again", 200, 40);
    fill(255,0,0);
    text("The HIGHEST score is: "+highest,0,300);
    text((int)(score), 175, 350);
  }
}

public class Tree {
  int LX, RX, LBX, RBX, TX, //save different points
  LY, RY, LBY, RBY, TY, x, y, speed;            //x,y is the center of the ellipse && top point of the triangle
  public Tree(int a, int b) {
    x = a; 
    y = b;
    if      (score < 400)    //when scroe hits 400, increase the speed
    speed = (int)(random(2, 5));
     else if(score < 800)
    speed = (int)(random(5,8));
    else if(score < 1200)
    speed = (int)(random(8,12));
    else if(score < 1600)
    speed = (int)(random(10,15));
    else 
    speed = (int)(random(12,20));
  }
  void die() {            //if mouse(player) touches the tree, heart -=1
    if (
    (RX > mouseX-25 && RX < mouseX +25
      && y > mouseY-25 && y < mouseY +25) ||
      (LX > mouseX-25 && LX < mouseX +25
      && y > mouseY-25 && y < mouseY +25) ||
      (LBX > mouseX-25 && LBX < mouseX +25
      && LBY > mouseY-25 && LBY < mouseY +25) ||
      (RBX > mouseX-25 && RBX < mouseX +25
      && RBY > mouseY-25 && RBY < mouseY +25) ||
      (x > mouseX-25 && x < mouseX +25
      && TY > mouseY-25 && TY < mouseY +25) ) {
      Heart--;                   //heart minus one
      y = height;             // the tree is destroyed
    }
  }

  void makeTree() {
    // save the different position point
    LBX = x-10;            
    LBY = y+30;
    RBX = x+10;            
    RBY = y+30;
 //   TX = x;                
    TY = y-10;
    RX = x+20;             
  //  RY = y;
    LX = x-20;             
  //  LY = y;
    fill(139, 69, 19);
    triangle(x, y, LBX, LBY, RBX, RBY);
    fill(34, 139, 34);
    ellipse(x, y, 40, 20);
  }
}
public class person {
  void healthPt() {
    for ( int i = 0 , j = 0; i < Heart ; i ++ , j +=55) 
      image(heartPic, 0+j, 0, 70, 70);
  }
  void putMeInTheWorld() {
    switch (Heart) {
    case 4:       
      image(face1, mouseX-25, mouseY-25, 50, 50);
      break;
    case 3:           
      image(face2, mouseX-25, mouseY-25, 50, 50);
      break;
    case 2:
      image(face3, mouseX-25, mouseY-25, 50, 50);
      break;
    default:
      image(face4, mouseX-25, mouseY-25, 50, 50);
      break;
    }
  }
}

public class healthPt {
  int x, y, speed;
  int LX, LY, RX, RY, LBX, LBY, RBX, RBY;
  healthPt(int g) {
    x = g;
    y = 0;
    speed = 1;
  }
  void makeHeart() {
    LX = x;
    LY = y;
    RX = x+30;
    RY = y;
    LBX = x;
    LBY = y+30;
    RBX = x+30;
    RBX = y+30;
    image(Heart2, x, y, 30, 30 );
  }
  void addHeart() {
    if ( (RX > mouseX-25 && RX < mouseX +25
      && RY > mouseY-25 && RY < mouseY +25) ||
      (LX > mouseX-25 && LX < mouseX +25
      && LY > mouseY-25 && LY < mouseY +25) ||
      (LBX > mouseX-25 && LBX < mouseX +25
      && LBY > mouseY-25 && LBY < mouseY +25) ||
      (RBX > mouseX-25 && RBX < mouseX +25
      && RBY > mouseY-25 && RBY < mouseY +25) ) {
      if ( Heart < 4 ) {
        Heart++;
        y = height;
      } else 
      y = height;
    }
  }
}


