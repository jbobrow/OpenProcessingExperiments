
//this is drawing tool (assignment3) 
//I added 3 buttons and each buttons draw different shape.


first[] circle = new first[100]; //first drawing
second_[] rectangle= new second_[100]; //second drawing
third line_; //thrid drawing


//these are all buttons' attribute
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean button2Over = false;
boolean button3Over = false;
boolean button1Over = false;
int button1X;
int button1Y;
int button2Y;
int button3Y;
int buttonsize;
float button1, button1_, button2, button2_, button3, button3_;



void setup() {
  size(500, 500);
  smooth();
  background(230, 250, 240);
  line_ =new third();

  //  translate(400, 400);
  for (int s = 0; s <100; s++) {
    circle[s] = new first();
    rectangle[s]=new second_();
  }

  button1 = color(230);
  button1_ = color(0);
  button2 = color(230);
  button2_ = color(0);
  button3 = color(230);
  button3_ = color(0);
  button1X=470;
  button1Y=10;
  button2Y=40;
  button3Y=70;
  buttonsize=10;

}

void draw() {
  update(mouseX, mouseY);
  noStroke();
  fill(random(255));


    //Give buttons color when mouse rolls over
    if (button1Over) {
      fill(button1);
             

      button1pressed(); //function after button is selected
    }
    else {
      fill(button1_);
    }
    ellipse (button1X, button1Y, buttonsize, buttonsize);

    if (button2Over) {
      fill(button2);        

      button2pressed();
    }
    else {
      fill(button2_);
    }
    ellipse (button1X, button2Y, buttonsize, buttonsize);

    if (button3Over) {
      fill(button3);        

      button3pressed();
    }
    else {
      fill(button3_);
    }
    ellipse (button1X, button3Y, buttonsize, buttonsize);
  }

  //Boolean to determine if mousepressed to trigger event
  void update(int x, int y) {
    if ( button1Over(button1X, button1Y, buttonsize)) {
      button1Over = true;
      button2Over = false;
      button3Over = false;
    } 
    else if ( button2Over(button1X, button2Y, buttonsize) ) {
      button1Over = false;
      button2Over = true;
      button3Over = false;
    }  
    else if ( button3Over(button1X, button3Y, buttonsize) ) {
      button1Over = false;
      button2Over = false;
      button3Over = true;
    }
  }

  //buttons' position
  boolean button1Over(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < 15 ) {
      return true;
    }
    else {
      return false;
    }
  }


  boolean button2Over(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < 15 ) {
      return true;
    }
    else {
      return false;
    }
  }

  boolean button3Over(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < 15 ) {
      return true;
    }
    else {
      return false;
    }
  }

  //  if (mousePressed && mouseX > 780 && mouseX < 800 && mouseY > 10 && mouseY < 40) {
  //    if (mousePressed == true) {
  //      for (int s = 0; s < 500; s++) {
  //        circle[s].draw_();
  //        circle[s].move();
  //}   
  //
  //if (mousePressed && mouseX > 780 && mouseX < 800 && mouseY > 40 && mouseY < 70) {
  //  if (mousePressed) {
  //    for (int s = 0; s < 500; s++) {
  //      rectangle[s].draw_();
  //    }
  //  }
  //}
  //
  //void mousePressed() {
  //  if (button1) {
  //    for (int s = 0; s < 500; s++) {
  //      circle[s].draw_();
  //      circle[s].move();
  //    }
  //  }

  //void mouseReleased(){
  //  button1Over = false;
  //    button2Over = false;
  //    button3Over = false;
  //}
  //  
  void button1pressed() {
    if (mousePressed==true) {
      for (int s = 0; s < 100; s++) {
        fill(244,247,100,20);
        circle[s].draw_();
        circle[s].move();
      }
    }
  }
  void button2pressed() {
    if (mousePressed==true) {
      for (int s = 0; s < 50; s++) {
        fill(44,147,255,20);
        rectangle[s].draw_();
        rectangle[s].move();
        circle[s].move2();
      }
    }
  }
  void button3pressed() {
    if (mousePressed==true) {
      fill(240,220,255,20);
      line_.draw_();
      noStroke();
      fill(random(0, 255), random(100, 240), random(100, 255), 100);
      quad(mouseX, mouseY, 250, 210, 250, 250, 215, 230);
    }
  }
void mousePressed(){
fill(random(255),random(40,255),random(80,245),20);      rect(0,0,500,500);
}


