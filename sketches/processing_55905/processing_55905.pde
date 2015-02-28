

float angle;

void setup() {
  size(400,400);
  background(255);
  rectMode(CENTER);
  smooth();
}

void draw() {
  background(255);
  angle++;
  if( angle > 360 ) {
    angle-= 360;
  }
  //angle = (angle+1)60;
  //scale(0.5);
  pushMatrix();
    translate( width*0.5 , height*0.5 );
    rotate( radians(angle) );
    fill(110,40,255);
    rect( 0 , 0, 120 ,120 );
    line( 0,0,100,00);
    fill(0,0,255);
    rect( 100 , 0, 40 ,40 );
    pushMatrix();
      rotate( radians(angle) );
        line( 0,0,120,00);
        fill(0,150,200);
        rect( 120 , 0, 30 ,30 );
      pushMatrix();
        rotate( radians(angle) );
          line( 0,0,140,00);
          fill(20,120,155);
          rect( 140 , 0, 20 ,20 );
      popMatrix();
    popMatrix();
  popMatrix();
  //ellipse(0,0,50,50);
}
