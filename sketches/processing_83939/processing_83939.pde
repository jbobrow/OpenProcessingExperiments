
PImage flyQ;  //images
PImage spider;

//class name  array
MovingFlies[] flies = new MovingFlies[0];
int score = 0;
 
void setup() {
  size(800, 600);
    flyQ = loadImage("fly.png");
    spider = loadImage("spider.png");

}
 
void draw() {
  background(0);
  fill(255);
  //add the void web here
  web();
  
   // actual text  array  location    
  text("SCORE" + score, 10,20);
 
  if (frameCount % 5 == 0) {
    MovingFlies fly = new MovingFlies();
    flies = (MovingFlies[]) append(flies, fly);
  }
 // if the amount of flies is bigger than 10, then delete old 
 //flys(subset)
  if (flies.length>15) {
 
    flies = (MovingFlies[]) subset(flies, 1);
  }
 //means more flys instead of just one
  for (int i = 0; i<flies.length; i++) {
    flies[i].update();
  }
  
  
  
  
  
  // the actual spider
       noFill();
       
        image (spider, mouseX-110,mouseY-110,300,300);
}
 
 

void mousePressed() {
  for (int i = 0; i<flies.length; i++) {
    MovingFlies fly = flies[i];
 
 //if the mouse is pressed on the fly array, then. . . 
    if 
    ((mouseX>fly.x) && 
    (mouseX<fly.x + fly.w) && 
    (mouseY>fly.y) && 
    (mouseY<fly.y+fly.h)) {
      //...the alive array = false
      fly.alive = false;
      //add one to the score
      score++;
    }
  }
}


 
class MovingFlies {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  boolean alive;
 
  MovingFlies() {
 
    y = random(20,300);
    w = 50;
    x = random(0, 780); 
    h = 80;
    velX = random(-2,2);
    velY = random(0,2); //makes it move down the window
    alive = true;
  } 
 
  void update() {
    //add velocity to x and y - making things move
    x+=velX;
    y+=velY;
    
     //if not pressed
    if(alive) {
      fill(255, 0, 0);
      stroke(255);  
    } else {
      //if pressed
      noStroke();
      velY +=50;
    }
   // the actual fly
    image(flyQ,x, y, w, h);
    
  }
}

void web (){


 

stroke(255);
  line (400, 0, 400, 600);
  line (0, 300, 800, 300);
  line (0, 0, 800, 600);
  line (0, 600, 800, 0);

noFill();
for (int d = 1000; d > 0; d -= 80) {
  ellipse(400,300, d, d);
}
}


