
int frames = 24;

void setup() {
  size(450, 600);
  background(255);
  smooth();
  strokeWeight(1.5);
  PFont font;
  font = loadFont("HelveticaWorld-Regular-48.vlw");
  textAlign(RIGHT);
  textFont(font, 12);
}

float x, y1, y2, range, rangePct;
float rad1 = 0;
int density = 5;
float amp = 50;
int absDensity = abs(density);

void draw() {
  frameRate(frames);
  stroke(0, 0, 0);
  rad1 = (PI/180)*x;
  x = x + density;
  y1 = sin(rad1)*amp+(height/2);
  // stroke color measures min and max range in
  // order to determine what percentange the current value is
  // within that range.  then turns that range into a percent
  // which is then multiplied by the stroke color.
  range = (height)-((height/2)-50);
  rangePct = y1/range;
  //random line
  //line(x, y1, x, y1+random(-10,10));
  //circles
  //strokeWeight(1);
  //fill(255);
  //ellipse(x, y1, random(1, 10), random(1, 10));
  //points
  point(x, y1);

  if (x >= width) {
    density = density*-1;
  }
  else if (x <= 0) {
    density = density*-1;
    fill(0, 0, random(255));
  }
  footer();
  reset();
  
  if(keyPressed) {
    if (key == ',' || key == '<'){
    if(frames > 1){
      frames = frames - 1;
    }
    }
    if (key == '.' || key == '>'){
    frames = frames + 1;
    }
  }
}



void footer() {
  noStroke();
  fill(255);
  rect(0, (height-32), width, 32);
  fill(0);
  String xFill;
  if (x < 10) {
    xFill = "00";
  }
  else if (x < 100 && x > 9) {
    xFill = "0";
  }
  else {
    xFill = "";
  }
  
  String ampFill, ampCorrect;
  
  if (abs(amp) < 10) {
    ampFill = "00";
  } else if (abs(amp) < 100 && abs(amp) > 9) {
    ampFill = "0";
  } else {
    ampFill = "";
  } 
  
  if (amp < 0) {
    ampCorrect = "-";
  } else {
    ampCorrect = "";
  }
 
  String densityFill;

  if (abs(density) < 100 && abs(density) > 9) {
    densityFill = "";
  } else {
    densityFill = "0";
  }
  
  String varCheck = " amp:"+ampCorrect+ampFill+int(abs(amp))+" density:"+densityFill+abs(density)+" speed:"+frames;
  text(varCheck, width-10, height-10);
}

void reset() {
    if(keyPressed) {
    if (key == 'r' || key == 'R'){
      background(255);
    }
    }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      amp = amp+1;
      if (amp >= 250) {
        amp = 250;
      } else {
        amp = amp; }
    }
    if (keyCode == DOWN) {
      amp = amp-1;
    if (amp <= -250) {
        amp = -250;
      } else {
          amp = amp;
        }
    }
    if (keyCode == RIGHT) {
      if (density > 0) {
        density = density+1;
      } else {
          density = density-1;
        }
        if (density >= 15) {
          density = 15;
        }
        else if (density <= -15) {
          density = -15;
        }
      }
    if (keyCode == LEFT) {
      if (density > 0) {
        density = density-1;
     } else if (density < 0) {
          density = density+1;
     } else if (density == 0) {
          density = 0;
     }

      if (density >= 15) {
         density = 15;
        } else if (density <= -15) {
         density = -15;
        }
      }
    }
  }



