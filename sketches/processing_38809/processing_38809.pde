
float carBody=0;
float carTop=0;
float car=carBody + carTop;
float angle = 0;

float blink1=2;
float blink2=3;
float blink3=4;

void setup() {
  size(500, 500);
  smooth();
  frameRate(25);
}

//windows
void draw() {
  background(10, 23, 106);
  fill(180);
  rect(150, 80, 400, 500);
  
  //stars
pushMatrix();
rotate(angle);
stroke(250);
  strokeWeight(3);
  strokeCap(ROUND);
  fill(255);
  ellipse(mouseX*3, mouseY+50, blink1, blink1);
  ellipse(mouseX+7, mouseY-90, blink2, blink2);
  ellipse(mouseX+200, mouseY-10, blink3, blink3);
  ellipse(mouseX+mouseY, mouseY, 2, 2);
  ellipse(mouseY, mouseX, 5, 5);
  angle += .1;
  //for (int blink1; blink1
popMatrix();
noStroke();
fill(205, 245, 249);
if(mousePressed){
arc(50, 50, 30, 30, 0.5, 4);
}
else{
  arc(50, 50, 30, 30, 0, 7);
}

  for (int x=170; x<500; x+=40) {
    for (int y=100; y<500; y+=50) {

      // if ball position is > window x
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
  car=car+10;
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
                
                
