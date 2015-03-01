
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song8;
AudioPlayer song9;
AudioPlayer song10;
AudioPlayer song11;
AudioPlayer song12;
AudioPlayer song13;
AudioPlayer song14;

FFT fft;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 

PFont font;



GOL gol;

void setup() {
  size(800, 1200);
  gol = new GOL();
  minim = new Minim(this);
  song1 = minim.loadFile("1.wav");
  song2 = minim.loadFile("2.wav");
  song3 = minim.loadFile("3.wav");
  song4 = minim.loadFile("4.wav");
  song5 = minim.loadFile("5.wav");
  song6 = minim.loadFile("6.wav");
  song7 = minim.loadFile("7.wav");
  song8 = minim.loadFile("8.wav");
  song9 = minim.loadFile("9.wav");
  song10 = minim.loadFile("10.wav");
  song11 = minim.loadFile("11.wav");
  song12 = minim.loadFile("12.wav");
  song13 = minim.loadFile("13.wav");
  song14 = minim.loadFile("14.wav");
}

void draw() {
  gol.generate();
  gol.display();


  PImage img;
  img = loadImage("body.png");
  image(img, 0, 0);
  img = loadImage("screen.png");
  tint(#3EC406, 50);
  image(img, 0, 0);
  noTint();


  if (mousePressed) {
    if (mouseX>125 && mouseX<175 && mouseY>700 && mouseY <775) {
      song1.pause();
      song1.play();
      song1.rewind();

      
  
    } else if (mouseX>50 && mouseX<125 && mouseY>775 && mouseY <825) {
      song2.pause();
      song2.play();
      song2.rewind();
    } else if (mouseX>175 && mouseX<225 && mouseY>775 && mouseY <850) {
      song3.pause();
      song3.play();
      song3.rewind();
    } else if (mouseX>125 && mouseX<175 && mouseY>825 && mouseY <900) {
      song4.pause();
      song4.play();
      song4.rewind();
    } else if (mouseX>550 && mouseX<625 && mouseY>650 && mouseY <725) {
      song5.pause();
      song5.play();
      song5.rewind();
    } else if (mouseX>675 && mouseX<750 && mouseY>650 && mouseY <825) {
      song6.pause();
      song6.play();
      song6.rewind();
    } else if (mouseX>400 && mouseX<525 && mouseY>775 && mouseY <850) {
      song7.pause();
      song7.play();
      song7.rewind();
    } else if (mouseX>525 && mouseX<600 && mouseY>775 && mouseY <850) {
      song8.pause();
      song8.play();
      song8.rewind();
    } else if (mouseX>225 && mouseX<325 && mouseY>925 && mouseY <950) {
      song9.pause();
      song9.play();
      song9.rewind();
    } else if (mouseX>225 && mouseX<325 && mouseY>975 && mouseY <1000) {
      song10.pause();
      song10.play();
      song10.rewind();
    } else if (mouseX>225 && mouseX<325 && mouseY>1025 && mouseY <1050) {
      song11.pause();
      song11.play();
      song11.rewind();
    } else if (mouseX>375 && mouseX<475 && mouseY>925 && mouseY <950) {
      song12.pause();
      song12.play();
      song12.rewind();
    } else if (mouseX>375 && mouseX<475 && mouseY>975 && mouseY <1000) {
      song13.pause();
      song13.play();
      song13.rewind();
    } else if (mouseX>375 && mouseX<475 && mouseY>1025 && mouseY <1050) {
      song14.pause();
      song14.play();
      song14.rewind();
    } else if (mouseX>700 && mouseX<800 && mouseY>1100 && mouseY <1200) {
      link("http://www.ymck.net/index.html");
    } else {
      img = loadImage("cover.png");
      image(img, 0, 0);
    }
  }


}


void mousePressed() {
  gol.init();
}

class GOL {
  int w = 8;
  int columns,rows;
  int[][] board;


  GOL() {
    columns = width/w;
    rows = height/w;
    board = new int[columns][rows];

    init();
  }

  void init() {
    for (int i =1;i < columns-1;i++) {
      for (int j =1;j < rows-1;j++) {
        board[i][j] = int(random(2));
      }
    }
  }

  void generate() {

    int[][] next = new int[columns][rows];

    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {

        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[(x+i+columns)%columns][(y+j+rows)%rows];
          }
        }

        neighbors -= board[x][y];

        if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
        else                                            next[x][y] = board[x][y];  // Stasis
      }
    }

    board = next;
  }

  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        if ((board[i][j] == 1)) fill(0);
        else fill(255); 
        noStroke();
        rect(i*w, j*w, w, w);
      }
    }
  }
}


