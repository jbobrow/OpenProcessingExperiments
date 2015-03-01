
int k = 1;
int currentTime=0;


void setup() {
  size(300, 600);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(25);
}

void draw() {

  //------------01--------

  for (int y=0; y<height/2; y++) {
    float col= map(y, 0, height/2, 50, 0);
    stroke(600, col, 90);
    line(0, y, width, y);
  }
  //-------02----------

  for (int y1=height/2; y1<height; y1++) {
    float col= map(y1, 400, height, 0, 50);
    stroke(60, col, 90);
    line(0, y1, width, y1);
  }
  //-------03------

  for (int y1=height/4; y1<height/2; y1++) {
    float col1= map(y1, height/4, height/2, 20, 100);
    stroke(167, 37, 75, col1);
    line(0, y1, width, y1);
  }

  for (int y1=height/2; y1<height*3/4; y1++) {
    float col1= map(y1, height/2, height*3/4, 100, 20);
    stroke(167, 37, 75, col1);
    line(0, y1, width, y1);
  }


  //---------timer-------------


  // while(time1<100000) {

  //for(i=-100; i<2000; i
  int time1 = millis();
  int time = (time1-currentTime);

  // println(time);




  if (time >= 1000)
  {
    wave(height/4);
    //currentTime=time1;
  }
}

//////////// USER's //////////////////////
//----------wave------------


void wave(int y1)
{
  pushMatrix();
  translate(0, y1+k);
  for (float y=0; y<k*3; y=y+k*0.5) {

    strokeWeight(3);
    stroke(int(random(180, 220)), 60, 55, 50);
    noStroke();
    float a = sq(300);   // Sets 'a' to 1
    float b = sq(300);  // Sets 'b' to 25
    float c = sq(300);   // Sets 'c' to 81
    float d = sq(300); // Sets 'd' to 100
    float e = sq(300);  // Sets 'e' to 110
    float f = sq(300); // Sets 'f' to 120
    float g = sq(300); // Sets 'g' to 130
    float h = sq(300);  // Sets 'h' to 140
    float i = sq(300); // Sets 'i' to 150
    float j = sq(300);  // Sets 'j' to 160
    rect(0, 25, a, 10);
    rect(0, 45, b, 10);
    rect(0, 65, c, 10);
    rect(0, 85, d, 10);
    rect(0, 105, e, 10);
    rect(0, 125, f, 10);
    rect(0, 145, g, 10);
    rect(0, 165, h, 10);
    rect(0, 185, i, 10);
    rect(0, 205, j, 10);
    //delay_ms(10);
  }
  popMatrix();
  k++;
  if (k>height/4)  k=1;
}

