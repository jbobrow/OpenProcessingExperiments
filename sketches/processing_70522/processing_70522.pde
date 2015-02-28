
int k = 1;
int currentTime=0;


void setup() {
  size(300, 600);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(25);
}


void draw() {

  //------------sky--------

  for (int y=0; y<height/2; y++) {
    float col= map(y, 0, height/2, 50, 0);
    stroke(191, col, 90);
    line(0, y, width, y);
  }


  //--------sand----------

  for (int y=height/2; y<height; y++) {
    float col= map(y, 400, height, 0, 50);
    stroke(47, col, 90);
    line(0, y, width, y);
  }

  //-------ocean-stable------

  for (int y=height/4; y<height/2; y++) {
    float col1= map(y, height/4, height/2, 20, 100);
    stroke(167, 37, 75, col1);
    line(0, y, width, y);
  }

  for (int y=height/2; y<height*3/4; y++) {
    float col1= map(y, height/2, height*3/4, 100, 20);
    stroke(167, 37, 75, col1);
    line(0, y, width, y);
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
  
  
  int time2 = millis();
  int time3 = (time2-currentTime);
  // println(time);
  if (time3 >= 3000)
  {
    //wave(height/4);
    wave_white((height/4)+20);
    //currentTime=time1;
  }
  
}



//////////// USER's //////////////////////
//----------wave------------


void wave(int y1)
{
  pushMatrix();
  translate(0, y1+k);
  for (float y=0; y<k*5; y=y+k*0.3) {

    strokeWeight(1);
    stroke(int(random(180, 220)), 60, 55, 50);
    line(0, y/2, width, y/2);
    delay(5);
  }
  popMatrix();
  k=k+2;
  if (k>height/4)  k=1;
}



void wave_white(int y1)
{
  pushMatrix();
  translate(0, y1+k);
  for (float y=0; y<k*2; y=y+k*0.1) {

    strokeWeight(1);
    stroke(0, 0, 90);
    line(0, y/2, width, y/2);
    delay(5);
  }
  popMatrix();
  k=k+2;
  if (k>height/4)  k=1;
}



//////////////////////////////////////////////////


