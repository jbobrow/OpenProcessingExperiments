
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

  for (int y1=height/2; y1<height; y1++) {
    float col= map(y1, 400, height, 0, 50);
    stroke(47, col, 90);
    line(0, y1, width, y1);
  }

  //-------ocean-stable------

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
    line(0, y/2, width, y/2);
    //delay_ms(10);
    
    
  }
  popMatrix();
  k++;
  if (k>height/4)  k=1;
  
  
}
////////////////////////////////////////////
/*void delay_ms (int ms)
{
  int tmp=millis();
  while ((millis()-tmp)<ms)
  {
  }
 //  println (millis()-tmp);
}*/
//////////////////////////////////////////////////
