
int BOX_COUNT = 10;

int DISPLAY_WIDTH = 500;
int DISPLAY_OFFSET = 50;

int pos = 5;
int direction = 1;

void setup() {
  size(600, 300);
  smooth(); 
  background(0);
  frameRate(10);
  translate(DISPLAY_OFFSET, 0);  
}

void draw() {

  fill(0, 0, 0, 60);
  rect(0, 0, width, height);
  
  fill(255, 0, 0);
  int tmpWidth = DISPLAY_WIDTH / BOX_COUNT;
  int tmpHeight = int(height * .40);
  
  int posX = tmpWidth * pos;
  int posY = (height - tmpHeight) / 2;
  rect(posX, posY, tmpWidth, tmpHeight);

  if ( pos >= 0 && pos <= BOX_COUNT ) {
    fill(255, 0, 0, 120);
    posX = tmpWidth * (pos-direction);
    rect(posX, posY, tmpWidth, tmpHeight);
  }
  
  if ( pos+direction > BOX_COUNT || pos+direction <= 0 ) {
    direction *= -1;
  }  
  pos += direction;
}

