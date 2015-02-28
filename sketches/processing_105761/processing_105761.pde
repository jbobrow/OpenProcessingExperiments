
void setup() {
  size(400, 400);
  // set background color to white
  background(255);
}
//big ball
int dx = 5;
int dy = 4;

int x = 50;
int y = 50;

//rectangle

int rectY = 50;
int rectX = 150;

int drectx = 2;
int drecty = 3;


//more balls
int ballx = 200;
int bally = 300;

int dballx = 6;
int dbally = 7;


//last ball
int lastballx = 360;
int lastbally = 360;

int dlastx = 4;
int dlasty = 5;


void draw() {

  //pong rect
  fill(255);
  background(255);


  //ball
  for (int i=0; i<1; i++) {
    fill(255, 100, 200);
    ellipse(x, y+ i, 65, 65);
  }

  for (int i=0; i<1; i++) {
    fill(150, 150, 200);
    ellipse(x, y+ i, 55, 55);
  }

  for (int i=0; i<1; i++) {
    fill(0, 0, 225);
    ellipse(x, y+ i, 45, 45);
  }

  for (int i=0; i<1; i++) {
    fill(6, 255, 6);
    ellipse(x, y+ i, 35, 35);
  }

  for (int i=0; i<1; i++) {
    fill(255, 255, 6);
    ellipse(x, y+ i, 25, 25);
  }


  for (int i=0; i<1; i++) {
    fill(255, 6, 6);
    ellipse(x, y+ i, 15, 15);
    
    

    
  }

  //rectangle
  for (int i=0; i<1; i++) {
    fill(6, 255, 6);
    rect(rectX, rectY+ i, 25, 25, 5);
  }


  //more balls
  for (int i=0; i<1; i++) {
    fill(0, 0, 255);
    ellipse(ballx, bally+ i, 20, 20);
  //a ball within a ball
  for (int k=0; k<1; k++) {
    fill(255, 255, 6);
    ellipse(ballx, bally+ i, 10, 10);
    }
  }

  //last ball
  for (int i=0; i<1; i++) {
    fill(255, 0, 0);
    ellipse(lastballx, lastbally+i, 35, 35);
    
  for (int D=0; D<1; D++) {
    fill(6, 255, 6);
    ellipse(lastballx, lastbally+ i, 25, 25);
    
  for (int Z=0; Z<1; Z++) {
    fill(255, 255, 6);
    ellipse(lastballx, lastbally+ i, 15, 15);
  }
  }
  }

  //big ass ball
  x = x + dx;
  y = y + dy;

  //individual rect
  rectX = rectX + drectx;
  rectY = rectY + drecty;

  //more balls
  bally = bally + dbally;
  ballx = ballx + dballx;

  //last ball
  lastbally = lastbally + dlasty;
  lastballx = lastballx + dlastx;



  //for the big ball
  if ( x < 10 || x > 380) {
    dx = -1 * dx;
  }
  if ( y < 10 || y > 385) {
    dy = -1 * dy;
  }


  //more balls

  if ( ballx < 10 || ballx > 380) {
    dballx = -1 * dballx;
  }
  if ( bally < 10 || bally > 385) {
    dbally = -1 * dbally;
  }

  //for the individual rect

  if ( rectX < 10 || rectX > 380) {
    drectx = -1 * drectx;
  }
  if ( rectY < 10 || rectY > 385) {
    drecty = -1 * drecty;
  }

  //last ball
  if ( lastballx < 10 || lastballx > 380) {
    dlastx = -1 * dlastx;
  }
  if ( lastbally < 10 || lastbally > 385) {
    dlasty = -1 * dlasty;
  }
}

