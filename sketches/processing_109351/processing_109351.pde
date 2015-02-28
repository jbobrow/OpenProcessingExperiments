
//HW4
//Yingri Guan

float mX, mY, wd, ht, x, xIncrement;
boolean filled = false;
boolean freeze = false;
int mode = 0;

void setup()
{
    size( 400, 400 );  // window size
    smooth( );
    background( 255,35,187 );
    fill( 0, 223, 124 );
    wd = random( 10, 100 );
    ht = random( 10, 100 );
    x = 0;
    xIncrement = random( 1, 5);

}

void draw( )
{
   mX = mouseX;
   mY = mouseY;
  textSize(10);
  fill(255);
  text("Press keys '1,2,3' to switch between shapes", 180, 364);
  text("Press 'f' to freeze", 180, 379);
  text("Press 'BACKSPACE or DELETE' to freeze", 180, 393);

   noFill();
  stroke( random( 255 ), random(255), random(255) );
  ellipse( mX, mY, random(0,30), random(0,30));
  if (mode == 1){
  ellipse( mX, mY, random(0,30), random(0,30));
  ellipse(random(0,50), random(0,50), mX, mY);
    wd = random( 10, 100 );
    ht = random( 10, 100 );
    x = 0;
  }
  if (mode == 2){
    line(random(0, mX), random(0,mY), mX, mY);
}

if (mode == 3){
    curve(random(0, mX), random(0,mY), random(0, mX), random(0,mY), mX, mY, random(0, mX), random(0,mY));
}
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(255, 45,98);

  if (key == '2') filled = true;
  if (key == '3') mode = 1;
  if (key == '4') mode = 2;
  if (key == '5') mode = 3;

  if (key == 'f' || key == 'F') freeze = !freeze;
  if (freeze == true) noLoop();
  else loop();
}


