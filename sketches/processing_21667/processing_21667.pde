
/* Nick Myette
/* Art 479
/* Tic-Tac-Toe Game

My solution to a game of tic tac toe using button objects.
It's kind of hacked, and everything's hardcoded, and it doesn't
notify you when you've won (maybe I'll fix that in the next update),
but it works and you can play it! So have fun!
*/


Button one;
Button two;
Button three;
Button four;
Button five;
Button six;
Button seven;
Button eight;
Button nine;

int turn;

void setup() {
  size(200, 200);
  background(255);
  smooth();
  turn = 0;
  
  makeButtons();
}

void draw() {
  
}

void mousePressed() {
  testHover();
  makeMarks();
  turn++;
}

void makeMarks() {
  one.makeMark();
  two.makeMark();
  three.makeMark();
  four.makeMark();
  five.makeMark();
  six.makeMark();
  seven.makeMark();
  eight.makeMark();
  nine.makeMark();
}

void testHover() {
  one.hovering(mouseX, mouseY, turn);
  two.hovering(mouseX, mouseY, turn);
  three.hovering(mouseX, mouseY, turn);
  four.hovering(mouseX, mouseY, turn);
  five.hovering(mouseX, mouseY, turn);
  six.hovering(mouseX, mouseY, turn);
  seven.hovering(mouseX, mouseY, turn);
  eight.hovering(mouseX, mouseY, turn);
  nine.hovering(mouseX, mouseY, turn);
}

void makeButtons() {
  one = new Button(0, 0, width*0.33, height*0.33);
  two = new Button(width*0.33, 0, width*0.33, height*0.33);
  three = new Button(width*0.66, 0, width*0.33, height*0.33);
  four = new Button(0, height*0.33, width*0.33, height*0.33);
  five = new Button(width*0.33, height*0.33, width*0.33, height*0.33);
  six = new Button(width*0.66, height*0.33, width*0.33, height*0.33);
  seven = new Button(0, height*0.66, width*0.33, height*0.33);
  eight = new Button(width*0.33, height*0.66, width*0.33, height*0.33);
  nine = new Button(width*0.66, height*0.66, width*0.33, height*0.33);
}



class Button {
  boolean pressed;
  int x;
  int y;
  int h;
  int w;
  int turn;
  
  Button(float x, float y, float w, float h) {
    pressed = false;
    this.x = (int)x;
    this.y = (int)y;
    this.h = (int)h;
    this.w = (int)w;
    rect(x, y, w, h);
  }
  
  void hovering(int mx, int my, int turn) {
    if(mx > x && mx < x+w && my > y && my < y+h) {
      pressed = !pressed;
      this.turn = turn%2;
    }
  }
  
  void makeMark() {
    if (turn == 0 && pressed) {
      drawX();
    }else if (turn == 1 && pressed) {
      drawO();
    }else if (!pressed) {
      rect(x, y, w, h);
    }
  }  
  
  void drawX() {
    rect(x, y, w, h);
    line(x, y, x + w, y + h);
    line(x + w, y, x, y + h);
  }
  
  void drawO() {
    rect(x, y, w, h);
    ellipseMode(CORNER);
    ellipse(x, y, w, h);
  }
}
  
