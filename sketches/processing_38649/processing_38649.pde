
int carBody=0;
int carTop=0;
int car=carBody + carTop;

int blink1=2;
int blink2=3;
int blink3=4;

void setup() {
  size(500, 500);
}

//building
void draw() {
  background(10, 23, 106);
  fill(180);
  rect(150, 80, 400, 500);
  
  //stars
pushMatrix();
stroke(250);
  strokeWeight(3);
  strokeCap(ROUND);
  fill(255);
  ellipse(20, 25, blink1, blink1);
  ellipse(58, 80, blink2, blink2);
  ellipse(46, 89, blink3, blink3);
  
  //for (int blink1; blink1
  
popMatrix();
noStroke();
//windows
  for (int x=170; x<500; x+=40) {
    for (int y=100; y<500; y+=50) {

      // if car position is > window x
      if (car>x) {
        fill(249, 255, 80);
      }
      else {
        fill(200);
      }
      // set fill to light

      // otherwise
      // set fill to dark

      rect(x, y, 20, 30);
    }
  }
fill(0);
  rect(car, 460, 100, 180); //carBody
  rect(car+20, 440, 50, 80);   //carTop
  car=car+5;
  if (car>500) {
    car=0;
  }
  fill(255);
  rect(car+50, 445, 20, 20);
  fill(180);
  ellipse(car+20, 495, 30, 30);
  ellipse(car+70, 495, 30, 30);
  fill(141, 237, 228);
  triangle(car+100, 480, car+130, 460, car+130, 490);
}

