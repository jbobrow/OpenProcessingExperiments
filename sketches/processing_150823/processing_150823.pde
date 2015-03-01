
int numX = 8;
int numY = numX;
Dice[] die ;


void setup() {
  size ( 600, 600 );
  colorMode( HSB );
  background( 0, 0, 0 );
  die= new Dice[ numX * numY ];
  noStroke();
  noLoop();
  createDice();
  draw();
} // end of setup


void draw() {
  for (int i=0; i<numX*numY; i++) {
    die[i].Draw();
  }
  
} // end of draw()


void createDice() {
  int px, py, sz, cl, dn, i=0;

  int minGap = width/numX/5;
  int totalGap= minGap * (numX+1); // 20*7 = 140
  int realSize= (width-totalGap)/numX; // 800-140/6 =110

  for (int x=0; x < numX; x++) {
    for (int y=0; y < numY; y++) {
      cl = int( random( 255 ) ); // die colour
      sz = realSize; // die size
      dn = int( random ( 6 ) ) +1; // number on die
      int marginX = minGap+width-numX*(sz+minGap);
      int marginY = minGap+height-numX*(sz+minGap);
      px = marginX/2+(x*(sz+minGap)); // die x position
      py = marginY/2+(y*(sz+minGap)); // die y position
      die[i] = new Dice ( px, py, sz, cl, dn );
      i++;
    } // end of for(y)
  } // end of for(x)
} // end of createDice()


class Dice {
  // Declare variables used in class
  int posX, posY, dieSize, colour, dieNumber;
  
  // Define how the variables are intially set
  Dice( int x, int y, int s, int c, int n )
  {
    posX = x;
    posY = y;
    dieSize = s;
    colour = c;
    dieNumber = n;
  } // end of definition
  
  void Draw() {
    fill( this.colour, 200, 200 );
    rect( this.posX, this.posY, this.dieSize, this.dieSize, this.dieSize/4 );
    // draw dots on die
    drawDots( this.posX, this.posY, this.dieSize, this.dieNumber );
  } // end of Draw()
} // end of class Dice()

void drawDots( int x, int y, int s, int n ) {
  int dotSize = s/5;
  fill( 0, 0, 220);
  
  pushMatrix();
    translate(x+(s/2),y+(s/2));
    for (int i=0; i<int(random(4)); i++) {
      rotate( HALF_PI );
    } // end of for(i)
  switch(n) {
    case 1:
      ellipse( 0, 0, dotSize, dotSize );
      break;
    case 2:
      ellipse( -(s/4), -(s/4), dotSize, dotSize ); // top left dot
      ellipse( (s/4), (s/4), dotSize, dotSize ); // bottom right dot
      break;
    case 3:
      ellipse( 0, 0, dotSize, dotSize ); // centre dot
      ellipse( -(s/4), -(s/4), dotSize, dotSize ); // top left dot
      ellipse( (s/4), (s/4), dotSize, dotSize ); // bottom right dot
      break;
    case 4:
      ellipse( -(s/4), -(s/4), dotSize, dotSize ); // top left dot
      ellipse( (s/4), -(s/4), dotSize, dotSize ); // top right dot
      ellipse( -(s/4), (s/4), dotSize, dotSize ); // bottom left dot
      ellipse( (s/4), (s/4), dotSize, dotSize ); // bottom right dot
      break;
    case 5:
      ellipse( 0, 0, dotSize, dotSize ); // centre dot
      ellipse( -(s/4), -(s/4), dotSize, dotSize ); // top left dot
      ellipse( (s/4), -(s/4), dotSize, dotSize ); // top right dot
      ellipse( -(s/4), (s/4), dotSize, dotSize ); // bottom left dot
      ellipse( (s/4), (s/4), dotSize, dotSize ); // bottom right dot
      break;
    case 6:
      ellipse( -(s/4), -(s/4), dotSize, dotSize ); // top left dot
      ellipse( (s/4), -(s/4), dotSize, dotSize ); // top right dot
      ellipse( -(s/4), 0, dotSize, dotSize ); // centre left dot
      ellipse( (s/4), 0, dotSize, dotSize ); // centre right dot
      ellipse( -(s/4), (s/4), dotSize, dotSize ); // bottom left dot
      ellipse( (s/4), (s/4), dotSize, dotSize ); // bottom right dot
      break;
  } // end of switch()
  
  popMatrix();
} // end of drawDots()
void mouseReleased(){
setup();
}   
