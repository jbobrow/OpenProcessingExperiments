
// Esercizio 5.1 Colored Lines
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1


int[] myColor = {255,255,255};
int myBackground = 0;
int myStep = 5;


void setup()
{
  size( 600,460 );
  background( myBackground );
  stroke( myColor[0], myColor[1], myColor[2] );
  
  myColorInfo();
}


void draw()
{
  translate(mouseX,mouseY);
  rotate(frameCount/10.0);
  if (mousePressed) {
    myDraw();
    myColorInfo();
  }
}


void myDraw()
{
  line(0,0, 80,0);
}


void myColorInfo()
{
  pushMatrix();
  pushStyle();
  resetMatrix();
  fill(255);
  stroke(255);
  rect(0, height-60, width, 60);
  textAlign(CENTER);
  fill(0);
  textSize(18); 
  text("||| Canvas grey = " + myBackground + " ||| RGB line color = " + myColor[0]+ "-" + myColor[1]+ "-" + myColor[2] + " |||", width/2, height-40);
  text("Usage: keys [c][C][r][R][g][G][b][B] - [mouse click] - [x][X]", width/2, height-10);
  popStyle();
  popMatrix();
}


void keyPressed()
{ 
  switch(key) {
    case 'C':
      if ( (myBackground+myStep) <= 255 ) {
        myBackground += myStep;
        background( myBackground );
      }
      break;
    case 'c':
      if ( (myBackground-myStep) >= 0 ) {
        myBackground -= myStep;
        background( myBackground );
      }
    break;
    case 'R':
      if ( (myColor[0]+myStep) <= 255 ) {
        myColor[0] += myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
    case 'r':
      if ( (myColor[0]-myStep) >= 0 ) {
        myColor[0] -= myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
    case 'G':
      if ( (myColor[1]+myStep) <= 255 ) {
        myColor[1] += myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
    case 'g':
      if ( (myColor[1]-myStep) >= 0 ) {
        myColor[1] -= myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
    case 'B':
      if ( (myColor[2]+myStep) <= 255 ) {
        myColor[2] += myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
    case 'b':
      if ( (myColor[2]-myStep) >= 0 ) {
        myColor[2] -= myStep;
        stroke( myColor[0], myColor[1], myColor[2] );
      }
      break;
      
    default:
      break;
  }
  myColorInfo();
}


void keyReleased()
{
  if (key=='x' || key=='X') {
    myBackground = 0;
    for (int k=0 ; k>myColor.length ; k++)
      myColor[k] = 255;
    background( myBackground );
    stroke( myColor[0], myColor[1], myColor[2] );
    myColorInfo();
  }
}


