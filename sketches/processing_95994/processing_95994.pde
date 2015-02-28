
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
import ddf.minim.effects.*;
float A=0;
float B=0;
float C=0;
float D=0;
float E=0;
float F=0;
float G=0;
float H=0;
float I=0;
PImage btn;
int flag_A=-1;
int flag_B=-1;
int flag_C=-1;
int flag_D=-1;
int flag_E=-1;
int flag_F=-1;
int flag_G=-1;
int flag_H=-1;
int flag_I=-1;

Minim minim;
AudioSnippet song1;
AudioSnippet song2;
AudioSnippet song3;
AudioSnippet song4;

void setup() {
  background(0);
  size(300, 300);

  btn = loadImage("lit_processing_button.png");

  minim = new Minim(this);
  song1 = minim.loadSnippet("song1.mp3");
  song2 = minim.loadSnippet("song2.mp3");
  song3 = minim.loadSnippet("song3.mp3");
  song4 = minim.loadSnippet("song4.mp3");
}

void draw() {
  ////background
  fill(0, 100);
  rect(0, 0, width, height);
  ///AAAAAA
  if (dist(mouseX, mouseY, 50, 50)<=30) {
    imageMode(CENTER);
    image(btn, 50, 50, 50*sin(A), 50*sin(A));
    A += radians(3);

    if (A >= PI) {
      song1.rewind();
      song1.play();

      A = 0;
    }
  }
  if (flag_A == 1) {
    imageMode(CENTER);
    image(btn, 50, 50, 50*sin(A), 50*sin(A));
    A += radians(3);

    if (A >= PI) {
      song1.rewind();
      song1.play();

      A = 0;
    }
  }
  ///BBBBBBB
  if (dist(mouseX, mouseY, 150, 50)<=30) {
    imageMode(CENTER);
    image(btn, 150, 50, 50*sin(B), 50*sin(B));
    B += radians(3);

    if (B >= PI) {
      song1.rewind();
      song1.play();
      B = 0;
    }
  }
  if (flag_B == 1) {
    imageMode(CENTER);
    image(btn, 150, 50, 50*sin(B), 50*sin(B));
    B += radians(3);

    if (B >= PI) {
      song1.rewind();
      song1.play();
      B = 0;
    }
  }
  ///CCCCCCC
  if (dist(mouseX, mouseY, 250, 50)<=30) {
    imageMode(CENTER);
    image(btn,250, 50, 50*sin(C), 50*sin(C));
    C += radians(3);

    if (C >= PI) {
      song1.rewind();
      song1.play();
      C = 0;
    }
  }
  if (flag_C == 1) {
    imageMode(CENTER);
    image(btn, 250, 50, 50*sin(C), 50*sin(C));
    C += radians(3);

    if (C >= PI) {
      song1.rewind();
      song1.play();
      C = 0;
    }
  }
  ///DDDDDDDDDDD
  if (dist(mouseX, mouseY, 50, 150)<=30) {
    imageMode(CENTER);
    image(btn,50, 150, 50*sin(D), 50*sin(D));
    D += radians(3);

    if (D >= PI) {
      song2.rewind();
      song2.play();
      D = 0;
    }
  }
  if (flag_D == 1) {
    imageMode(CENTER);
    image(btn, 50, 150, 50*sin(D), 50*sin(D));
    D += radians(3);

    if (D >= PI) {
      song2.rewind();
      song2.play();
      D = 0;
    }
  }
  ///EEEEEEEEEE
  if (dist(mouseX, mouseY, 150, 150)<=30) {
    imageMode(CENTER);
    image(btn,150, 150, 50*sin(E), 50*sin(E));
    E += radians(3);

    if (E >= PI) {
      song2.rewind();
      song2.play();
      E = 0;
    }
  }
  if (flag_E == 1) {
    imageMode(CENTER);
    image(btn, 150, 150, 50*sin(E), 50*sin(E));
    E += radians(3);

    if (E >= PI) {
      song2.rewind();
      song2.play();
      E = 0;
    }
  }
  ///FFFFF
  if (dist(mouseX, mouseY, 250, 150)<=30) {
    imageMode(CENTER);
    image(btn,250, 150, 50*sin(F), 50*sin(F));
    F += radians(3);

    if (F >= PI) {
      song2.rewind();
      song2.play();
      F = 0;
    }
  }
  if (flag_F == 1) {
    imageMode(CENTER);
    image(btn, 250, 150, 50*sin(F), 50*sin(F));
    F += radians(3);

    if (F >= PI) {
      song2.rewind();
      song2.play();
      F = 0;
    }
  }
  ///GGGGGGGGG
  if (dist(mouseX, mouseY, 50, 250)<=30) {
    imageMode(CENTER);
    image(btn,50, 250, 50*sin(G), 50*sin(G));
    G += radians(3);

    if (G >= PI) {
      song3.rewind();
      song3.play();
      G = 0;
    }
  }
  if (flag_G == 1) {
    imageMode(CENTER);
    image(btn, 50, 250, 50*sin(G), 50*sin(G));
    G += radians(3);

    if (G >= PI) {
      song3.rewind();
      song3.play();
      G = 0;
    }
  }
  ///HHHHHHHHH
  if (dist(mouseX, mouseY, 150, 250)<=30) {
    imageMode(CENTER);
    image(btn, 150, 250, 50*sin(H), 50*sin(H));
    H += radians(3);

    if (H >= PI) {
      song3.rewind();
      song3.play();
      H = 0;
    }
  }
  if (flag_H == 1) {
    imageMode(CENTER);
    image(btn, 150, 250, 50*sin(H), 50*sin(H));
    H += radians(3);

    if (H >= PI) {
      song3.rewind();
      song3.play();
      H = 0;
    }
  }
  ///IIIIIIIII
  if (dist(mouseX, mouseY, 250, 250)<=30) {
    imageMode(CENTER);
    image(btn, 250, 250, 50*sin(I), 50*sin(I));
    I += radians(3);

    if (I >= PI) {
      song3.rewind();
      song3.play();
      I = 0;
    }
  }
  if (flag_I == 1) {
    imageMode(CENTER);
    image(btn, 250, 250, 50*sin(I), 50*sin(I));
    I += radians(3);

    if (I >= PI) {
      song3.rewind();
      song3.play();
      I = 0;
    }
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, 50, 50)<=30) {
    flag_A *= -1;
  }
  
  if (dist(mouseX, mouseY, 150, 50)<=30) {
    flag_B *= -1;
  }
  
  if (dist(mouseX, mouseY, 250, 50)<=30) {
    flag_C *= -1;
  }

  if (dist(mouseX, mouseY, 50, 150)<=30) {
    flag_D *= -1;
  }
  
  if (dist(mouseX, mouseY, 150, 150)<=30) {
    flag_E *= -1;
  }
  
  if (dist(mouseX, mouseY, 250, 150)<=30) {
    flag_F *= -1;
  }
  
  if (dist(mouseX, mouseY, 50, 250)<=30) {
    flag_G *= -1;
  }
  
  if (dist(mouseX, mouseY, 150, 250)<=30) {
    flag_H *= -1;
  }
  
  if (dist(mouseX, mouseY, 250, 250)<=30) {
    flag_I *= -1;
  }
}


