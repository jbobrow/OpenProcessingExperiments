
boolean disT = false;
boolean disA = false;
boolean disB = false;

PFont font;
String lettersh = "";
String lettersm = "";
int h;
int m;
int t;
String time =nf(int(h),2) + ":" + nf(int(m),2);



void setup() {
  size(1000,1000);
  font = loadFont("Monospaced-48.vlw");
  textFont(font);
  stroke(255);
  fill(0);
}

void draw() {
  background(180);

  h = hour();
  m = minute();



  float cursorPosition = textWidth(lettersh)+400;
  line(cursorPosition, 445, cursorPosition, 490);
  text(lettersh, 400, 452, 60, 50); //hours text box
  text("Guess what time it is.", 190, 350);
  text(":", 453, 480);

  if (disT==true) {
    String time =nf(int(h),2) + ":" + nf(int(m),2);
    fill(0);
    text(time, 100,100);
  }
}


void keyPressed() {

  if (key == BACKSPACE) {
    if (lettersh.length() >0) {
      lettersh = lettersh.substring(0,lettersh.length()-1);
    }
  }
  else if (textWidth(lettersh+key)<width) {
    lettersh = lettersh+key;
  }
  if ((key==ENTER) || (key == RETURN)) {

    lettersh = trim(lettersh);
    println(lettersh);
    println(time);
    
    if (lettersh.equals(str(h)) == true) {
   disT = true;
    }
    if (lettersm.equals(str(m)) == true){
   disT = true;
    }
    lettersh = ""; //clear the variable
  }
  
  
  //minutes
    if (key == BACKSPACE) {
    if (lettersm.length() >0) {
      lettersm = lettersm.substring(0,lettersm.length()-1);
    }
  }
  else if (textWidth(lettersm+key)<width) {
    lettersm = lettersm+key;
  }
  if ((key==ENTER) || (key == RETURN)) {

    lettersm = trim(lettersm);
    println(lettersm);
    println(time);
    
    if (lettersm.equals(str(m)) == true) {
      disT = true;

    }
    lettersm = ""; //clear the variable
  }

  }


