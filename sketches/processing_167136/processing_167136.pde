
Mouse twoHundred [] = new Mouse [30];
Chaser one [] = new Chaser [5];

void setup () {

  size (800, 800);

  smooth ();

  for (int i=0; i<twoHundred.length; i++) {
    twoHundred[i] = new Mouse();
    twoHundred[i].prime(random(700), random(700), random(60), random(255));
  }

  for (int j=0; j<one.length; j++) {
    one[j] = new Chaser();
    one [j].prime (random(700), random(700), 60) ;
  }
}

void draw () {

  background (random(30), random(180), random(150));

  for (int i=0; i<twoHundred.length; i++) {
    twoHundred[i].update(); 
    twoHundred[i].movement ();
    twoHundred[i].checkCollision ();
    twoHundred[i].keyPressed ();
  }

  for (int j=0; j<twoHundred.length; j++) {
    one[j].update(); 
    one[j].movement ();
    one[j].checkCollision ();
    one[j].keyPressed ();
  }
}

class Chaser {
  float posX;
  float posY;
  float bigness;
  float movementX;
  float movementY;


  void prime (float _posX, float _posY, float _bigness) {
    posX = _posX;
    posY = _posY;
    bigness = _bigness;

  }

  void update () {
    //head
    fill (0);
    ellipse (posX, posY, bigness*3, bigness*3);
  }

  void movement () {
    //movement

      movementX = random (-5,5);
    movementY = random (-5,5);

    posX += movementX;
    posY += movementY;
  }

//make collision work  
    void checkCollision(){
    if (posX < 0 || posX > width){
      movementX *= -1;
    }
    if (posY < 0 || posY > height){
      movementX *=-1;
    }
  }
    
    
    
//if key is pressed, make objects move
  void keyPressed () {

    if (keyPressed == true) {
      posX = width/ random(500);
      posY=width/ random (500);
    }
  }
}

class Mouse {
  float posX;
  float posY;
  float bigness;
  float colors;
  float movementX;
  float movementY;


  void prime (float _posX, float _posY, float _bigness, float _colors ) {
    posX = _posX;
    posY = _posY;
    bigness = _bigness;
    colors = _colors;
  }

  void update () {
    //head
    fill (colors-100, colors-70, colors-20);
    ellipse (posX, posY, bigness*3, bigness*3);
  }

  void movement () {
    //movement

      movementX = random (10);
    movementY = random (5);

    posX += movementX;
    posY += movementY;
  }

//make collision work  
    void checkCollision(){
    if (posX < 0 || posX > width){
      movementX *= -1;
    }
    if (posY < 0 || posY > height){
      movementX *=-1;
    }
  }
  
    
//if key is pressed, make objects move
  void keyPressed () {

    if (keyPressed == true) {
      posX = width/ random(500);
      posY=width/ random (500);
    }
  }
}



