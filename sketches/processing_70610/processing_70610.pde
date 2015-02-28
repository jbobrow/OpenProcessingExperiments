
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int state = 0;  // 0 = menu; 1 = first myth; 2 = second myth
Intro intro = new Intro ();
Myth1 myth1 = new Myth1 ();
Myth2 myth2 = new Myth2 ();

Minim minim;
AudioPlayer audioKhoisan;
AudioPlayer audioChiloe;

void setup() {
  size(750, 400);

  minim = new Minim(this);
  audioKhoisan = minim.loadFile("kaang.mp3");
  audioChiloe = minim.loadFile("vilu.mp3");
}

void stop()
{
  audioKhoisan.close();
  audioChiloe.close();
  minim.stop();
 
  super.stop();
}

void draw() {
  if (state == 0) {
    image(intro.getImage(), 0, 0, 750, 400);
  }
  else if (state == 1) {
    image(myth1.getImage(), 0, 0, 750, 400);
  }
  else if (state == 4) {
    image(intro.getImageButtonKhoisan(), 0, 0, 750, 400);
  }
    else if (state == 2) {
    image(myth2.getImage(), 0, 0, 750, 400);
  }
  else if (state == 5) {
    image(intro.getImageButtonChiloe(), 0, 0, 750, 400);
  }
}

class Timer {
  int savedTime = 0; // When Timer started

  // Starting the timer
  void start() {
    savedTime = millis();
  }

  int currentTime() {
    return millis() - savedTime;
  }
}

class Intro {
  Timer timerIntro = new Timer();
  Timer timerButtonPressed = new Timer();
  
  PImage getImageButtonKhoisan() {
    if ( timerButtonPressed.currentTime() < 500 )
      return loadImage("introkhoisan.JPG");
    else if ( timerButtonPressed.currentTime() < 1000 )
      return loadImage("intro13.JPG");
    else {
      state = 1;
      myth1.initialize();
      return loadImage("intro13.JPG");
    }
  }

  PImage getImageButtonChiloe() {
    if ( timerButtonPressed.currentTime() < 500 )
      return loadImage("introchiloe.JPG");
    else if ( timerButtonPressed.currentTime() < 1000 )
      return loadImage("intro13.JPG");
    else {
      state = 2;
      myth2.initialize();
      return loadImage("intro13.JPG");
    }
  }
  
  PImage getImage() {
    if ( timerIntro.currentTime() < 500 )
      return loadImage("intro01.JPG");
    else if ( timerIntro.currentTime() < 1000 )
      return loadImage("intro02.JPG");
    else if ( timerIntro.currentTime() < 1500 )
      return loadImage("intro03.JPG");
    else if ( timerIntro.currentTime() < 2000 )
      return loadImage("intro04.JPG");
    else if ( timerIntro.currentTime() < 2500 )
      return loadImage("intro05.JPG");
    else if ( timerIntro.currentTime() < 3000 )
      return loadImage("intro06.JPG");
    else if ( timerIntro.currentTime() < 3500 )
      return loadImage("intro07.JPG");
    else if ( timerIntro.currentTime() < 4000 )
      return loadImage("intro08.JPG");
    else if ( timerIntro.currentTime() < 4500 )
      return loadImage("intro09.JPG");
    else if ( timerIntro.currentTime() < 5000 )
      return loadImage("intro10.JPG");
    else if ( timerIntro.currentTime() < 5500 )
      return loadImage("intro11.JPG");
    else if ( timerIntro.currentTime() < 6000 )
      return loadImage("intro12.JPG");
    else if ( !mousePressed )
      return loadImage("intro13.JPG");
    else if ( ( mouseX > 224) && (mouseX < 224+312) && (mouseY > 194) && (mouseY < 194+85)) {
      state = 4;
      timerButtonPressed.start();
      return loadImage("introkhoisan.JPG");
    }
    else if ( ( mouseX > 229) && (mouseX < 229+304) && (mouseY > 293) && (mouseY < 293+79) ) {
      state = 5;
      timerButtonPressed.start();
      return loadImage("introchiloe.JPG");
    }
    else return loadImage("intro13.JPG");
  }
}

