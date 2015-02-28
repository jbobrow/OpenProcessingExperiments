
/*Nafis S Sabir
 Prof. Calli Higgins
 HW 4.1*/
int state = 0;
int x = 300;//rect x location
float y = random(500);//random rect y location
int speed = 2;//x-axis speed change
int bounce = 2;//y-axis speed change
int bspeed = 2;//x-axis speed change
int bbounce = 2;//y-axis speed change
int tspeed = -2;//x-axis speed change
int tbounce = -2;//y-axis speed change
int qspeed = -3;//x-axis speed change
int qbounce = -3;//y-axis speed change
int rx = 100;//ball x
int ry = 500;//ball y
int rw = 100;//ball width
int rh = 100;//ball height
int w1 = 100;//width of small square
int h1 = 100;//height of small square
//int w2 = 300;//width of small square
//int h2 = 300;//height of small square
int tx1 = 200;//traingle x1
int ty1 = 200;//triangle y1
int tx2 = 320;//triangle x2
int ty2 = 100;//triangle y2
int tx3 = 350;//triangle x3
int ty3 = 300;//triangle y3
int qx1 = 200;//quad x1
int qy1 = 231;//quad y1
int qx2 = 320;//quad x2
int qy2 = 210;//quad y2
int qx3 = 363;//quad x3
int qy3 = 350;//quad y3
int qx4 = 210;//quad x4
int qy4 = 356;//quad y4

float color1 = random(50);//random float color
boolean button = false;


void setup() {
  size(600, 600);//screen size
}

void draw() {
  if (!button) {
    background(0);
    state = 0;
  }
  else if (mousePressed) {//background change on mousepress isn't working completely had issues with button and mousePress
    background(0, 255, 0);
    state = 1;
  }
  else if (state == 1) {

    state = 2;
  }
  else if (state == 2) {
    background(0, 0, 255);
  }
  else if (button) {
    state = 3;
  }
  else if (state == 3) {
    background(155, 255, 0);
  }
  else if (!button) {
    state = 4;
  }
  else if (state == 4) {
    background(138, 0, 255);
  }
  else if (button) {
    state = 0;
  }






  if ((button) && (mouseX > x && mouseX < x + w1 && mouseY > y && mouseY < y + h1)) { //stops the square when button is pressed
    rx = rx + bspeed;//moves the ball left and right
    ry = ry + bbounce;//moves the ball up and down
    tx1 = tx1 + tspeed;//moves the triangle left and right
    ty1 = ty1 + tbounce;//moves the triangle up and down
    tx2 = tx2 + tspeed;//moves the triangle left and right
    ty2 = ty2 + tbounce;//moves the triangle up and down
    tx3 = tx3 + tspeed;//moves the triangle left and right
    ty3 = ty3 + tbounce;//moves the triangle up and down
    qx1 = qx1 + qspeed;//moves the quad left and right
    qy1 = qy1 + qbounce;//moves the quad up and down
    qx2 = qx2 + qspeed;//moves the quad left and right
    qy2 = qy2 + qbounce;//moves the quad up and down
    qx3 = qx3 + qspeed;//moves the quad left and right
    qy3 = qy3 + qbounce;//moves the quad up and down
    qx4 = qx4 + qspeed;//moves the quad left and right
    qy4 = qy4 + qbounce;//moves the quad up and down
  } 
  /*else if ((button) && (mouseX > width && mouseX < rx + rw && mouseY > height && mouseY < ry + rh)) {
   rx = rx;//fill(255, 150, 100);//if keyPressed random color change depending on mouse location
   x = x + speed;
   y = y + bounce; //ellipse(rx,ry, rw, rh);//if keyPressed ball grows //BALL CODE I COULDN'T GET TO WORK
   rx = rx + bspeed;//moves the ball left and right
   ry = ry + bbounce;//moves the ball up and down
   } */
  else {

    x = x + speed;//moves the square left and right
    y = y + bounce;//moves the square up and down
    rx = rx + bspeed;//moves the ball left and right
    ry = ry + bbounce;//moves the ball up and down
    tx1 = tx1 + tspeed;//moves the triangle left and right
    ty1 = ty1 + tbounce;//moves the triangle up and down
    tx2 = tx2 + tspeed;//moves the triangle left and right
    ty2 = ty2 + tbounce;//moves the triangle up and down
    tx3 = tx3 + tspeed;//moves the triangle left and right
    ty3 = ty3 + tbounce;//moves the triangle up and down
    qx1 = qx1 + qspeed;//moves the quad left and right
    qy1 = qy1 + qbounce;//moves the quad up and down
    qx2 = qx2 + qspeed;//moves the quad left and right
    qy2 = qy2 + qbounce;//moves the quad up and down
    qx3 = qx3 + qspeed;//moves the quad left and right
    qy3 = qy3 + qbounce;//moves the quad up and down
    qx4 = qx4 + qspeed;//moves the quad left and right
    qy4 = qy4 + qbounce;//moves the quad up and down
  }





  fill(255);//starting fill for square
  rect(x, y, w1, h1);//square size
  fill(143, 57, 200);//ball color
  ellipse(rx, ry, rw, rh);//ball dimensions
  fill(155, 210, 255);//triangle color
  triangle(tx1, ty1, tx2, ty2, tx3, ty3);//triangle dimensions
  fill(205, 150, 55);//quad color
  quad(qx1, qy1, qx2, qy2, qx3, qy3, qx4, qy4);//quad dimensions


  if (x > width * .84) {//keeps square from exceeding width
    speed = speed * -1;//if the square touches the right boundary it changes direction
  }
  else if (x < 0) { 
    speed = speed * -1;//if the square touches the left boundary it changes direction
  } 
  else if (y > height *.84) {//keeps square from touches height
    bounce = bounce * -1;//if the square touches the top boundary it changes direction
  } 
  else if (y < 0) {
    bounce = bounce * -1;//if the square touches the bottom boundary it changes direction
  }
  if (rx > width * .92) {
    bspeed = bspeed * -1;//if the ball touches the right boundary it changes direction
  }
  else if (rx < 0) { 
    bspeed = bspeed * -1;//if the ball touches the left boundary it changes direction
  } 
  else if (ry > height *.92) {
    bbounce = bbounce * -1;//if the ball touches the top boundary it changes direction
  } 
  else if (ry < 0) {
    bbounce = bbounce * -1;//if the ball touches the bottom boundary it changes direction
  }
  if (tx3 > width) {
    tspeed = tspeed * -1;//if the triangle touches the right boundary it changes direction
  }
  else if (tx1 < 0) { 
    tspeed = tspeed * -1;//if the triangle touches the left boundary it changes direction
  } 
  else if (ty3 > height) {
    tbounce = tbounce * -1;//if the striangle touches the top boundary it changes direction
  } 
  else if (ty2 < 0) {
    tbounce = tbounce * -1;//if the triangle touches the bottom boundary it changes direction
  }
  if (qx3 > width) {
    qspeed = qspeed * -1;//if the quad touches the right boundary it changes direction
  }
  else if (qx1 < 0) { 
    qspeed = qspeed * -1;//if the quad touches the left boundary it changes direction
  } 
  else if (qy4 > height) {
    qbounce = qbounce * -1;//if the quad touches the top boundary it changes direction
  } 
  else if (qy2 < 0) {
    qbounce = qbounce * -1;//if the quad touches the bottom boundary it changes direction
  }
}


void mousePressed() {

  button = !button;//changes button state to false
}




