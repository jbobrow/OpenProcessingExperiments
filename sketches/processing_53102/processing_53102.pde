
// Batman Game
// Max Perim, Andrew ID: mperim copyright 2012
// Some code used from Jim Robert's class code


int count;
int startTime, endTime, targetDisplayTime, targetStartTime, totalTargetTime, gameTime;
int gamePhase;
float pxH, pyH, pxV, pyV, pSize, pySpeedV, pxSpeedV, pxSpeedH, pySpeedH;
float x, y, distX, distY, easingCoefficient;
PImage pV, pH, bang, lose, okay, win;

void setup( )
{
  size( 400, 400 );
  textSize( 24 );
  textAlign( CENTER );
  fill( 255 );
  count = 0;
  startTime = 0;
  endTime = 0;
  gamePhase = 0; 
  targetDisplayTime = 1000;  // milliseconds - change this to alter difficulty
  gameTime = 10000;   // milliseconds - change this to alter difficulty
  pxV=100;
  pxH=width/2;
  pyV=random (height);
  pyH=height/2;
  pSize=100;
  easingCoefficient = .02;
  pxSpeedV=1;
  pySpeedV=1;
  pxSpeedH=1;
  pySpeedH=1;
  pV=loadImage ("Joker!.png");
  pH=loadImage ("Batman!.png");
  bang=loadImage ("Bang!.jpg");
  lose=loadImage ("jokerwin.jpg");
  okay=loadImage ("batmanokay.jpg");
  win=loadImage ("batmanwin.jpg");
}

void draw( )
{
  background( 0 );
  if ( gamePhase == 0 )
  {
    showInstructions( );
  }
  else if ( gamePhase == 1 )
  {
    playGame( );
  }
  else 
  {
    score( );
  }
}

void score( )
{
  fill( 255, 0, 0 );
  text("GAME OVER", width/2, 50 );
  text("You hit " + count + " targets.", width/2, 100 );
  if ( count < 3 )
  {
    image (lose, width/2, height/2, width, height);
  }
  else if ( count < 6 )
  {
    image (okay, width/2, height/2, width, height);
  }
  else 
  {
    image (win, width/2, height/2, width, height);
  }
}

void checkTime( )
{
  fill( 255, 0, 0 );
  text( "Time Remaining: " + ( gameTime/1000 - ((millis( ) - startTime))/1000), width/2, 50 );
  if ( (millis( )-startTime) > gameTime )
  {
    gamePhase = 2;
  }
}

void showScore( )
{
  fill( 255 );
  text( "Hits " + count, width/2, height*.9);
}

void checkHit( )
{
  float d = dist( pxV, pyV, pxH, pyH );
  if ( d < pSize/2)
  {
    count++;
    image(bang, width/2, height/2, width, height);
    targetStartTime = 0;
    pxSpeedV=(pxSpeedV*random(1.1, 1.5));
    pySpeedV=(pySpeedV*random(1.1, 1.5));
    pxV=random(width);
    pyV=random(height);
  }
}

void hero( )
{
  totalTargetTime = millis( ) - targetStartTime;
  if ( totalTargetTime > targetDisplayTime )
  {
    imageMode (CENTER);
    image (pH, pxH, pyH, pSize, pSize);

    distX = mouseX - pxH; 
    distY = mouseY - pyH;
    pxH = pxH + (distX * easingCoefficient);
    pyH = pyH + (distY * easingCoefficient);
    pxH=pxH+pxSpeedH;
    pyH=pyH+pySpeedH;
    if (pxH+(.5*pSize)>width) {
      pxSpeedH=-pxSpeedH;
    }
    if (pxH-(.5*pSize)<0) {
      pxSpeedH=-pxSpeedH;
    }
    if (pyH+(.5*pSize)>height) {
      pySpeedH=-pySpeedH;
    }
    if (pyH-(.5*pSize)<0) {
      pySpeedH=-pySpeedH;
    }
    pxH = pxH + pxSpeedH; // target too far right 

    if (pxH > width ) 

    { 

      pxH = 0;  // move it back to the left side
    }
  }
}
void mouseDragged( ) 

{ 

  if ( mouseX > pmouseX && mouseY>pmouseY ) 

  { 

    pxSpeedH = pxSpeedH + .1;
    pySpeedH = pySpeedH + .1;
  } 

  else if ( mouseX < pmouseX ) 

  { 

    pySpeedH = pySpeedH -  .1 ;
  }
} 
void villain( )
{
  totalTargetTime = millis( ) - targetStartTime;
  if ( totalTargetTime > targetDisplayTime )
  {
    //    noStroke ();
    //    fill (255);
    //    ellipse (pxV, pyV, pSize*1.5, pSize*1.5);
    imageMode(CENTER);
    image (pV, pxV, pyV, pSize, pSize);


    pxV=pxV+pxSpeedV;
    pyV=pyV+pySpeedV;
    if (pxV+(.5*pSize)>width) {
      pxSpeedV=-pxSpeedV;
    }
    if (pxV-(.5*pSize)<0) {
      pxSpeedV=-pxSpeedV;
    }
    if (pyV+(.5*pSize)>height) {
      pySpeedV=-pySpeedV;
    }
    if (pyV-(.5*pSize)<0) {
      pySpeedV=-pySpeedV;
    }
  }
}

void mouseHero() {

  noStroke();   
  point(mouseX, mouseY);
}

void playGame( ) {
  villain( );
  hero( );
  mouseHero();
  checkHit( );
  showScore( );
  checkTime( );
}

void showInstructions( )
{
  text( "The Joker is on the loose!", width/2, 50 ); 
  text("Press any key to play the game.", width/2, 100 );
}

void keyPressed( )
{
  if ( gamePhase == 0 )
  {
    gamePhase = 1;
    startTime = millis( );
  }
}


