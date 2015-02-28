
PVector locationRectBelow;
PVector locationRectAbove;
PVector velocityRect;
PFont font;
int numLives=3;
int count=1;
float w = 500;
float h = 500;
float cx = 80;
float cy = h/2;
float rectHeight=.2*h;
float rectWidth=w*2/4;
float radius = 10;
boolean follow=false;
boolean start = false;
boolean gameOver;
boolean win = false;
boolean restart=false;

void setup() {
  size(int(w), int(h));
  smooth();
  background(255);
  locationRectBelow = new PVector(width*.2, height*.5);
  locationRectAbove= new PVector(width*.2, height*.5-rectHeight);
  velocityRect = new PVector(0, 5);
  font = loadFont("APIPHONTIQUE-Bold-48.vlw");
}
void draw() {
  frameRate(20);
  if (start == false&&numLives==3&&win==false) {
    background(255);
    textFont(font);
    fill(24, 60, 150);
    text("Click to Play!", 100, 55);
  }
  if (start==true&&numLives>0&&!gameOver) {
    noStroke();
    background(255);
    fill(204, 102, 0);
    rect(width*.2-6*radius, height/2-radius*5, 6*radius, radius*5*2);
    //   100-60=40, 250-50=200, 60, 50

    rect(width*.2-6*radius+rectWidth+6*radius, height/2-radius*5, 6*radius, radius*5*2);
    textFont(font, 15);
    fill(24, 60, 150);
    text("<=Destination!", width*.2-6*radius+rectWidth+6*radius+6*radius, 250);


    fill(0);
    drawRect();
    drawBall();

    checkCollision();
    checkWin();
    fill(220, 	20, 	60);
    textFont(font, 30);

    if (numLives>=2) {
      text("lives " + numLives, 10, 40);
    } 
    else {
      text("life " + numLives, 10, 40);
    }
  }
  textFont(font, 20);
      fill(#008B45);

  if (gameOver && numLives>0) {
    text("You only have " + numLives + " more lives left! Let's try again! ", 0, 100);
  }
  if (gameOver && numLives==0) {
    text("You have used all of your lives! \n Thank you for playing!", 20, 80);
  }
  restart=false;
}


void checkCollision() {
  if (((cy<=locationRectAbove.y+rectHeight||cy>=locationRectBelow.y)&&cx==width*.2-radius)||
    (cx>width*.2-radius&&cx<width*.2&&dist(cx, cy, locationRectAbove.x, locationRectAbove.y+rectHeight)<=radius||dist(cx, cy, locationRectBelow.x, locationRectBelow.y)<=radius)||
    ((abs(cy-(locationRectAbove.y+rectHeight))<=radius||abs(cy-locationRectBelow.y)<=radius)&&cx>width*.2)
    ) {
    gameOver();
  }
}


void mouseClicked() {
  start=true;
  if (gameOver) {
    gameOver=false;
    cy = height/2;
    cx = 80;
    restart=true;
    locationRectBelow.x=width*.2;
    locationRectBelow.y=height*.5;
    locationRectAbove.x=width*.2;
    locationRectAbove.y=height*.5-rectHeight;
  }
}

void gameOver() {
  gameOver=true;
  numLives--;
  start=false;
}

void checkWin() {
  if (cx>width*.2+rectWidth+20) {
    win = true;
    start=false;

    textFont(font, 30);
    fill(24, 60, 150);
    text("Congradulations! You have won! ", 0, 100);
    return;
  }
}

boolean checkOutOfBound(float x, float y) {

  if (x<width*.2-radius*6+radius||x<width*.2-radius&&(y<=height/2-radius*5+radius||y>height/2+radius*5-radius)) {
    // cx<=100-50=50 || cx <=100-10=90 && ( cy>=250-50+10=210      ||  cy<=          250+50-10=290)
    return true;
  }
  return false;
}

void drawBall() {

  if (!mousePressed) {
    follow=false;
  }

  if (mousePressed&&(dist(mouseX, mouseY, cx, cy)<radius||follow)) {
    if (!checkOutOfBound(cx, cy)) {
      follow=true;
      cx=mouseX;
      cy=mouseY;
    } 
    else {
      if (mousePressed&&dist(mouseX, mouseY, cx, cy)<radius&&!checkOutOfBound(mouseX, mouseY)) {

        cx=mouseX;
        cy=mouseY;
      }
    }
  }
  ellipse(cx, cy, radius*2, radius*2);
}

void drawRect() {
  if (locationRectBelow.y>=height/2&&locationRectBelow.y<height*3/5&&count==1) {
    locationRectBelow.add(velocityRect);
    locationRectAbove.sub(velocityRect);
  }
  if (locationRectBelow.y==height/2||locationRectBelow.y==height*3/5) {
    count*=-1;
  }
  if (count==-1||locationRectBelow.y>height*3/5) {
    locationRectBelow.sub(velocityRect);
    locationRectAbove.add(velocityRect);
  }
  rect(locationRectBelow.x, locationRectBelow.y, rectWidth, rectHeight);
  rect(locationRectAbove.x, locationRectAbove.y, rectWidth, rectHeight);
}


