
int lowchar = 33;
int highchar = 126;
int columns;
int rows;
int[] place;
int charsize = 15;

void setup() {
  size(600, 600);
  columns = int(width/charsize);
  rows = int(height/charsize);
  place = new int[columns];
  frameRate(24);


  background(0);
  for (int i = 0; i < columns; i++) {
    place[i] = int(random(rows));
  }
}

void draw() {
  int thechar;
  char c;
  fill(0, 0, 0, 11);
  rect(0, 0, width, height);
  fill(0, 255, 0);
  for (int i = 0; i < columns; i++) {
    thechar = int(random(lowchar, highchar))+1;
    if (random(1000)>900)
    { 
      thechar = 32;
      c = char(thechar);
      fill(0, 255, 0);
      text(c, charsize*i, place[i]*charsize);
    } 
    else {
      c = char(thechar);
      fill(0, 255, 0);
      text(c, charsize*i, place[i]*charsize);
      place[i]++;
      if (place[i]>rows) {
        place[i] = 0;
      }
    }
  }
}

