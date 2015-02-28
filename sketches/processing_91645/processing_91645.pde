
//------------------------DECLARE
Book [] bookCollection= new Book [100];

void setup() {
  size (600, 600);
  smooth();

  //-------------------------INITIALIZE 
  for (int i = 0; i < 20; i++) { 
    bookCollection[i] = new Book(random(0, width), random(0, height));
  }
}

void draw () {
  background(0);


  //--------------------------CALL FUNCTIONALITY
  for (int i = 0; i < 20; i++){
  bookCollection[i].run();
  //the dot opens up the class
  }
}


class Book {
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 3;
  float speedY = 0.5;



  //CONSTRUCTORS
  Book(float _x, float _y) {
    x = _x;
    y = _y;
  }


  //FUNCTIONS

  void run() {
    display();
    move();
    bounce();
    //gravity
  }

  void bounce() {
    if (x > width) {
      speedX = speedX*-1;
    }
    if (x < 0) {
      speedX = speedX*-1;
    }
    if (y > height) {
      speedY = speedY*-1;
    }
    if (y < 5) {
      speedY = speedY*-1;
    }
  }
  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
    
    stroke(180);
    fill(240);
    quad(x, y, x+20, y+10, x+20, y+120, x, y+110);
    quad(x+20, y+10, x+100, y+5, x+100, y+110, x+20, y+120);
    stroke(220);
    line(x, y+3, x+80, y-7);
    line(x, y+5, x+81, y-4);
    line(x, y+7, x+83, y-1);
    line(x, y+9, x+85, y);
    fill(0);
    text("books", x+40, y+20, x+20, y+10);
  }
}



