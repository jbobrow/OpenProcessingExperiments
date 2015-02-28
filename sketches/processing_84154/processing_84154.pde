
// fitness squares

Square[] squares;

color[] colors = { #F2385A, #F5A503, #CBF398, #4AD9D9, #FFFFFF };

int thisCol;
int thisRow;

int boxWidth  = 70;
int boxHeight = 30;

PFont title;
PFont workoutDesc;

void setup() {

  size( 1200, 640 );
  smooth();
  noStroke();

  loadData();

  title = loadFont( "Aclonica-Regular-36.vlw" );
  workoutDesc = loadFont( "NueBold-48.vlw" );

}


void draw() {

  background( #FFFFFF );

  loadSquares();

  for ( int j = 0; j < squares.length; j++ ) {
    squares[j].displayInfo( mouseX, mouseY );
  }

  textAlign( CENTER );
  fill( 0 );
  textFont( title, 36 );
  text( "Workout Log", width/2, 50 );

  // println("mouseX " + mouseX + " mouseY: " +  mouseY);

}


void loadData() {

  String[] rows = loadStrings( "workouts.csv" );
  squares = new Square[rows.length];

  for( int i = 0; i < squares.length; i++ ) {
    squares[i] = new Square();
  }

  for( int i = 0; i < rows.length; i++ ) {
    String[] col = rows[i].split( "," );
    squares[i].workoutDate = col[0];
    squares[i].workout = int( col[1] );
  }

}


void loadSquares() {

  rectMode( CENTER );
  strokeWeight(1/2);
  stroke(255);

  int totalCols = 14;
  // Divide the total of workouts by total columns to get number of rows.
  // And add 1 to accout for remainder days that don't divide into 7.
  int totalRows = squares.length/totalCols + 1;

  int xMargin = 140;
  int yMargin = 115;

  int i = 0;
  for( thisRow = 0; thisRow < totalRows; thisRow++ ) {
    for( thisCol = 0; thisCol < totalCols; thisCol++ ) {
      // Build squares and increase i until i reaches the end of the squares array.
      if( i < squares.length ) {

        float xLoc = thisCol * boxWidth + xMargin;
        float yLoc = thisRow * boxHeight + yMargin;
        fill( colors[squares[i].workout] );
        squares[i].displaySquares( xLoc, yLoc, boxWidth, boxHeight );

        if( squares[i].workout == 4 ) {
          fill( 0 );
          ellipse(xLoc, yLoc, 5, 5);
        }

        i++;

      }
    }
  }

}
class Square {

  color sqColor;
  int workout;
  String workoutDate;
  float xPos, yPos, bWidth, bHeight;

  String[] workoutType = { "Weight training", "Kettlebell #1", "Kettlebell #2", "Run", "Rest" };


  Square() {
  }


  void displaySquares(float xLoc, float yLoc, float boxWidth, float boxHeight) {

    xPos = xLoc;
    yPos = yLoc;
    bWidth  = boxWidth;
    bHeight = boxHeight;

    rect( xPos, yPos, bWidth, bHeight );

  }


  void displayInfo (int mX, int mY) {


    if ( mX > xPos - bWidth/2 && mX < xPos + bWidth/2
      && mY > yPos - bHeight/2 && mY < yPos + bHeight/2 ) {

      int workoutTextX = 190;
      int workoutTextY = 535;

      rectMode( CORNER );
      fill( #E9F1DF );
      rect( 105, 490, 340, 65 );

      textAlign( CENTER );
      fill(0);

      textFont( workoutDesc, 48 );
      text( workoutDate, workoutTextX, workoutTextY );
      text( workoutType[workout], workoutTextX + 140, workoutTextY );

    }

  }

}


