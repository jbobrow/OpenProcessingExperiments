
void setup() {
  size(700, 700);
  smooth();
  strokeWeight(2);
  background(255);
}

void draw() {
  background(255);

  int h = hour();    // Values from 0 - 23   
  int m = minute();  // Values from 0 - 59
  int s = second();  // Values from 0 - 59
  /*
  float r = map( h ,0,23,30,70);
   float g = map( m ,0,59,30,70);
   float b = map( s ,0,59,30,70);
   */

  float ra = map( h, 0, 23, 0, 360);
  float ga = map( m, 0, 59, 0, 360);
  float ba = map( s, 0, 59, 0, 360);

  translate(width/2, height/2);
  rotate( radians( -90 ) );

  stroke(255, 0, 0);
  pushMatrix();
  float aInc = 360/24;
  int hour=1;
  for (int i=0; i<360; i+= aInc ) {
    pushMatrix();
    rotate( radians(19) );
    fill(0);
    text( hour, 60, 0);
    hour+=1;
    popMatrix();

    line(45, 0, 55, 0);
    rotate( radians(aInc) );
  }
  popMatrix();

  rotate( radians( aInc*hour() ) );
  line(0, 0, 40, 0);
  translate(220, 0);


  stroke(0, 255, 0);
  pushMatrix();
  aInc = (360/60)*5;
  int min=0;
  for (int i=0; i<360; i+= aInc ) {
    pushMatrix();
    rotate( radians(4) );
    fill(0);
    text( min, 60, 0);
    popMatrix();

    min+=5;
    line(45, 0, 55, 0);
    rotate( radians(aInc) );
  }
  popMatrix();

  rotate( radians( (360/60)* minute() ) );

  line(0, 0, 40, 0);
  translate(110, 0);


  stroke(0, 0, 255);

  pushMatrix();
  aInc = 360/30;
  int sec=0;
  line(22, 0, 30, 0);
  for (int i=0; i<360; i+= aInc ) {
    fill(0);
    //  text( sec, 60,0);
    sec+=2;
    line(22, 0, 24, 0);
    rotate( radians(aInc) );
  }
  popMatrix();

  rotate( radians(aInc*second()) );
  line(0, 0, 20, 0);
  translate(80, 0);
}
