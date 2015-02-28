

//Decalre objects
Poshlady1 p1;
Poshlady2 p2;
Poshlady3 p3;
Poshlady4 p4;
Poshlady5 p5;
Poshlady6 p6;
DraggableObject draggable;
Roof rainblock;
Superumbrella sp;
Lifeup lup;

//Declare rain class as array 
int numDrops = 7;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

//Declare all images
PImage umbrella;
PImage lilly;
PImage bg;
PImage drop;
PImage lady1;
PImage lady2;
PImage lady3;
PImage lady4;
PImage lady5;
PImage lady6;
PImage roof;
PImage taxi;
PImage title;
PImage end;
PImage ladysymbol;
PImage health;
PImage sp1;
PImage up;

PFont font;//Delcare font

int count = 0;
int lives = 99;
int lady6test = 0;//Marikos special test; used to know if any rain hit her (if not +5 points)

// Set up the constants to be used to represent
// the different states that we could be in
final int STATE_START = 0;
final int STATE_PLAY = 1;
final int STATE_END = 3;

// variable used to store the current state
int state;
// setup variable used to time the duration of 'special items.'
int countdown = 500;
int countdown2 = 500;

void setup() {
  size(900, 500);
  // Set the initial state to the start state
  font = loadFont("ArialMT-48.vlw"); 
  textFont(font, 32); 
  //Loop through array to create each raindrop to be used
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each drop


    //Load all images needed.
    umbrella = loadImage("umbrella2.gif");
    lilly = loadImage("lilly.gif");
    bg = loadImage("bg4.jpg");
    drop = loadImage("drop.gif");

    lady1 = loadImage("lady1.gif");
    lady2 = loadImage("lady2.gif");
    lady3 = loadImage("lady3.gif");
    lady4 = loadImage("lady4.gif");
    lady5 = loadImage("lady5.gif");
    lady6 = loadImage("lady6.gif");

    roof = loadImage("roof.gif");
    taxi = loadImage("taxi.gif");
    title = loadImage("title.jpg");
    end = loadImage("end.jpg");
    ladysymbol = loadImage("ladysymbol.gif");
    health = loadImage("health.gif");
    sp1 = loadImage("sp.gif");
    up = loadImage("1up.gif");
//Create all objects
    draggable = new DraggableObject(width/2, height/2);
    p1 = new Poshlady1();
    p2 = new Poshlady2();
    p3 = new Poshlady3();
    p4 = new Poshlady4();
    p5 = new Poshlady5();
    p6 = new Poshlady6();

    rainblock = new Roof();

sp = new Superumbrella();
lup = new Lifeup();
    
  }
  state = STATE_START;
}

void draw() {
  // Each of the states that we could be in call
  // a different function to handle the drawing
  if (state == STATE_START) {
    drawStart();
  } 
  else if (state == STATE_PLAY) {
    drawPlay();
  } 
  else if (state == STATE_END) {
    drawEnd();
  }
}

void drawStart() {
  background(title);
}

