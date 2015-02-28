
import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.signals.*; // import signals from minim library

Minim sounds; // declare Minim variable
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly
int r = 24;
int x = 10;
int y = 10;
int rectWidth = 400;
int rectHeight = 400;

void setup() {
  size (400,400);
  smooth();
  strokeWeight(20);
  sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(440, 0.5, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out
}

void draw () {
  frameRate(r);
  noStroke();
  squiggly.portamento(200);

  println(mouseX + " " + mouseY + " " + mousePressed);
  if ((x < mouseX) && (mouseX < (x + rectWidth)) && (y < mouseY) && (mouseY < (y+rectHeight))) {//if mouse is inside center square do the following:
    if ((x < pmouseX) && (pmouseX < (x + rectWidth)) && (y < pmouseY) && (pmouseY < (y+rectHeight))) {
      if(mousePressed == true) {
        float freq = map(mouseX, x, (x+rectWidth), 500, 60); // frequency is scaled from height of display window to between 60 and 1500 Hz
        squiggly.setFreq(freq);//set frequency depending on horizontal position of mouse
        float vol = map(((y+rectHeight)-mouseY), y, (y+rectHeight), -20, 0);
        Aout.setGain(vol);//set volume depending on vertical position of mouse
      }
      else {//if mouse is not pressed do the following:
        Aout.setGain(-80);//turn volume to inaudible
      }
    }
  }
  else {//if mouse is outside center square do the following:
    Aout.setGain(-80);//turn volume to inaudible 
  }
  if ((keyPressed == true) && ((key == 'a') || (key == 'A')) 
  && (mousePressed == true)) {
    stroke(0,127.5,255,15);
    strokeWeight(30);
    line (mouseX, mouseY, pmouseX, pmouseY);
    println("azure");
  } else {
  }
  if ((keyPressed == true) && ((key == 'b') || (key == 'B')) 
  && (mousePressed == true)) {
    fill(0,0,255,5);
    noStroke();
    ellipse (mouseX, mouseY, pmouseX, pmouseY);
    println("blue");
  } else {
  }
  if ((keyPressed == true) && ((key == 'c') || (key == 'C')) 
  && (mousePressed == true)) {
    fill(0,255,255,5);
    noStroke();
    rect (mouseX-10, mouseY-20, pmouseX, pmouseY);
    println("cyan");
  } else {
  }
 if ((keyPressed == true) && ((key == 'd') || (key == 'D')) 
  && (mousePressed == true)) {
    stroke(237.15,201.45,175.95,15);
    strokeWeight(60);
    line (mouseX, mouseY, pmouseX, pmouseY);
    println("dessert sand");
  } else {
    }
  if ((keyPressed == true) && ((key == 'e') || (key == 'E')) 
  && (mousePressed == true)) {
    fill(96.9,63.75,81.6,5);
    noStroke();
    triangle ( mouseX, pmouseX, mouseY, pmouseY, mouseY+20, mouseX+10);
    println("eggplant");
  } else {
    }
  if ((keyPressed == true) && ((key == 'f') || (key == 'F')) 
  && (mousePressed == true)) {
    stroke(255,0,255,15);
    strokeWeight(15);
    line (mouseX, mouseY,pmouseX, pmouseY);
    println("fuscia");
  } else {
    }
  if ((keyPressed == true) && ((key == 'g') || (key == 'G')) 
  && (mousePressed == true)) {
    stroke(0,127.5,0,5);
    strokeWeight(75);
    noFill();
    line (mouseX, mouseY,pmouseX, pmouseY);
    println("green");
  } else {
    }
  if ((keyPressed == true) && ((key == 'h') || (key == 'H')) 
  && (mousePressed == true)) {
    fill(216.75,145.35,0,5);
    noStroke();
    quad (mouseX-100, mouseY-25,pmouseX+10, pmouseY-40, mouseX+30, mouseY+150, pmouseX-20, pmouseY-5);
    println("harvest gold");
  } else {
    }
  if ((keyPressed == true) && ((key == 'i') || (key == 'I')) 
  && (mousePressed == true)) {
    stroke(0,63.75,107.1,5);
  strokeWeight(20);
    noFill();
    quad ( mouseX+30, mouseY-20,pmouseX+10, pmouseY-40, mouseX+15, mouseY+150, pmouseX-20, pmouseY-5);
    println("indigo");
  } else {
    }
  if ((keyPressed == true) && ((key == 'j') || (key == 'J')) 
  && (mousePressed == true)) {
    stroke(0,168.3,107.1,5);
strokeWeight(100);
    noFill();
    quad ( mouseX+50, mouseY-30,pmouseX+20, pmouseY-60, mouseX+30, mouseY+30, pmouseX-50, pmouseY-5);
    println("jade");
  } else {
    }
  if ((keyPressed == true) && ((key == 'k') || (key == 'K')) 
  && (mousePressed == true)) {
    stroke(76.5,186.15,22.95,5);
    strokeWeight(100);
    noFill();
    quad ( mouseX+100, mouseY-50,pmouseX, pmouseY-100, mouseX+50, mouseY+50, pmouseX-70, pmouseY-5);
    println("kelly green");
  } else {
    }
  if ((keyPressed == true) && ((key == 'l') || (key == 'L')) 
  && (mousePressed == true)) {
    fill(181.05,124.95,219.95,5);
    noStroke();
    quad ( mouseX+100, mouseY-150,pmouseX, pmouseY, mouseX+300, mouseY+150, pmouseX-70, pmouseY-120);
    println("lavender");
  } else {
    }
  if ((keyPressed == true) && ((key == 'm') || (key == 'M')) 
  && (mousePressed == true)) {
    fill(127.5,0,0,5);
    noStroke();
    quad ( mouseX+100, mouseY-50,pmouseX, pmouseY, mouseX+50, mouseY+50, pmouseX-70, pmouseY-120);
    println("magenta");
  } else {
    }
  if ((keyPressed == true) && ((key == 'n') || (key == 'N')) 
  && (mousePressed == true)) {
    stroke(0,0,127.5,5);
     strokeWeight(75);
    noFill();
    ellipse ( mouseX, mouseY,275,125 );
    println("navy");
  } else {
    }
  if ((keyPressed == true) && ((key == 'o') || (key == 'o')) 
  && (mousePressed == true)) {
    stroke(255,127.5,0,5);
    strokeWeight(25);
    noFill();
    ellipse ( mouseX, mouseY,200, 100);
    println("orange");
  } else {
    }
  if ((keyPressed == true) && ((key == 'p') || (key == 'P')) 
  && (mousePressed == true)) {
    stroke(247.35,127.5,191.25,5);
    strokeWeight(100);
    noFill();
    ellipse ( mouseX+100, mouseY+100,300, 1000);
    println("pink");
  } else {
    }
  if ((keyPressed == true) && ((key == 'q') || (key == 'Q')) 
  && (mousePressed == true)) {
    stroke(175,175,210,5);
    strokeWeight(50);
    noFill();
    ellipse ( mouseX-100, mouseY-100,200, 300);
    println("quartz");
  } else {
    }
  if ((keyPressed == true) && ((key == 'r') || (key == 'R')) 
  && (mousePressed == true)) {
    fill(255,0,0,5);
    noStroke();
    ellipse ( mouseX-20, mouseY-20,130, 40);
    println("red");
  } else {
    }
  if ((keyPressed == true) && ((key == 's') || (key == 'S')) 
  && (mousePressed == true)) {
    fill(255,145.35,104.55,5);
    noStroke();
    quad ( mouseX-150, mouseY-150,pmouseX+200, pmouseY-50, mouseX+100, mouseY+100, pmouseX-200, pmouseY+200);
    println("salmon");
  } else {
    }
  if ((keyPressed == true) && ((key == 't') || (key == 'T')) 
  && (mousePressed == true)) {
    stroke(0,127.5,127.5,5);
    strokeWeight(25);
    noFill();
    quad ( mouseX-20, mouseY-30,pmouseX+40, pmouseY-70, mouseX+60, mouseY+10, pmouseX-20, pmouseY+15);
    println("teal");
  } else {
    }
  if ((keyPressed == true) && ((key == 'u') || (key == 'U')) 
  && (mousePressed == true)) {
    fill(63.75,102,244.8,5);
    noStroke();
    quad ( mouseX-75, mouseY-75,pmouseX+75, pmouseY-75, mouseX+75, mouseY+75, pmouseX-75, pmouseY+75);
    println("ultramarine");
  } else {
    }
  if ((keyPressed == true) && ((key == 'v') || (key == 'V')) 
  && (mousePressed == true)) {
    fill(127.5,0,255,5);
    noStroke();
    quad (mouseX, mouseY,pmouseX+50, pmouseY, mouseX+50, mouseY+50, pmouseX, pmouseY+50);
    println("violet");
  } else {
    }
  if ((keyPressed == true) && ((key == 'w') || (key == 'W')) 
  && (mousePressed == true)) {
    fill(255,255,255,5);
    noStroke();
    rect ( mouseX, mouseY,mouseX-15, mouseY-15);
    println("white");
  } else {
    }
  if ((keyPressed == true) && ((key == 'x') || (key == 'X')) 
  && (mousePressed == true)) {
    fill(114.75,135.15,119.85,10);
    noStroke();
    quad ( mouseX+100, mouseY-50,pmouseX, pmouseY, mouseX+50, mouseY+50, pmouseX-5, pmouseY-10);
    println("xanadu");
  } else {
    }
  if ((keyPressed == true) && ((key == 'y') || (key == 'Y')) 
  && (mousePressed == true)) {
    fill(255,255,0,10);
    noStroke();
    quad ( mouseX+10, mouseY-20,pmouseX+40, pmouseY+60, mouseX+30, mouseY, pmouseX-50, pmouseY-100);
    println("yellow");
  } else {
    }
  if ((keyPressed == true) && ((key == 'z') || (key == 'Z')) 
  && (mousePressed == true)) {
    stroke(0,204,168.3,5);
    strokeWeight(150);
    line ( mouseX, mouseY,pmouseX, pmouseY);
    println("zaffre");
  } else {
    }
}





