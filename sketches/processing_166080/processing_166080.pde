
String[] square_list;
int board_width;
int board_height;
int boardX;
int boardY;
color white;
color blue;
square[][] all_squares = new square[8][8];


void setup() {
  size(500, 600);
  background(255);

  //init
  String[] square_list = generate_square_list();
  board_width = width - 1;
  board_height = height - 100;
  boardX = 0;
  boardY = 100;
  white = color(255);
  blue = color(0,0,255);
  //initialize all_squares
  int index = 0;
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      all_squares[x][y] = new square(boardX + board_width / 8.0 * x, (height-2) - board_height / 8.0 * (y + 1), board_width/8.0, board_height / 8.0, square_list[index]);
      index += 1;
      all_squares[x][y].outline(white);
    }
  }
  
}

void draw() {
  fill(0, 255, 0);
  noStroke();
  for (int y = 0; y < 8; y++) {
    for (int x = 0; x < 8; x++) {
      if (all_squares[x][y].mouse_in()) {
        all_squares[x][y].outline(blue);
      } else {
        all_squares[x][y].outline(white);
      }
    }
  }
}


class square {
  float x;
  float y;
  float wid;
  float hei;
  String name;

  square(float x_, float y_, float wid_, float hei_, String name_) {
    x = x_;
    y = y_;
    wid = wid_;
    hei = hei_;
    name = name_;
  }

  boolean mouse_in() {
    if ((mouseX > x && mouseX < x + wid) && (mouseY > y && mouseY < y + hei)) {
      return true;
    } else {
      return false;
    }
  }
  
  void outline(color square_fill_color) {
    stroke(0);
    strokeWeight(3);
    fill(square_fill_color);
    rect(x,y,wid,hei);
  }
    
}

String[] generate_square_list() {
    String[] square_list = new String[64];
    String letters = "abcdefgh";
    String numbers = "12345678";
    int index = 0;
    for (int n = 0; n < 8; n++) {
      for (int l = 0; l < 8; l++) {
        square_list[index] = (str(letters.charAt(l)) + str(numbers.charAt(n)));
        index += 1;
      }
    }
    return square_list;
  }




