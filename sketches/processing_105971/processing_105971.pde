
float appleY;
PImage tree;
PImage apple;
boolean harvestTime;

float speed = 0;
float gravity = 0.2;

void setup() {
  size(500, 500);
  appleY = 40;
  speed = 2;
  tree = loadImage("tree.png");
  apple=loadImage("apple.png");
  harvestTime = false;
}

void draw() {
  background(40, 200, 245);
  image(tree, 0, 0, 358, 500);
  image(apple, 250, appleY, 155, 160);
  if (harvestTime == true){
    // this next line calls the appleFalls() function
    appleFalls();
  }
  if (harvestTime == false){
    // do nothing
    // this if-statement is not actually necessary
  }
}

void appleFalls(){
  appleY = appleY + speed;
  // constantly adding gravity to speed means the y-position
  // causes the y-position of the apple to increase
  speed = speed + gravity;
  
  if (appleY > height - apple.height) {
    println("hit bottom");
    appleY = height - apple.height;
    // multiplying speed by -0.75 means the apple will bounce
    // a tiny bit less each time
    speed = speed * -0.75;
  }
  
  // if you hate the tiny bouncing at the end
  if (appleY > height - apple.height-4 && speed < 0.5 && speed > -0.5){
    speed = 0;
    appleY = height - apple.height;
  }
  
}

void mouseClicked(){
  harvestTime = true;
}


