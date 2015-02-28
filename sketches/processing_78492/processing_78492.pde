
//ANAIS FREITAS 

//UPLOADING ALL VARIABLES
PImage Ki = new PImage();
PImage Qu = new PImage();
PImage Bi = new PImage();
PImage Ch = new PImage();
King myKing;
Bishop myBishop;

//Dealing with animation
int numFrames = 4;
int frame = 0; 
int everyThismanyFrames = 12; 
PImage [] Backgrounds = new PImage [numFrames];

void setup () {
  size (800, 800);
  Backgrounds [0] = loadImage ("1.png");
  Backgrounds [1] = loadImage ("2.png");
  Backgrounds [2] = loadImage ("3.png");
  Backgrounds [3] = loadImage ("4.png");

  Ki = loadImage ("King.png");
  Qu = loadImage ("Queen.png");
  Bi = loadImage ("Bishop.png");
  Ch = loadImage ("Chess.png");

  myKing = new King();
  myBishop = new Bishop ();
}; //End of void setup

void draw () {

  //Dealing with animation
  background (200); 
  if (frameCount%everyThismanyFrames == 0) {
    frame = (frame +1) % numFrames;
  }
  image(Backgrounds[frame], 0, 0, width, height);

  //Dealing with characters
  myKing.draw_Ki();
  myKing.move_Ki();
  myBishop.draw_Bi();
  myBishop.move_Bi();
}; // end of void draw

//BISHOP AS CLASS
class Bishop {
  PImage display_img = new PImage(); 
  float Bi_x = width/2;
  float Bi_y = height/2;
  float Bi_h = 200;
  float Bi_w = 80;
  float Bi_x_speed = 10;
  float Bi_y_speed = 10;
  float Bi_x_direction = 1.5;
  float Bi_y_direction = 1.5;
  Boolean isActive = false; 

  Bishop () {
    display_img = Bi;
  }; 

  void draw_Bi () {
    image (Bi, Bi_x, Bi_y, Bi_w, Bi_h);
  }; // end of draw loop

  void move_Bi () {
    if (mousePressed == true) {
      if (isActive == true) {
        isActive = false;
      }// second if
    } //first if 
    else { 
      isActive = true;
    }; // else

      if (isActive == true) { 
      Bi_x = Bi_x + ( Bi_x_speed * Bi_x_direction );
      Bi_y = Bi_y + ( Bi_y_speed * Bi_y_direction );
    }; // third iff

    if (Bi_x > width-(Bi_w/2) || Bi_x < (Bi_w/2)) {
      Bi_x_direction *= -1;
    }; // fourth if
    if (Bi_y > height-(Bi_h/2) || Bi_y < (Bi_w/2)) {
      Bi_y_direction *= -1;
    };// fifth if
  }; // end of move_Bi
}; //end of bishop class

//KING AS CLASS
class King {
  PImage display_img = new PImage(); 
  float Ki_x = 500;
  float Ki_y = 10;
  float Ki_h = 200;
  float Ki_w = 80;
  float Ki_x_speed = 2;
  float Ki_y_speed = 2;
  float Ki_acc = 2;
  float Ki_dec = -1;
  Boolean isActive = false;

  King () {
    display_img = Ki;
  }
  void draw_Ki () {
    image (display_img, Ki_x, Ki_y, Ki_w, Ki_h);
  };

  void move_Ki () {
    if (isActive == true) {

      if (abs (Ki_x_speed) < .01) {
        Ki_x_speed = 0;
      };

      if (abs (Ki_y_speed) < .01) {
        Ki_y_speed = 0;
      };

      //Setting parameters for king not to escape the screen
      if (Ki_x < 0) {
        Ki_x = 0;
      };

      if (Ki_y < 0) {
        Ki_y = 0;
      };

      if (Ki_x > (width - Ki_w)) {
        Ki_x = (width - Ki_w) ;
      };

      if (Ki_y > (height - Ki_h)) {
        Ki_y = (height - Ki_h) ;
      };

      //deal with the bottom horizontal axis of the screen
      if ((Ki_y - Ki_h) > height ) {
        Ki_y = height;
      };

      if ((Ki_x - Ki_w) > width) {
        Ki_x = width;
      };

      if (Ki_y > 850) {
        display_img = Qu;
      };

      Ki_x = Ki_x + Ki_x_speed;
      Ki_y = Ki_y + Ki_y_speed;
    };//first if
  };//end move king - ben
};//end king class - ben

//Dealing with keys
void keyPressed() {
  if (keyCode == LEFT) {
    myKing.Ki_x_speed -= myKing.Ki_acc;
  } 
  else if (keyCode == RIGHT) {
    myKing.Ki_x_speed += myKing.Ki_acc;
  }//second if

  if (keyCode == UP) {
    myKing.Ki_y_speed -= myKing.Ki_acc;
  } 
  else if (keyCode == DOWN) {
    myKing.Ki_y_speed += myKing.Ki_acc;
  }// fourth if
}; // end of void key pressed

void keyReleased () {
  if (key == 'T') {
    println("T pressed " + key);
  }; // first if
  myKing.isActive = true;
}; // end of void keyReleased


