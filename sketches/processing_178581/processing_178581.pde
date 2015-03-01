
import processing.video.*; //<>//

Movie myMovie;
Movie myMovie2;

PFont font;

//boolean button

boolean zButton = false;
boolean sButton = false;
boolean tButton = false;
boolean nButton = false;

int x = 405;
int y = 445;
int w = 40;
int h = 40;
int x2 = 505;
int x3 = 860;
int x4 = 860;
int y3 = 30;
int y4 = 465;


/////////////////////////////////////////////////////////

void setup() {
  size(960, 540);
  myMovie = new Movie(this, "Sample!!.mp4");
  myMovie2 = new Movie(this, "aoa.mp4");
  myMovie.noLoop();
  myMovie.play();
}

void draw() {
  int msec = millis();
  font = loadFont("AdobeGothicStd-Bold-50.vlw");
  float a = 200;
  float b = 255;

  //println(millis());
  image(myMovie, 0, 0);



  //next button

  if (nButton) {
    myMovie.stop();
    myMovie2.play();
    image(myMovie2, 0, 0);
  }


  //zoom button

  if (zButton) {
    image(myMovie, -mouseX, -mouseY, myMovie.width*2, myMovie.height*2);
    image(myMovie2, -mouseX, -mouseY, myMovie2.width*2, myMovie2.height*2);
  } else {
    image(myMovie, 0, 0);
    image(myMovie2, 0, 0);
  }


  //speed button

  if (sButton) {

    fill(255, 150);
    textFont(font);
    textSize(50);
    text("0.5x", 60, 500); 

    fill(255, 200);
    textFont(font);
    textSize(50);
    text("1.5x", 800, 500);
    if (mousePressed) {
      myMovie.speed(map(mouseX, 0, width, 0.5, 1.5));
      myMovie2.speed(map(mouseX, 0, width, 0.5, 1.5));
    }
  }


  //draw button

  if (tButton == false && sButton == false) {
    fill(255, 100);
    rect(x, y, w, h);
  }
  if (tButton == false && zButton == false) {
    fill(0, 100);
    rect(x2, y, w, h);
  }

  if (zButton == false && sButton == false) {
    fill(255, 0, 0, 100);
    rect(x3, y3, w, h);
  }
  if (mouseX > x3 && mouseX < x3 + w && mouseY > y3 && mouseY < y3 + h) {
    stroke(255, random(200, 255), 0, 70);
    strokeWeight(10);
    rect(x3, y3, w, h);
  }

  if (tButton == false && sButton == false && zButton == false) {
    fill(200, 100);
    noStroke();  
    beginShape(TRIANGLES);
    vertex(900, 450);
    vertex(900, 500);
    vertex(920, 475);
    endShape();
    rect(x4, y4, w, h/2);
  }


  //Button letter

  if (mouseX > x4 && mouseX< x4 + w && mouseY > y4 && mouseY< y4 + h) {
    fill(255);
    textFont(font);
    textSize(30);
    text("Next Video", 700, 500);
  }
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(255);
    textFont(font);
    textSize(20);
    text("Zoom", 400, 510);
  }
  if (mouseX > x2 && mouseX < x2 + w && mouseY > y && mouseY < y + h) {
    fill(255);
    textFont(font);
    textSize(20);
    text("Speed Control", 460, 510);
  }



  /////////////////////////////////////////////////////////



  if (msec > 1200 && msec < 3500) {
    fill(255);
    textFont(font);
    textSize(50);
    text("Dance Player", width/2-150, height/2);
  }


  if (nButton ==false) {
    //Left Person

    if (msec >= 20700 && msec <= 20730) {
      myMovie.pause();
    }

    if (msec > 17000 && msec < 17900) {
      fill(random(a, b));
      textFont(font);
      text("3", 250, 105);
    }

    if (msec > 18000 && msec < 18900) {
      fill(random(a, b));
      textFont(font);
      text("2", 250, 105);
    }

    if (msec > 19000 && msec < 19900) {
      fill(random(a, b));
      textFont(font);
      text("1", 250, 105);
    }

    if (msec > 20000 && msec < 21000) {
      fill(random(a, b));
      textFont(font);
      text("Click", 220, 105);
    }



    //Right Person

    if (msec >= 35000 && msec <= 35030) {
      myMovie.pause();
    }

    if (msec > 32000 && msec < 32900) {
      fill(random(a, b));
      textFont(font);
      text("3", 700, 105);
    }

    if (msec > 33000 && msec < 33900) {
      fill(random(a, b));
      textFont(font);
      text("2", 700, 105);
    }

    if (msec > 34000 && msec < 34900) {
      fill(random(a, b));
      textFont(font);
      text("1", 700, 105);
    }

    if (msec > 34900 && msec < 36000) {
      fill(random(a, b));
      textFont(font);
      text("Click", 680, 105);
    }

    //tint button

    if (msec > 47000 && msec < 48500) {
      fill(random(a, b));
      textFont(font);
      textSize(30);
      text("CLICK!", 840, 100);
    }
  }
}



void movieEvent(Movie m) {
  m.read();
}


void mousePressed() {
  int msec = millis();
  //println(mouseX);


  //Left person click

  if (mouseX < 390 && mouseX > 300) {
    if (msec > 20000 && msec < 23000) {
      myMovie.play();
    }
  }

  //Right person click

  if (mouseX > 600 && mouseX < 660) {
    if (msec > 34800 && msec < 38000) {
      myMovie.play();
    }
  }



  //tint button click


  if (mouseX > x3 && mouseX < x3 + w && mouseY > y3 && mouseY < y3 + h) {
    tButton = !tButton;
    if (tButton == true) {
      {
        tint(255, 20);
        image(myMovie, 0, 0);
      }
    }
    if (tButton == false)
    {
      noTint();
    }
  }


  //buttons

  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    zButton = !zButton;
  }
  if (mouseX > x2 && mouseX < x2 + w && mouseY > y && mouseY < y + h) {
    sButton = !sButton;
  }
  if (mouseX > x4 && mouseX< x4 + w && mouseY > y4 && mouseY< y4 + h) {
    nButton = !nButton;
  }
}


