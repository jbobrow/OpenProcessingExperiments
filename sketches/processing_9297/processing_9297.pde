
/* 

  Thomas Diewald
  27.04.2010
  
  buffons needle problem - approximation to PI
  http://en.wikipedia.org/wiki/Buffon%27s_needle
*/

PFont font;


int passes = 0;
int hits = 0;

int scrSizeX   = 700;
int scrSizeY   = 500;
int graphSizeY = 200;
int   gridX = 8;
float gridSizeX = scrSizeX/gridX*1.0;
int   gridY = int((scrSizeY-gridSizeX/2) / gridSizeX);
float gridXpos[] = new float[ gridX +1];
float gridYpos[] = new float[ gridY +1];

float boundaryXmin, boundaryXmax, boundaryYmin, boundaryYmax;

float approxPI      = 0;
float graphXcurrent = 0;
float graphXbefore  = 0;
float graphYcurrent = scrSizeY + graphSizeY/2;
float graphYbefore  = graphYcurrent;


float needleLength = gridSizeX/2.0;
float offset = .3;

// y coordinate for the PI line
float piY = map(PI , PI-offset, PI+offset, 0, graphSizeY);


boolean pause = false;



void setup(){
  //size(scrSizeX, scrSizeY+graphSizeY);
  size(700, 700);
  
  background(255);
  smooth();
  frameRate(9999);
  
  font = loadFont("Calibri-24.vlw"); 
  textFont(font, 24); 
  
  drawGrid();
} // end void setup



void drawGrid(){
  stroke(150); strokeWeight(1);
  for(int i = 0; i < gridXpos.length-0; i++){
    float x = i*gridSizeX*1.0;
    line(x, gridSizeX/2, x, (gridYpos.length-2)*(gridSizeX) + (gridSizeX)*0.5 );
    gridXpos[i] = x;
  }
  
  for(int i = 0; i < gridYpos.length-0; i++){
    float y = i*gridSizeX*1.0;
    line(gridSizeX/2, y, scrSizeX - gridSizeX/2, y);
    gridYpos[i] = y;
  }
  
  boundaryXmin = gridXpos[1];
  boundaryXmax = gridXpos[gridXpos.length-2];
  boundaryYmin = gridYpos[1];
  boundaryYmax = gridYpos[gridYpos.length-1];  
  
  // draw real Pi as a line
  stroke(255,0,0, 150); strokeWeight(2);
  line(0, scrSizeY + graphSizeY - piY, scrSizeX, scrSizeY + graphSizeY- piY);
} // end void drawGrid()



int speed = 1;

void draw(){
  if( frameCount % 2000  == 0){ 
    speed *=2;
    //println(speed+", "+ passes);
  } 
  
  float x1 = 0, y1 = 0,x2 = 0,y2 = 0;
  
  for(int j = 0; j < speed;j++){
    passes++;
    float angle = random(TWO_PI);
    float needleX1 = needleLength/2.0*sin(angle) ;
    float needleY1 = needleLength/2.0*cos(angle) ;
    
    x1 = random(boundaryXmin, boundaryXmax) + needleX1;
    y1 = random(boundaryYmin, boundaryYmax) + needleY1;
    x2 = x1 - needleX1*2;
    y2 = y1 - needleY1*2;
    
    boolean foundHitX = false, foundHitY = false;
    for(int i = 0; i < gridXpos.length; i++)
      if( x1 <= gridXpos[i] &&  x2 >= gridXpos[i] || x2 <= gridXpos[i] &&  x1 >= gridXpos[i] ) {foundHitX = true;break;}
    if ( foundHitX ) hits++;
  
    for(int i = 0; i < gridYpos.length; i++)
      if( y1 <= gridYpos[i] &&  y2 >= gridYpos[i] || y2 <= gridYpos[i] &&  y1 >= gridYpos[i] ) {foundHitY = true;break;}
    if ( foundHitY ) hits++;
    
    if ( foundHitX || foundHitY){
      approxPI = 2.0 * passes / hits;
      if( j == 0) drawGraph();
      stroke(255,0,0);
    } else {
      stroke(0);
    }
  } // end for j
  // draw needle
  strokeWeight(.5); 
  line(x1, y1, x2, y2);
  
  // draw borders
  //strokeWeight(7);  stroke(0);
  //line(0, scrSizeY, scrSizeX, scrSizeY);
  noFill(); stroke(0); strokeWeight(20);
  rect(0,0,width, height);
  
} // end void draw







void drawGraph(){
  graphXbefore = graphXcurrent;
  graphYbefore = graphYcurrent;
  
  graphXcurrent += 2.0/log(sq(passes));
  if( graphXcurrent > scrSizeX){
    graphXcurrent = 0; graphXbefore = 0;
    // draw real Pi as a line
    stroke(255,0,0, 150); strokeWeight(2);
    line(0, scrSizeY + graphSizeY - piY, scrSizeX, scrSizeY + graphSizeY- piY);
    // 
    fill(255,150); noStroke();
    rect(0, scrSizeY, scrSizeX, graphSizeY);
  }  

  graphYcurrent = scrSizeY + graphSizeY - map(approxPI, PI-offset, PI+offset, 0, graphSizeY);
  if(graphYcurrent > scrSizeY + graphSizeY) graphYcurrent = scrSizeY + graphSizeY;
  if(graphYcurrent < scrSizeY             ) graphYcurrent = scrSizeY;

  // draw Graph
  stroke(0);   strokeWeight(1);
  line(graphXbefore, graphYbefore, graphXcurrent, graphYcurrent);
  
  
  // draw text
  //println( passes +" : PI = "+ approxPI );

  String pass     = nfc(passes);
  String piAsText = nfc(approxPI, 10);
  String displayText = "pass "+ pass + ", PI = " + piAsText;
  float displayTextWidth = textWidth(displayText);
  
  fill(255); noStroke();
  rect(width/2 - displayTextWidth/2 -5, scrSizeY + graphSizeY - 10, displayTextWidth+10, -40);
  fill(0); stroke(0);
  textAlign(CENTER);
  text (displayText, width/2,  scrSizeY + graphSizeY - 20);

} // end void drawGraph()




void keyReleased(){
  if(key == ' ') restart();
  if(key == 'p') {
    if( pause ) pause = false; else pause = true;
    if( pause ) noLoop(); else loop();
  } 
}

void restart(){
  background(255);
  passes = 0; hits = 0; approxPI = 0; graphXcurrent = 0; graphXbefore = 0; 
  frameCount = 0; speed = 1;
  drawGrid();
}