//This state contains all the code related the actually playing the game
void drawPlay() {
  noStroke();
  background(bg);
  fill(255,255);
  textFont(font, 32);
  image(ladysymbol, 20, 5, 32, 32); //symbol representing the number
  //of ladies safely across
  image(health, 100, 5, 32, 32); //symbol for remaining health
  text(count, 60, 30); //number of ladies, ie 'score'
  text(lives, 140, 30); //remaining health; 0 means gameover 
  fill(255,80);
  //An awning so that ladies which have just emerged cannot be hit by rain
  image(roof,800,200,200,348); 
  rainblock.block(); //blocks the rain (awning)
  image(taxi,-20,100,120,107); //Image representing the taxi stand
  //the ladies reach upon getting to the other side. 


  //Loop through array to compare drops to other objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    //Collision with umbrella - drops are 'stopped' (but infact 'reset')
    //Infact only a small handfull of drops are used on a cycle. 
    float distance = dist(drops[i].r, drops[i].y, draggable.x, draggable.y);
    if(distance < drops[i].radius + draggable.radius) {
      drops[i].r = random(width);
      drops[i].y = random(-200);
    }
    //Collision with the awning. 
    float distance8 = dist(drops[i].r, drops[i].y, rainblock.x, rainblock.y);
    if(distance8 < drops[i].radius + rainblock.radius) {
      drops[i].r = random(width);
      drops[i].y = random(-200);
    }
    //Collisions with all the posh ladies.
    float distance2 = dist(drops[i].r, drops[i].y, p1.x, p1.y);
    if(distance2 < drops[i].radius + p1.radius) {
      lives -= 1;
      if(lives < 1) {
        state = STATE_END;
      }
    }
    float distance3 = dist(drops[i].r, drops[i].y, p2.x, p2.y);
    if(distance3 < drops[i].radius + p2.radius) {
      lives -= 1;
      if(lives < 1) {
        state = STATE_END;
      }
    }
    float distance4 = dist(drops[i].r, drops[i].y, p3.x, p3.y);
    if(distance4 < drops[i].radius + p3.radius) {
      lives -= 1;
      if(lives < 1) {
        state = STATE_END;
      }
    }
    float distance5 = dist(drops[i].r, drops[i].y, p4.x, p4.y);
    if(distance5 < drops[i].radius + p4.radius) {
      lives -= 1;
      if(lives < 1) {
        state = STATE_END;
      }
    }
    float distance6 = dist(drops[i].r, drops[i].y, p5.x, p5.y);
    if(distance6 < drops[i].radius + p5.radius) {
      lives -= 1;
      if(lives < 1) {
        state = STATE_END;
      }
    }
    float distance7 = dist(drops[i].r, drops[i].y, p6.x, p6.y);
    if(distance7 < drops[i].radius + p6.radius) {
      lady6test = 1;//Special character - loose no health but may gain +5 points
    }
  }
  //Collision with special item 'super umbrella'
  float distance9 = dist(sp.r, sp.y, draggable.x, draggable.y);
  if(distance9 < sp.radius + draggable.radius) {
    sp.r = random(width);
    sp.y = random(height+1000);
    //makes the umbrella larger for a short period of time.
    draggable.radius = 120;
  }
  if (draggable.radius == 120) {
    countdown -= 1;
  }
  //returns to normal size after countdown reaches 0.
  if (countdown == 0) {
    draggable.radius = 80;
    countdown = 500;
  }
      //Collision with special item 'Life Up'
  float distance10 = dist(lup.r, lup.y, draggable.x, draggable.y);
  if(distance10 < lup.radius + draggable.radius) {
    lup.r = random(width);
    lup.y = random(height+1000);
    lives += 30; 
  }
  //activates the draggable umbrella
  draggable.draw();
  if(count > 2) {
    sp.fall();
  }
  if(count > 15) {
    lup.fall();
  }
  //activates all the posh ladies
  p1.walk();
  if(count > 1) {
    p2.walk();
  }
  if(count > 5) {
    p3.walk();
  }
  if(count > 10) {
    p4.walk();
  }
  if(count > 20) {
    p5.walk();
  }
  if(count > 30) {
    p6.walk();
  }
}
void mousePressed() {
  draggable.mousePressed(); //to allow umbrella to be dragged
}

void mouseDragged() {
  draggable.mouseDragged();
}

void mouseReleased() {
  draggable.mouseReleased();
}
//Everything relating to the game-over screen
void drawEnd() {
  // Check to see if we should go to the start screen, this implements
  // a simple countdown and illustrates another way to switch between states
  image(end,0,0,900,500);
  fill(255);
  textAlign(CENTER, CENTER);
  textFont(font, 40);
  text(count, 390, 250); //your final score
}

void keyPressed() {
  // For each of the states that we could be in, check the
  // key pressed to see if we need to change the state...
  if (state == STATE_START) {
    // If any key has been pressed then play the game
    state = STATE_PLAY;
  } 
  else if (state == STATE_PLAY) {
    if (key == 'q') {
      // If 'q' is pressed finish the game and go to the end screen
      state = STATE_END;
    }
  } 
  else if (state == STATE_END) {
    // If 'p' is pressed return directly to the game (not the start screen)
    if (key == 'p') 
      //Everything is reset back to original values in anticipation of a new game.
      count = 0;
    lives = 99;
    p1.x = random(width,width+width/3);
    p1.y = height-height/3.5;
    p2.x = random(width,width+width/3);
    p2.y = height-height/3.5;
    p3.x = random(width,width+width/3);
    p3.y = height-height/3.5;
    p4.x = random(width,width+width/3);
    p4.y = height-height/3.5;
    p5.x = random(width,width+width/3);
    p5.y = height-height/3.5;
    p6.x = random(width,width+width/3);
    p6.y = height-height/3.5;
    sp.r = random(width);
  sp.y = random(-height);
  draggable.radius = 80;
    state = STATE_START;
  }
}

//Have fun playing!!



//All classes are declared here.
class Rain {
  float r = random(width);
  float y = random(-height);
  float radius = 10;
float speed = 7;

  void fall() {
    y = y + speed; //to allow rain to travel down the screen
    fill(0,10,200,0);
    ellipse(r, y, 2*radius, 2*radius);
    image(drop,r-radius,y-radius*2,radius*2,radius*3.5);

    if(y>height){
      r = random(width);
      y = random(-200); //rain drop resets its position and starts again
    }//therefore only 7 drops are actually needed
  }
}

//Used Rob's draggable object code for the umbrella
class DraggableObject {
  float x, y;
  float radius;
  boolean drag;
  float dragX, dragY;

  DraggableObject(float _x, float _y) {
    x = _x; 
    y = _y;
    radius = 80;
    drag = false;
    dragX = 0;
    dragY = 0;
  }

