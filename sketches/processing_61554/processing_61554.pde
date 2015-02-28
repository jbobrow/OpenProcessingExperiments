
int[] ran = {
  (int)(random(600)), (int)(random(600)), (int)(random(600)), 
  (int)(random(600)), (int)(random(600)), (int)(random(600))
  };
  //String abc = "abcdef";
  Tree[] tree = new Tree[6];
person o = new person();
PImage face, heartPic, Back;
int Heart = 3;  
boolean game = true;
boolean start = false;
float yAxis = 0;

void setup() {
  size(600, 400);
  noStroke();
  smooth();
  frameRate(100);
  for (int i = 0 ; i < tree.length; i ++ ) {
    Tree q = new Tree(ran[i], 0);
    tree[i] = q;
  }
}
void mousePressed() {
  start = true;
}

void draw() {
  //println(start);
  if (game) {
    if ( start ) {
      background(0);
      if ( Heart < 0 ) 
        game = false;
      o.putMeInTheWorld();
      o.healthPt();
      for( int i = 0 ; i < tree.length ; i++){
        tree[i].die();
      }
      for (int i = 0 ; i < tree.length; i ++ ) {
        // make tree
        if (tree[i].getY() > height ) {
          ran[i] = (int)(random(600));
          float tmp = yAxis;
          tmp = 0;
          Tree b = new Tree( ran[i], (int)(tmp));
          b.setY(0);
          tree[i] = b;
          b.makeTree();
        } 
        else {
          Tree a = new Tree(ran[i], tree[i].getY());
          tree[i] = a;                      // save it into the array
          tree[i].makeTree();
          tree[i].setY(tree[i].getY()+(int)(random(1, 20)));
        }
      }
      yAxis-=58;
    }
    else {
      PFont font = loadFont("Arial-Black-48.vlw");
      textFont(font, 22);
      Back = loadImage("rage4.png");
      image(Back, 0, 0, 600, 400);
      fill(255, 0, 0);
      text("Welcome to the end of the world, click to begin!", 0, height/2);
    }
  }
  else {
    face = loadImage("rage1.png");
    image(face, 0, 0, width, height);
  }
}

public class Tree {
  int LX, RX, LBX, RBX, TX, 
  LY, RY, LBY, RBY, TY;
  int x, y ;
  public Tree(int a, int b) {
    x=a; 
    y=b;
  }
  void die() {
    if ((getX() >= mouseX-25 && getX() <= mouseX +25
      && getY() >= mouseY-25 && getY() <= mouseY +25)|| 
      (RX > mouseX-25 && RX < mouseX +25
      && RY > mouseY-25 && RY < mouseY +25) ||
      (LX > mouseX-25 && LX < mouseX +25
      && LY > mouseY-25 && LY < mouseY +25) ||
      (LBX > mouseX-25 && LBX < mouseX +25
      && LBY > mouseY-25 && LBY < mouseY +25) ||
      (RBX > mouseX-25 && RBX < mouseX +25
      && RBY > mouseY-25 && RBY < mouseY +25) ||
      (TX > mouseX-25 && TX < mouseX +25
      && TY > mouseY-25 && TY < mouseY +25) ) {
      //   println(Heart);
      Heart--;
      setY(height);
    }
  }

  void makeTree() {
    LBX = x-10;    
    LBY = y+30;
    RBX = x+10;    
    RBY = y+30;
    TX = x;        
    TY = y-10;
    RX = x+20;     
    RY = y;
    TX = x-20;     
    TY = y;
    fill(139, 69, 19);
    triangle(x, y, LBX, LBY, RBX, RBY);
    fill(34, 139, 34);
    ellipse(x, y, 40, 20);
  }
  void setX(int f ) {
    x = f;
  }
  int getX() {
    return x;
  }
  void setY(int g ) {
    y = g;
  }
  int getY() {
    return y;
  }
}
public class person {

  void healthPt() {
    heartPic = loadImage("heart.png");
    for ( int i = 0 , j = 0; i <= Heart ; i ++ , j +=55) {
      image(heartPic, 0+j, 0, 70, 70);
    }
  }
  void putMeInTheWorld() {
    if ( Heart == 3 ) {
      face = loadImage("rage.jpg");
      image(face, mouseX-25, mouseY-25, 50, 50);
    } 
    else if (Heart == 2) {
      face = loadImage("rage2.png");
      image(face, mouseX-25, mouseY-25, 50, 50);
    } 
    else {
      face = loadImage("rage5.png");
      image(face, mouseX-25, mouseY-25, 50, 50);
    }
  }
}

//public class healthPt(){



//}


