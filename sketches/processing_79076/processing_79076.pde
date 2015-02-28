
String[] combo = {
  "null", "null", "null", "null"
};

int start;
int end;
int l;
int timer;
int pos = 0;
String text1 = " ";
boolean reset = false;
boolean done = false;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  background(255);

  fill(0);
  text(text1, 20, 20, width, height);
  timer++;
  //println(timer);

  if (pos > 3) {
    done = true;
  }
  
  if (timer > 50 && timer < 120) {
    done = true;
  }

  if ( timer > 120) {
    text1 = text1 + " ";
    timer = 0;
  }

  if (done) {
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "A";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "dot") {
      text1 = text1 + "B";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dash" && combo[3] == "dot") {
      text1 = text1 + "C";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "null") {
      text1 = text1 + "D";
    }
    if (combo[0] == "dot" && combo[1] == "null" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "E";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "dash" && combo[3] == "dot") {
      text1 = text1 + "F";
    }
    if (combo[0] == "dash" && combo[1] == "dash" && combo[2] == "dot" && combo[3] == "null") {
      text1 = text1 + "G";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "dot") {
      text1 = text1 + "H";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "I";
    }
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "dash" && combo[3] == "dash") {
      text1 = text1 + "J";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dash" && combo[3] == "null") {
      text1 = text1 + "K";
    }
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "dot" && combo[3] == "dot") {
      text1 = text1 + "L";
    }
    if (combo[0] == "dash" && combo[1] == "dash" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "M";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "N";
    }
    if (combo[0] == "dash" && combo[1] == "dash" && combo[2] == "dash" && combo[3] == "null") {
      text1 = text1 + "O";
    }
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "dash" && combo[3] == "dot") {
      text1 = text1 + "P";
    }
    if (combo[0] == "dash" && combo[1] == "dash" && combo[2] == "dot" && combo[3] == "dash") {
      text1 = text1 + "Q";
    }
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "dot" && combo[3] == "null") {
      text1 = text1 + "R";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "null") {
      text1 = text1 + "S";
    }
    if (combo[0] == "dash" && combo[1] == "null" && combo[2] == "null" && combo[3] == "null") {
      text1 = text1 + "T";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "dash" && combo[3] == "null") {
      text1 = text1 + "U";
    }
    if (combo[0] == "dot" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "dash") {
      text1 = text1 + "V";
    }
    if (combo[0] == "dot" && combo[1] == "dash" && combo[2] == "dash" && combo[3] == "null") {
      text1 = text1 + "W";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dot" && combo[3] == "dash") {
      text1 = text1 + "X";
    }
    if (combo[0] == "dash" && combo[1] == "dot" && combo[2] == "dash" && combo[3] == "dash") {
      text1 = text1 + "Y";
    }
    if (combo[0] == "dash" && combo[1] == "dash" && combo[2] == "dot" && combo[3] == "dot") {
      text1 = text1 + "Z";
    }
    reset = true;
  }
  if (reset) {
    //println("reset");
    for (int i = 0; i < 4; i++) {
      combo[i] = "null";
      pos = 0;
    }
    reset = false;
    done = false;
    //timer = 0;
  }
}

void mousePressed() {
  start = millis();
  timer = 0;
}

void mouseReleased() {
  end = millis();
  l = end - start;
  if (l > 1 && l < 200) {
    combo[pos] = "dot"; 
    pos++;
  }
  if (l > 201 && l < 600) {
    combo[pos] = "dash"; 
    pos++;
  }
  //println(combo);
}
