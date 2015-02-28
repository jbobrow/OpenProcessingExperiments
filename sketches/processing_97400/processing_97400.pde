
int frame = 0;

void setup() {

  size(400, 400);
}

void A() {
  int heightOfA = 60;
  int widthOfA = 60 ;
  int topOfA = - (heightOfA / 2) ;

  stroke(250, 80, 90);
  line(0, topOfA, - (widthOfA / 2), heightOfA / 2 );
  line(0, topOfA, (widthOfA / 2), heightOfA / 2);
  line(- (widthOfA / 4), 0, widthOfA / 4, 0);
}

void plus() {
  int heightOfPlus = 40;
  int widthOfPlus = 40 ;
  stroke(20, 80, 250);
  line( - (widthOfPlus / 2), 0, widthOfPlus / 2, 0 );
  line( 0, heightOfPlus / 2, 0, - (heightOfPlus / 2) );
}

void T() {

  int heightOfT = 60;
  int widthOfT = 60 ;
  stroke(100, 200, 150);
  line( - (widthOfT / 2), - (heightOfT / 2), widthOfT / 2, - ( heightOfT / 2 ) );
  line( 0, - (heightOfT / 2), 0, heightOfT / 2 );
}

void draw() {
  background(200);

  frame += 1;

  float angle = PI * 0.05 * frame;

  strokeWeight(10);

  pushMatrix();
  translate( - width/8 + mouseX / 2, - height/8 + mouseY / 2);
  rotate(angle/3);
  translate( width/8 , height/8);
  A();
  popMatrix();

  pushMatrix();
  translate( mouseX, mouseY );
  rotate(angle/6);
  plus();
  popMatrix();

  pushMatrix();
  translate( width/4*2 + mouseX / 2, height/4*2 + mouseY / 2 ) ;
  rotate(angle/4);
  translate( width/8 , height/8);
  T();
  popMatrix();

  if (mousePressed) {
    switch ( int( random(1, 4) ) ) {
    case 1:
      pushMatrix();
      translate( random(1, width), random (1, height) );
      A();
      popMatrix();
      break;
    case 2:
      pushMatrix();
      translate( random(1, width), random (1, height) );
      plus();
      popMatrix();
      break;
    case 3:
      pushMatrix();
      translate( random(1, width), random (1, height) );
      T();
      popMatrix();
      break;
    default :
      pushMatrix();
      translate( random(1, width), random (1, height) );
      A();
      popMatrix();
      break;
    }
  }
}
