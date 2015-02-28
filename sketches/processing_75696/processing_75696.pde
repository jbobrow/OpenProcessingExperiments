
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/74979*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
boolean t;
int prevK;
int currK;

void setup() {
  size(420, 420);
  smooth();
}

void draw() {
  int i = 1;
  int j = 1;

  background(0);
  textAlign(CENTER);

  while (i<10) {
    while (j<10) {
      if ((i==1)&&(j==currK)) {
        fill(0, 255, 0);
      }
      else if ((j==1)&&(i==prevK)) {
        fill(0, 255, 0);
      }
      else {
        fill(255);
      }
      
      if ((i*j==prevK*currK)&&(i==prevK)&&(j==currK)) {
        fill(255, 0, 0);
      }
      
      text(i*j, 40*i, 40*j);
      j++;
    }
    j = 1;
    i++;
  }
}

void keyReleased() {

  if ((keyCode >= 49)&&(keyCode <= 57)&&(t==false)) {
    prevK = keyCode -48;
  }

  if ((keyCode >= 49)&&(keyCode <= 57)&&(t==true)) {
    currK = keyCode -48;
  }

  if ((keyCode >= 97)&&(keyCode <= 105)&&(t==false)) {
    prevK = keyCode -96;
  }

  if ((keyCode >= 97)&&(keyCode <= 105)&&(t==true)) {
    currK = keyCode -96;
  }

  t=!t;
  println(t);
}


