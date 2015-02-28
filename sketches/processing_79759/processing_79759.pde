
//the creatures should be objects (instances) of one or more classes
//the creatures should somehow react to each other
//Joanna Camargo Coelho

// initializing images
PImage chicken;
PImage back;
PImage bag;
PImage egg;


//initializing objects and values
Galinha galinha1;
Galinha galinha2;
Cesta cesta;
Ovo ovo;


float hor;
float ver;
float ver2;
float hor2;

float numero= random (25, 40);
float value2= random (5, 10);
int s = second(); 
int tamanho =100;//integer used for object sizes
int limiter=300; //limit until get to basket
PFont f; //font
PFont f1; //font
PFont f2; //font

int score = 0;      // User's score
boolean GameOver = false;
Timer timer;










void setup() {
  //screen size
  size(950, 404);
  //creating  images
  chicken= loadImage("galinha.png");
  back= loadImage("barn2.jpg");
  bag= loadImage("basket_detail.png");
  egg=loadImage("egg.png");
  //creating object
  galinha1= new Galinha();
  galinha2= new Galinha(100, 100, 100);
  cesta= new Cesta();
  ovo= new Ovo();
  timer = new Timer(60000);
  timer.start();
}

void draw() {
  // background scenario
  background(255);
  image (back, 0, 0, 950, 404);
  //acessing methods of the classes
  f= loadFont("MesquiteStd-60.vlw"); //load a font 
  textFont(f);
  fill(11, 75, 23);
  text("Score: " + score, 780, 400);
  f1= loadFont("MesquiteStd-30.vlw"); //load a font
  textFont(f1);
  fill(165, 15, 20);
  text("The Chicken Game", (width/3+100), 50);
  f2= loadFont("CourierNewPS-BoldItalicMT-10.vlw"); //load a font
  textFont(f2);
  fill(100, 62, 4);
  text("You have 1 minute to make 20 points!", (width/5*2-10), 70);

  cesta.display();
  cesta.moveCesta();
  galinha1.display();
  galinha1.play();
  ovo.display();
  ovo.play();
  ovo.ovoCaindo();
  ovo.ovoCiclo();
  ovo.ovoPara();




  if (timer.Finished() && score<20) {
    GameOver=true;
    timer.start();
  }


  if (GameOver) {
    textFont(f, 48);
    textAlign(CENTER);
    fill(0);
    text("GAME OVER", width/2, height/2);
  }
}



//class chicken
class Galinha {
  //the variables
  float hor;
  float ver;
  float sz=100;
  float direction;


  //the constructor
  Galinha() {
  }
  //the constructor with parameters
  Galinha(float a, float b, int c) {
    hor=a;
    ver=b;
    sz=c;
  }
  void display() {

    image (chicken, hor, ver, sz, sz);
  }
  void play() {

    hor=hor+direction/2;
    //ver=ver+direction/20;

    if (hor>=(width-100)) {
      direction= -numero;
    }
    if (hor<1) {
      direction= numero  ;
    }
  }
}
//class egg
class Ovo {
  //the variables
  float hor3;
  float ver3=300;
  float sz3=30;
  float direction;
  //the constructor
  Ovo() {
  }
  //the constructor with parameters
  Ovo(int f, int g, int h) {
    float hor3=f;
    float ver3=g;
    float sz3=h;
  }

  void display() {
    //
    image (egg, (hor+25), (ver+100), sz3, sz3);
  }
  void play() {

    hor=hor+direction/2;

    if (hor>=(width-100)) {
      direction= -numero;
    }
    if (hor<1) {
      direction= numero  ;
    }
  }
  void ovoCaindo() {
    //egg falls from chicken position
    ver=ver +value2;
  }
  //egg back to start
  void ovoCiclo() {
    if (ver>=limiter) {
      ver=20;
    }
  }
  

  //The eggs-in-the-bag counter
  void ovoPara() {
    if (ver>=290 &&  (hor+25)<=hor2+100 && (hor+25)>=hor2-100) {
      score++;
      println (score);
    }
  }
}

//class basket
class Cesta {
  //the variables
  float ver2=300;
  float sz2=100;
  float direction2;
  int direction;


  //the constructor
  Cesta() {
  }

  //the constructor with variables
  Cesta(int i, int j) {
    hor2=i;
    sz2=j;
  }
  void display() {
    image (bag, hor2, ver2, sz2, sz2);
  }
  //move basket arrow keys
  void moveCesta() {
    if (keyPressed) {

      if (key == CODED) {

        if (keyCode == RIGHT &&(hor2<(width-100))) {
          hor2=hor2+10;
        }
        else if (keyCode == LEFT &&(hor2>-10)) {
          hor2=hor2-10;
        }
      }
    }
  }
}
class Timer {
  //  started
  int savedTime;
  //  total time 
  int totalTime; 

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Start the timer
  void start() {
    // current time in milliseconds.
    savedTime = millis();
  }

  // Finished() returns true if 5 s have passed 
  boolean Finished() { 
    //  time passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}


