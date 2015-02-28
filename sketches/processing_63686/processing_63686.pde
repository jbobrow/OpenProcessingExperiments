
int ringNum = 20;
int backNum = 12;
int grow = 1;
float firstX = 200;
float firstY = 200;
float followX = 100;
float followY = 100;
float lngth = 40;
float minLngth = lngth;
float maxLngth = lngth + 15;
Rings ring[] = new Rings[ringNum];
int cols[][] = new int[backNum][backNum];
int moveCount = 0;
float ranY = 250;
float ranX = 250;
int loopCount = 0;

void setup() {
  size(500, 500);
  background(15);
  smooth();

  for (int i = 0; i < ring.length; i++) {
    ring[i] = new Rings(followX, followY);
  }

  for (int i = 0; i < cols.length; i++) {
    for (int j = 0; j < cols[0].length; j++) {
      cols[i][j] = 15;
    }
  }
}

void draw() {

  checkTouching();
  backgroundDisplay();
  movement();
  breathe();
  display();
}

void backgroundDisplay() {
  int squareSize = (int) width/backNum+1;

  for (int i = 0; i < cols.length; i++) {
    for (int j = 0; j < cols[0].length; j++) {
      int x = i*squareSize;
      int y = j*squareSize;
      fill(cols[i][j], 10);
      noStroke();
      rect(x, y, squareSize+1, squareSize+1);
    }
  }
}

void checkTouching()
{
  for (int n = 0; n < ringNum; n++) {
    if (ring[n] != null) {
      for (int i = 0; i < cols.length; i++) {
        for (int j = 0; j < cols[0].length; j++) {
          int squareSize = (int) width/backNum;
          float xp = i*squareSize;
          float yp = j*squareSize;

          if (dist(ring[n].x, ring[n].y, xp, yp)< lngth/2) {
            cols[i][j] = 255;
          } 
          else {
            cols[i][j] = 0;
          }
        }
      }
    }
  }
}

void movement() {
  if (moveCount == loopCount) {
    ranX = random(-250, 250);
    ranY = random(-250, 250);
    loopCount = loopCount+20;
  }
  moveCount++;
  if (mousePressed) {
    for (int i = 0; i < ring.length; i++) {
      if (i == 0) {
        firstX = firstX + (((mouseX)-firstX)/10);
        firstY = firstY + (((mouseY)-firstY)/10);
        ring[i].follow(firstX, firstY);
      }
      else {
        followX = followX + (((firstX)-followX)/(i*2));
        followY = followY + (((firstY)-followY)/(i*2));
        ring[i].follow(followX, followY);
      }
    }
  }
  else if (mousePressed == false) {
    for (int i = 0; i < ring.length; i++) {
      if (i == 0) {

        if (mouseX > (firstX-(2*lngth)) && mouseX < (firstX+(2*lngth)) && mouseY > (firstY-(2*lngth)) && mouseY < firstY+(2*lngth)) {
          if (mouseX > firstX) {
            firstX = firstX + ((((mouseX))-firstX)/30);
          }
          else {
            firstX = firstX + ((((mouseX))+ranX)/30);
          }
          
          if(mouseY > firstY){
            firstY = firstY + ((((mouseY))-firstY)/30);
          }else{
            firstY = firstY + ((((mouseY))+ranY)/30);
          }
          
          if(firstX >= width){
            firstX = width;
          }else if(firstX <= 0){
            firstX = 0;
          }
          
          if(firstY >= height){
            firstY = height;
          }else if(firstY <= 0){
            firstY = 0;
          }
          
        }
        else {
          firstX = firstX + ((((200 +ranX))-firstX)/10);
          firstY = firstY + ((((200 +ranY))-firstY)/10);
        }


        ring[i].follow(firstX, firstY);
      }
      else {
        followX = followX + (((firstX)-followX)/(i*2));
        followY = followY + (((firstY)-followY)/(i*2));
        ring[i].follow(followX, followY);
      }
    }
  }
}


void display() {

  for (int i = 0; i < ring.length; i++) {
    if (ring[i] != null) {
      ring[i].drawRing(lngth);
    }
  }
}


void breathe() {
  if (lngth > maxLngth) {
    grow = 2;
  }
  else if (lngth < minLngth) {
    grow = 1;
  }

  if (grow == 1) {
    lngth = lngth + 0.5;
  }
  else if (grow == 2) {
    lngth = lngth - 0.5;
  }
}


void mouseClicked() {
  save(frameCount+".jpg");
}

class Rings {

  float x;
  float y; 
  float diffX = 1;
  float diffY = 1;


  Rings(float i_x, float i_y) {
    x = i_x;
    y = i_y;
  }


  void drawRing(float wdth) {
    noStroke();
    int num = (int)(wdth/2.0);
    for (int i = 0; i < num; i++) {
      fill(40, 60, 155+i, i);
      ellipse(x, y, wdth-i, wdth-i);
    }
  }

  void follow(float xp, float yp)
  {
    x = x + (((xp)-x)/2);
    y = y + (((yp)-y)/2);
  }
}