class Myth1 {
  Timer timerMyth1 = new Timer ();
  
    void initialize() {
      audioKhoisan.rewind();
      audioKhoisan.play();
      timerMyth1.start();
    }
  
    PImage getImage() {
    if ( timerMyth1.currentTime() < 500 )
      return loadImage("mantis01.JPG");
    else if ( timerMyth1.currentTime() < 1000 )
      return loadImage("mantis02.JPG");
    else if ( timerMyth1.currentTime() < 1500 )
      return loadImage("mantis03.JPG");
    else if ( timerMyth1.currentTime() < 2000 )
      return loadImage("mantis04.JPG");
    else if ( timerMyth1.currentTime() < 2500 )
      return loadImage("mantis05.JPG");
    else if ( timerMyth1.currentTime() < 3000 )
      return loadImage("mantis06.JPG");
    else if ( timerMyth1.currentTime() < 3500 )
      return loadImage("mantis07.JPG");
    else if ( timerMyth1.currentTime() < 4000 )
      return loadImage("mantis08.JPG");
    else if ( timerMyth1.currentTime() < 4500 )
      return loadImage("mantis09.JPG");
    else if ( timerMyth1.currentTime() < 5000 )
      return loadImage("mantis10.JPG");
    else if ( timerMyth1.currentTime() < 5500 )
      return loadImage("mantis11.JPG");
    else if ( timerMyth1.currentTime() < 6000 )
      return loadImage("mantis12.JPG");
    else if ( timerMyth1.currentTime() < 6500 )
      return loadImage("mantis13.JPG");
    else if ( timerMyth1.currentTime() < 10000 ) //
      return loadImage("mantis14.JPG");
    else if ( timerMyth1.currentTime() < 10300 )
      return loadImage("mantis15.JPG");
    else if ( timerMyth1.currentTime() < 10600 )
      return loadImage("mantis16.JPG");
    else if ( timerMyth1.currentTime() < 10900 )
      return loadImage("mantis17.JPG");
    else if ( timerMyth1.currentTime() < 11200 )
      return loadImage("mantis18.JPG");
    else if ( timerMyth1.currentTime() < 11500 )
      return loadImage("mantis19.JPG");
    else if ( timerMyth1.currentTime() < 11800 )
      return loadImage("mantis20.JPG");
    else if ( timerMyth1.currentTime() < 12100 )
      return loadImage("mantis21.JPG");
    else if ( timerMyth1.currentTime() < 12300 )
      return loadImage("mantis22.JPG");
    else if ( timerMyth1.currentTime() < 14000 ) // 
      return loadImage("mantis23.JPG");
    else if ( timerMyth1.currentTime() < 15000 )
      return loadImage("mantis24.JPG");
    else if ( timerMyth1.currentTime() < 16000 )
      return loadImage("mantis25.JPG");
    else if ( timerMyth1.currentTime() < 17000 )
      return loadImage("mantis26.JPG");
    else if ( timerMyth1.currentTime() < 18000 )
      return loadImage("mantis27.JPG");
    else if ( timerMyth1.currentTime() < 19000 )
      return loadImage("mantis28.JPG");
    else if ( timerMyth1.currentTime() < 20000 )
      return loadImage("mantis29.JPG");
    else if ( timerMyth1.currentTime() < 21000 )
      return loadImage("mantis30.JPG");
    else if ( timerMyth1.currentTime() < 22000 )
      return loadImage("mantis31.JPG");
    else if ( timerMyth1.currentTime() < 25000 ) //
      return loadImage("mantis32.JPG");
    else if ( timerMyth1.currentTime() < 32000 )
      return loadImage("mantis33.JPG");
    else if ( timerMyth1.currentTime() < 38600 )
      return loadImage("mantis34.JPG");
    else if ( timerMyth1.currentTime() < 44500 ) //
      return loadImage("mantis35.JPG");
    else if ( timerMyth1.currentTime() < 45000 ) 
      return loadImage("mantis36.JPG");
    else if ( timerMyth1.currentTime() < 45500 )
      return loadImage("mantis37.JPG");
    else if ( timerMyth1.currentTime() < 46000 )
      return loadImage("mantis38.JPG");
    else if ( timerMyth1.currentTime() < 46500 )
      return loadImage("mantis39.JPG");
    else if ( timerMyth1.currentTime() < 47000 )
      return loadImage("mantis40.JPG");
    else if ( timerMyth1.currentTime() < 47500 )
      return loadImage("mantis41.JPG");
    else if ( timerMyth1.currentTime() < 48000 )
      return loadImage("mantis42.JPG");
    else if ( timerMyth1.currentTime() < 48500 )
      return loadImage("mantis43.JPG");
    else if ( timerMyth1.currentTime() < 49000 )
      return loadImage("mantis44.JPG");
    else if ( timerMyth1.currentTime() < 49500 )
      return loadImage("mantis45.JPG");
    else if ( timerMyth1.currentTime() < 50000 )
      return loadImage("mantis46.JPG");
    else if ( timerMyth1.currentTime() < 50500 )
      return loadImage("mantis47.JPG");
    else if ( timerMyth1.currentTime() < 51000 )
      return loadImage("mantis48.JPG");
    else if ( timerMyth1.currentTime() < 55000 ) //
      return loadImage("mantis49.JPG");
    else if ( timerMyth1.currentTime() < 55500 )
      return loadImage("mantis50.JPG");
    else if ( timerMyth1.currentTime() < 56000 )
      return loadImage("mantis51.JPG");
    else if ( timerMyth1.currentTime() < 56500 )
      return loadImage("mantis52.JPG");
    else if ( timerMyth1.currentTime() < 57000 )
      return loadImage("mantis53.JPG");
    else if ( timerMyth1.currentTime() < 57500 )
      return loadImage("mantis54.JPG");
    else {
      state = 0;
      audioKhoisan.pause();
      return loadImage("mantis54.JPG");
    }
  }
}

