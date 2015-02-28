
String theKey1 = "a";
String theKey2 = "0";
color col1;
color col2;
color col3;
boolean on1=true;
boolean on2=true;
int layer=1;



void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 255);
  smooth();
  background(360);
  //background(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
  noStroke();
  PFont font;
  font = loadFont("CamilleBD-200.vlw");
  textFont(font);
  textSize(200);
  col1=color(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
  col2=color(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
  col3=color(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
}

void draw() {
  background(360);
  /*if (key == CODED) {
    if (keyCode == CONTROL) {
      background(col3);
    }
  }*/
  if (on1) {
    layerit(theKey1, col1, TWO_PI*mouseX/width);
  }
  if (on2) {
    layerit(theKey2, col2, TWO_PI*mouseY/width);
  }
  
}

void mousePressed() {
  //background(col3);
  if (layer==1) {
    col1=color(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
  } 
  else {
    col2=color(random(0, 255), random(20, 85), random(55, 90), random(200, 220));
  }
}

//function for when key is pressed
void keyPressed() {
  if (key == ENTER || key == RETURN) {
    println("saved");
    save("camille-"+ year() + month()+ day() + hour() + minute() + second()+".tiff");
  }

  // switvh wich layer to control
  if (key == CODED) {
    if (keyCode == RIGHT) {
      layer = 2;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      layer = 1;
    }
  }

  // turn layers on and off 
  if (key == CODED) {
    if (keyCode == UP) {
      if (layer==1) {
        on1 = true;
      } 
      else {
        on2=true;
      }
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      if (layer==1) {
        on1 = false;
      } 
      else {
        on2=false;
      }
    }
  }

  if (key == CODED) {
    if (keyCode == SHIFT) {
      textSize(260);
    }
  }

  if (key == CODED) {
    if (keyCode == ALT) {
      textSize(200);
    }
  }
  
  /*if (key == CODED) {
    if (keyCode == CONTROL) {
      background(col3);
    }
  }*/

  
  // switch letters
  if ((key>=32) && (key<=126)) {
    if (layer==1) {
      theKey1 =Character.toString(key);
    } 
    else {
      theKey2 =Character.toString(key);
    }
  }
}

//function for drawing layer
void layerit(String ltr, color clr, float ang) {
  fill(clr);
  for (int i=-5;i<=width+50;i=i+95) {
    for (int j=-5; j<=height+50; j=j+95) {
      pushMatrix();
      rotLetter (ltr, i, j, ang);
      popMatrix();
    }
  }
}

// function for drawing rotated letter
void rotLetter(String l, int x, int y, float ang) {
  pushMatrix(); // save state
  textAlign(CENTER); // center letter horiz
  translate(x, y); // move to position
  rotate(ang); // rotate
  // draw char centered on acsender
  // this will work for most Caps, and some lc letters
  // but it will not allways vert center letters
  text(l, 0, textAscent()/2);
  popMatrix(); // return to saved coordinate matrix
}


