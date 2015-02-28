
int lastKeyPressed;
int currentKeyPressed;

void setup() {
  size(550, 500);
  background(0);
  textSize(30);
}

void draw() {

  int i = 0;

  while (++i<10) {
  int j=0;
  
    while (++j<10) {

      fill(255);
      if (i == 1 && currentKeyPressed == j) {
        fill(0, 255, 0);
      }

      else if (j == 1 && lastKeyPressed == i) {
        fill(0, 255, 0);
      }  

      if (j == currentKeyPressed && i == lastKeyPressed) {       
        fill(255, 0, 0);
      }
      text(i*j, j*50, i*50);

    }
  }
}

  void keyReleased() {
    lastKeyPressed=currentKeyPressed; 
    println("last="+currentKeyPressed);
    currentKeyPressed = keyCode -48;
    println("current="+currentKeyPressed);
  }


