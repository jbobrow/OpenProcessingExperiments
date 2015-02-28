
class Television {

  Television() {
  }

  void display1() { // static channel
    for (int x = 100; x<400; x++) {//outer loop
      for (int y = 140;y<410; y++) {//inner loop
        if (int(random(2))==1) stroke(255); 
        else stroke(0);
        rect(x, y, 1, 1);
      }
    }
  }

  void display2() { // tour de france channel
    frame=(frameCount%10)/2;
    image(channel2[frame], 100, 140);
  }

  void display3() { // VCR Input Channel
    fill(0, 0, 255-random(75));
    rect(100, 140, 300, 270);
    fill(255);
    if (frameCount%20<12) {
      text("LINE", 300+random(1), 190+random(1));
    }
  }

  void display4() { // hypnotoad channel
    frame=(frameCount%14);
    image(channel4[frame], 80, 130);
  }

  void display5() { // colorbars channel
    image(colorBars, 100, 130);
  }

  void display6() { // 3D channel
    if ((frameCount%4)<2) {
      frame=0;
    } 
    else {
      frame=1;
    }
    image(channel6[frame], 90, 130);
  }

  void display7() { // crazy woman channel
    frame=(frameCount%27);
    image(channel7[frame], 100, 130);
  }

  void display8() { // undulating object channel
    frame=(frameCount%14);
    image(channel8[frame], 100, 130);
  }

  void display9() { // beemo channel
    frame=(frameCount%23);
    image(channel9[frame], 100, 130);
  }

  void display10() { // samurai glitch channel
    if ((frameCount%4)<3) {
      frame=0;
    } 
    else {
      frame=1;
    }
    image(channel10[frame], 90, 130);
  }

  void display11() { // glitch effect channel
    frame=(frameCount%5);
    image(channel11[frame], 100, 120);
  }

  void display12() { // fight club channel
    frame=(frameCount%20);
    image(channel12[frame], 100, 120);
  }

  void display13() { // bill cosby channel
    frame=(frameCount%10);
    image(channel13[frame], 100, 120, 300, 350);
    image(pbs, 320, 360);
  }
}


