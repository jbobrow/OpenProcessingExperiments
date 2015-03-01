
int h=0;
int m=0;
int s=0;

void setup() {
  size(700, 600);
}

void draw() {
  h = int(hour());
  m = int(minute());
  s = int(second());
  
  background(0);

  translate(width/2, height/2);
  rotate( radians( -90 ) );

  stroke(0, 255, 0);
  drawHours();
  drawMins();
  drawSeconds();
}


void drawHours() {
  textFont(createFont("courier", 22) );
  pushMatrix();
  float aInc = 360/24;
  int hour=1;

  rotate( radians(17) );
  for (int i=0; i<360; i+= aInc ) {
    fill(255);
    text( hour, 200, 0);
    hour+=1;
    rotate( radians(aInc) );
  }
  popMatrix();

  rotate( radians( aInc*h ) );  
  translate(120, 0);
}

void drawMins() {
  textFont(createFont("courier", 13) );

  pushMatrix();
  float aInc = (360/60)*5;
  int min=0;
  line(65, 0, 75, 0);
  rotate( radians(4) );
  for (int i=0; i<360; i+= aInc ) {
    fill(255);
    text( min, 50, 0);
    min+=5;
    rotate( radians(aInc) );
  }
  popMatrix();

  float handPosition = (360/60)* m;
  rotate( radians( handPosition ) );

  translate(18, 0);
}

void drawSeconds() {
  float aInc = 360/60;
  line(22, 0, 30, 0);
  rotate( radians(aInc*s ) );
  line(0, 0, 20, 0);
}
