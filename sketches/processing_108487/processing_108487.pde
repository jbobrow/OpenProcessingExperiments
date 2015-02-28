
import processing.pdf.*;

int bg = #fff6f2;
int rows = 5;
int cols = 5;
int filecount = 97; //number of .txt files so far
String[] text; 
Tiles[][] tiles = new Tiles[cols][rows];

void setup() {
  //PDF ONLY
  //size(800, 800, PDF, "byte2eat.pdf");

  size(840, 840);
  smooth();

  //initializes the tiles array
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      tiles[c][r] = new Tiles(c*200, r*200);
    }
  }

  //PDF ONLY
  //PFont LED = createFont("Advanced_LED_Board-7", 50);

  //Advanced LED Board-7 font taken from dafont.com
  PFont LED = loadFont("Advanced_LED_Board-7-50.vlw");

  textFont(LED);

  noLoop();
}

void draw() {
  background(bg);

  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      tiles[c][r].display();

      fill(#313131);
    }
  }
  getWord();

  //PDF ONLY
  //exit();
}

void getWord() {

  //draws text
  for (int r = 0; r < 4; r++) {
    for (int c = 0; c < 4; c++) {

      //generates random number to select text file
      int rand = (int) random(1, filecount+1);

      //parses text file
      String[] data = loadStrings(rand + ".txt");
      text = new String[data.length]; 


      for (int i=0; i < text.length; i++) {
        //puts the parsed data into an array of Strings that can be read by the program 
        text[i] = data[i];
        pushMatrix();
        switch (c) {
        case 0:
          translate(c*180+60, 200*r+150);
          break;
        case 1:
          translate(c*180+90, 200*r+150);
          break;
        case 2:
          translate(c*180+110, 200*r+150);
          break;

        case 3:
          translate(c*180+130, 200*r+150);
          break;
        }

        text(text[i], 0, 0);
        popMatrix();
      }
    }
  }
}


class Tiles {
  int xpos;
  int ypos;

  //constructor
  Tiles(int xpos_, int ypos_) {
    xpos = xpos_;
    ypos = ypos_;
  }

  void display() {
    noStroke();
    Circle[][] grid = new Circle[30][30]; //col x row

    pushMatrix();
    translate(xpos, ypos);

    int rgb = 0;

    for (int r = 0; r < 30; r++) {
      for (int c = 0; c < 30; c++) {

        if (2 <= r && r <= 27 &&
          2 <= c && c <= 27) {
          rgb = bg;
        }

        else {
          int rand = (int) random(1, 7);

          switch(rand) {
          case 1: 
            rgb = #ee6a29; 
            break;
          case 2: 
            rgb = #CC0052;
            break;
          case 3: 
            rgb = #1F2E4C;
            break;
          case 4:
            rgb = #ff8a00;
            break;
          case 5: 
            rgb = bg;
            break;
          default: 
            rgb = #ea4d00;
            break;
          }
        }

        grid[c][r] = new Circle(c*20, r*20, rgb);
        grid[c][r].display();
      }
    }

    popMatrix();
  }
}

class Circle {
  int xpos;
  int ypos;
  int rgb; //square color

  //Circle constructor
  Circle(int xpos_, int ypos_, int rgb_) {
    xpos = xpos_;
    ypos = ypos_;
    rgb = rgb_;
  }

  void display() { 
    ellipseMode(CORNER);
    pushMatrix();
    translate(xpos, ypos);
    fill(rgb); 
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
}