class Myth2 {
  Timer timerMyth2 = new Timer ();
  
    void initialize() {
      audioChiloe.rewind();
      audioChiloe.play();
      timerMyth2.start();
    }
  
    PImage getImage() {
    if ( timerMyth2.currentTime() < 1000 )
      return loadImage("snakes01.JPG");
    else if ( timerMyth2.currentTime() < 2000 )
      return loadImage("snakes02.JPG");
    else if ( timerMyth2.currentTime() < 3000 )
      return loadImage("snakes03.JPG");
    else if ( timerMyth2.currentTime() < 4000 )
      return loadImage("snakes04.JPG");
    else if ( timerMyth2.currentTime() < 5000 )
      return loadImage("snakes05.JPG");
    else if ( timerMyth2.currentTime() < 6000 )
      return loadImage("snakes06.JPG");
    else if ( timerMyth2.currentTime() < 7000 )
      return loadImage("snakes07.JPG");
    else if ( timerMyth2.currentTime() < 9500 ) //
      return loadImage("snakes08.JPG");
    else if ( timerMyth2.currentTime() < 11500 )
      return loadImage("snakes09.JPG");
    else if ( timerMyth2.currentTime() < 13500 )
      return loadImage("snakes10.JPG");
    else if ( timerMyth2.currentTime() < 15500 )
      return loadImage("snakes11.JPG");
    else if ( timerMyth2.currentTime() < 17200 ) //
      return loadImage("snakes12.JPG");
    else if ( timerMyth2.currentTime() < 20000 )
      return loadImage("snakes13.JPG");
    else if ( timerMyth2.currentTime() < 22400 ) //
      return loadImage("snakes14.JPG");
    else if ( timerMyth2.currentTime() < 23000 )
      return loadImage("snakes15.JPG");
    else if ( timerMyth2.currentTime() < 23600 )
      return loadImage("snakes16.JPG");
    else if ( timerMyth2.currentTime() < 24200 )
      return loadImage("snakes20.JPG");
    else if ( timerMyth2.currentTime() < 25800 )
      return loadImage("snakes24.JPG");
    else if ( timerMyth2.currentTime() < 26400 )
      return loadImage("snakes26.JPG");
    else if ( timerMyth2.currentTime() < 28000 )
      return loadImage("snakes28.JPG");
    else if ( timerMyth2.currentTime() < 29600 )
      return loadImage("snakes29.JPG");
    else if ( timerMyth2.currentTime() < 30000 )
      return loadImage("snakes30.JPG");
    else if ( timerMyth2.currentTime() < 30500 )
      return loadImage("snakes33.JPG");
    else if ( timerMyth2.currentTime() < 31000 )
      return loadImage("snakes36.JPG");
    else if ( timerMyth2.currentTime() < 31800 )
      return loadImage("snakes40.JPG");
    else if ( timerMyth2.currentTime() < 32200 ) //
      return loadImage("snakes41.JPG");
    else if ( timerMyth2.currentTime() < 32700 )
      return loadImage("snakes42.JPG");
    else if ( timerMyth2.currentTime() < 33000 )
      return loadImage("snakes44.JPG");
    else if ( timerMyth2.currentTime() < 33500 )
      return loadImage("snakes46.JPG");
    else if ( timerMyth2.currentTime() < 34000 )
      return loadImage("snakes47.JPG");
    else if ( timerMyth2.currentTime() < 34500 )
      return loadImage("snakes48.JPG");
    else if ( timerMyth2.currentTime() < 35000 )
      return loadImage("snakes49.JPG");
    else if ( timerMyth2.currentTime() < 35500 )
      return loadImage("snakes51.JPG");
    else if ( timerMyth2.currentTime() < 36000 )
      return loadImage("snakes52.JPG");
    else if ( timerMyth2.currentTime() < 36500 )
      return loadImage("snakes53.JPG");
    else if ( timerMyth2.currentTime() < 37000 )
      return loadImage("snakes54.JPG");
    else if ( timerMyth2.currentTime() < 37500 )
      return loadImage("snakes55.JPG");
    else if ( timerMyth2.currentTime() < 38000 )
      return loadImage("snakes56.JPG");
    else if ( timerMyth2.currentTime() < 38500 )
      return loadImage("snakes57.JPG");
    else if ( timerMyth2.currentTime() < 39000 )
      return loadImage("snakes58.JPG");
    else if ( timerMyth2.currentTime() < 39500 )
      return loadImage("snakes59.JPG");
    else if ( timerMyth2.currentTime() < 40000 )
      return loadImage("snakes60.JPG");
    else if ( timerMyth2.currentTime() < 40500 )
      return loadImage("snakes61.JPG");
    else if ( timerMyth2.currentTime() < 41000 )
      return loadImage("snakes62.JPG");
    else if ( timerMyth2.currentTime() < 43500 ) //
      return loadImage("snakes63.JPG");
    else if ( timerMyth2.currentTime() < 44000 )
      return loadImage("snakes64.JPG");
    else if ( timerMyth2.currentTime() < 44500 )
      return loadImage("snakes65.JPG");
    else if ( timerMyth2.currentTime() < 45000 )
      return loadImage("snakes66.JPG");
    else if ( timerMyth2.currentTime() < 45500 )
      return loadImage("snakes67.JPG");
    else if ( timerMyth2.currentTime() < 46000 )
      return loadImage("snakes68.JPG");
    else if ( timerMyth2.currentTime() < 46500 )
      return loadImage("snakes69.JPG");
    else {
      state = 0;
      audioChiloe.pause();
      return loadImage("snakes69.JPG");
    }
  }
}

