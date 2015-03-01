
Elli Elli;
int r = (int) random (255);
int g = (int) random (255); 
int b = (int) random (255);
int grayScale = (int) random (45, 230);
int opacity = 80;
int[] xPos = new int[7000];
int[] yPos = new int[7000];
int transparency= 1;
int j;
void setup() {
  size (600, 600);
  frameRate(40);
  Elli = new Elli();
  noFill();
  background(#797E34);
}
void draw() {
  Elli.loop();
  Elli.path();
  j++;
  if (mousePressed) {
    fill (r, g, 255, opacity);
  }//end if
  else {
    fill (grayScale, opacity);
  }
}
void mousePressed() {
  transparency ++;
}

void keyPressed() {
  if ( key == 'w') {

    stroke(50,100,0);
    transparency --;
  }
}

//ellipse

class Elli {
  int x;
  int y;
  int i=2; 
  int j=0;
  Elli() {
    xPos[0] = (int)random(width);
    yPos[0] = (int)random(height);
    smooth();
    stroke( 33, 48, 209, transparency+5);
    ellipse(xPos[0], yPos[4], 10, 10);
  }
  void loop() {
    x = (int)random(height*3);
    y = (int)random(height/2);
    x = (int)random(width*3);
    y = (int)random(width/3);
    smooth();
    noStroke();
    fill(255, 23);
    int line = (int)random(1, 80);
    ellipse(mouseX, mouseY, line, line);

    if (i<7999|j<7999) {
      yPos[i] = y;
      yPos[5]=y;
      xPos[i] = x;

      i++;
    } else {
      i=1;
      j=0;
      background(255);
    }
  }
  //line path
  void path() {
    smooth();
    stroke(255, 25);

    line(yPos[j+1], xPos[j+1], xPos[j], yPos[j+1]);

    j++;
  }
  void mousePressed() {
    transparency +=5;
  }
}

