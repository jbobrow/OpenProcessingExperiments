
//Quad text
import geomerative.*;

RFont font;
String myText = "Correct Me";

//----------------SETUP---------------------------------
void setup() {
  size(1250, 300);
  background(0);
  smooth();
  RG.init(this); 
  font = new RFont("DiscoDiva.ttf", 100, CENTER);
  //frameRate(10);
  fill(255, 0, 0);
  noStroke();
  translate(width/2, height/2);

  //CONFIGURE SEGMENT LENGTH AND MODE
  //SETS THE SEGMENT LENGTH BETWEEN TWO POINTS ON A SHAPE/FONT OUTLINE
  RCommand.setSegmentLength(10);//ASSIGN A VALUE OF 10, SO EVERY 10 PIXELS
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  // RCommand.setSegmentator(RCommand.CUBICBEZIERTO);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  //GROUP TOGETHER MY FONT & TEXT.
  RGroup myGroup = font.toGroup(myText); 
  myGroup = myGroup.toPolygonGroup();

  //ACCESS POINTS ON MY FONT/SHAPE OUTLINE
  RPoint[] myPoints = myGroup.getPoints();

  //DRAW ELLIPSES AT EACH OF THESE POINTS
  //for (int i=0; i<myPoints.length; i++) {
  // ellipse(myPoints[i].x, myPoints[i].y, 5, 5);
  //}
}

//----------------DRAW---------------------------------
RPoint[] MyPoints() {

  //GROUP TOGETHER MY FONT & TEXT.
  RGroup myGroup = font.toGroup(myText); 
  myGroup = myGroup.toPolygonGroup();

  //ACCESS POINTS ON MY FONT/SHAPE OUTLINE
  RPoint[] myPoints = myGroup.getPoints();
  return myPoints;
}
int i=0;


void draw() {
  float x1= random(100);
  float x2= random(100);
  float y1= random(100);
  float y2= random(100);
  float z1= random(100);
  float z2= random(100);
  float w1= random(100);
  float w2= random(100);
  translate(width/2, 150);
  fill(0);
  RPoint[] myPoints= MyPoints();


  noFill();
  //fill(random(255),50);
  stroke(random(255), 50);
  //noStroke();
  float rand=random(0, 255);

  for (int j=0; j<4;j++) {
    stroke(random(255), 50);
    quad(myPoints[i+j].x, myPoints[i+j].y, x2-myPoints[i+j].x, y2-(myPoints[i+j].y/2), w1+(myPoints[i+j].x/4), w2+(myPoints[i+j].y/7), z1+(myPoints[i+j].x*3), z2+(-myPoints[i+j].y));
    
    for (int k=0; k<=i-5; k++) {
      float distance=sqrt(sq(myPoints[k].x+myPoints[k+1].x)+sq(myPoints[k].y+myPoints[k+1].y));
      //stroke(255, 255/sq(distance)*3000);
      stroke(random(100, 255));
      line(myPoints[k+j].x, myPoints[k+j].y, myPoints[k+1+j].x, myPoints[k+1+j].y);
    }
  }
  
  if (i<myPoints.length-5) {
    i+=4;
  }
  println(myPoints[i].x);
}
//////////////////////////////////////////////