  boolean inside(float ix, float iy) {
    return (dist(x, y, ix, iy) < radius);
  }

  void draw() {
    ellipseMode(CENTER);
    fill(200,0,0,0);
    ellipse(x, y, 2*radius, 2*radius);
    image(umbrella,x-radius,y-radius,radius*2,radius*1.7);
      if(mouseX <-20){x = -20;}
      if(mouseX > width+20) {x= width+20;}
      if(mouseY < -20) {y = -20;}
      if(mouseY >height+20) {y = height+20;}
  }


  void mousePressed() {
    drag = inside(mouseX, mouseY);
    if (drag) {
      dragX = mouseX - x;
      dragY = mouseY - y;
    }
  }

  void mouseDragged() {
    if (drag) {
      x = mouseX - dragX;
      y = mouseY - dragY;
    }
  }

  void mouseReleased() {
    drag = false;
  }
  
}


class Poshlady1 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(1,3);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    ellipse(x, y, 2*radius, 2*radius);
    image(lady1,x-radius,y-radius,2*radius,4*radius);
    if(x<-30){ //like the rain, the ladies reset their position after 
      x = random(width,width+width/3);//a certain amount of time
  y = height-height/3.5;
  float r = random(1,3);
   count += 1;//adds 1 to player's score
    }
  } 
}


class Poshlady2 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(1,3);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    noStroke();
    ellipse(x, y, 2*radius, 2*radius);
    image(lady2,x-radius,y-radius,2.3*radius,3.8*radius);
    if(x<-200){
      x = random(width,width+width/3);
  y = height-height/3.5;
  float r = random(1,3);
  count += 1;
    }
  } 
}

class Poshlady3 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(1,3);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    noStroke();
    ellipse(x, y, 2*radius, 2*radius);
    image(lady3,x-radius,y-radius,2.3*radius,3.8*radius);
    if(x<-300){
      x = random(width,width+width/3);
  y = height-height/3.5;
  float r = random(1,3);
  count += 1;
    }
  } 
}


class Poshlady4 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(2,4);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    noStroke();
    ellipse(x, y, 2*radius, 2*radius);
    image(lady4,x-radius,y-radius,2.3*radius,3.8*radius);
    if(x<-2000){ //takes a bit longer to return as shes fast.
      x = random(width,width+width/3);
  y = height-height/3.5;
  float r = random(2,4);//shes very fast.
  count += 1;
    }
  } 
}


class Poshlady5 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(0.5,2);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    noStroke();
    ellipse(x, y, 2*radius, 2*radius);
    image(lady5,x-radius,y-radius,3*radius,3.8*radius);
    if(x<-1000){
      x = random(width,width+width/3);
  y = height-height/3.5;
  float r = random(0.5,2);//shes slower than the rest
  count += 1;
    }
  } 
}

class Poshlady6 {
  float x = random(width,width+width/3);
  float y = height-height/3.5;
  float radius = 50;
  float r = random(1,3);
 

  void walk() {
    x = x - r;
    fill(0,10,200,0);
    ellipseMode(CENTER);
    noStroke();
    ellipse(x, y, 2*radius, 2*radius);
    image(lady6,x-radius,y-radius,2*radius,3.8*radius);
    if(x<-15000){//she doesn't appear often as shes a special character
      x = random(width,width+width/3);
  y = height-height/3.5;
  float r = random(1,3);
  if(lady6test < 1){count += 5;} //you get 5 bonus points for passing her test
  lady6test = 0;//which means getting her across without a single drop
    }//touching her
  } 
}

//this object is used at the right side of the screen so players can't loose life
class Roof {//as soon as the game starts, it is also an aesthetic decision
int x=890;
  int y=310;
  int radius=100;

void block(){
  
  fill(255,0);
  ellipseMode(CORNER);
  ellipse(x,y,radius*2,radius*2);
  ellipseMode(CENTER);
}}


//special item - huge umbrella
class Superumbrella {
  float r = random(width);
  float y = random(-height);
  float radius = 28;


  void fall() {
    y = y + 5;
    fill(0,200,0,0);
    ellipse(r, y, 2*radius, 2*radius);
   image(sp1,r-radius, y-radius, 2*radius, 2*radius);

    if(y>height+10000){//comes infrequently
      r = random(width);
      y = random(-200);
    }
  }
}
//special item, +30 life to keep the game going a bit longer as its 
class Lifeup {//quite difficult
  float r = random(width);
  float y = random(-height);
  float radius = 20;


  void fall() {
    y = y + 5;
    fill(0,200,0,0);
    ellipse(r, y, 2*radius, 2*radius);
   image(up,r-radius, y-radius, 2*radius, 2*radius);

    if(y>height+15000){//comes rarely.
      r = random(width);
      y = random(-200);
    }
  }
}



