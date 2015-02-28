
float x=0;
float y=0;
int m=2;
int m1=2;
float a = 45;
float a1 = 45;
float b = 0;
float c = 0;
float d =0;
float x1=0;
float y1=0;
float redValue =0;
float blueValue = 0;
float greenValue = 0;
float redValue1 =0;
float blueValue1 = 0;
float greenValue1 = 0;
float redValue2 =0;
float blueValue2 = 0;
float greenValue2 = 0;

void setup() {
  size(600, 600);
  colorMode(HSB, 255);
  x=random(300);
  y=random(300);
  x1=random(300);
  y1=random(300);
  noStroke();
  frameRate(25);  
}

void draw() {
  //fill(0, 10);
  if (redValue1 == 255) {
    redValue1 = 1;
  }
  if (blueValue1 == 255) {
    blueValue1 = 1;
  }
  if (greenValue1 == 255) {
    greenValue1 = 1;
  }
  redValue1+=1;
  blueValue1+=1;
  greenValue1+=1;
  fill(redValue1, blueValue1, greenValue1, 20);
  rect(0, 0, width, height);


  shape1();
  circle();


}
void shape1() {
  if (redValue == 255) {
    redValue = 2;
  }
  if (blueValue == 255) {
    blueValue = 4;
  }
  if (greenValue == 255) {
    greenValue = 6;
  }
  redValue+=1;
  blueValue+=3;
  greenValue+=5;
  fill(redValue, blueValue, greenValue);
  rect(x, y, 20, 20); 
  x+=cos(radians(a)*random(10));
  y+=sin(radians(a)+random(20));
  a+=random(100);
  
  // whenever the square hits the edge of the screen 'boing' will be displayed on the screen
  if (y>width) {
    m=m*(+1);
    fill(redValue, blueValue, greenValue);
    text("BOING!!", random(600), random(600));
  }

  if (x<0) {
    m=m*(-1);
    fill(redValue, blueValue, greenValue);
    text("BOING!!", random(600), random(600));
  }

  x+=m;

  if (x>height) {
    m=m*(-1);
    fill(redValue, blueValue, greenValue);
    text("BOING!!", random(600), random(600));
  }

  if (y<0||y>width) {
    m=m*(-1);
    fill(redValue, blueValue, greenValue);
    text("BOING!!", random(600), random(600));
  }
  y+=m;
}

void circle() {
  if (redValue2 == 255) {
    redValue2 = 1;
  }
  if (blueValue2 == 255) {
    blueValue2 = 9;
  }
  if (greenValue == 255) {
    greenValue2 = 2;
  }
  redValue2+=1;
  blueValue2+=2;
  greenValue2+=4;
  fill(redValue2, blueValue2, greenValue2);
  ellipse(x1, y1, 20, 20); 
  x1+=cos(radians(a1)*random(10));
  y1+=sin(radians(a1)+random(20));
  a1+=random(100);

// whenever the circle hits the edge of the screen 'boing' will be displayed on the screen
  if (y1>width) {
    m1=m1*(+1);
    fill(redValue2, blueValue2, greenValue2);
    text("BOING!!", random(600), random(600));
  } 

  if (x1<0) {
    m1=m1*(-1);
    fill(redValue2, blueValue2, greenValue2);
    text("BOING!!", random(600), random(600));
  }

  x1-=m1;

  if (x1>height) {
    m1=m1*(-1);
    fill(redValue2, blueValue2, greenValue2);
    text("BOING!!", random(600), random(600));
  }

  if (y1<0||y1>width) {
    m1=m1*(-1);
    fill(redValue2, blueValue2, greenValue2);
    text("BOING!!", random(600), random(600));
  }

  y1+=m1;
}


