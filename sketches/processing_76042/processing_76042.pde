
final int SCREEN_WIDTH = 800;
final int SCREEN_HEIGHT = 600;
final int CIRCLE_X = SCREEN_WIDTH / 4;
final int CIRCLE_Y = SCREEN_HEIGHT /2;
final int CIRCLE_DIAMETER = 350;
final int CIRCLE_THICKNESS = 2;
final int POINT_SIZE = 10;
final int GRAPH_X = 450;
final int GRAPH_WIDTH = 300;
final color COS_COLOUR = color(0, 0, 255);
final color SIN_COLOUR = color(255, 0, 0);
final int GRAPH_THICKNESS = 1;
final color GRAPH_COLOUR = color(200, 200, 200);
 
float[] sine = new float[GRAPH_WIDTH];
float[] cosine = new float[GRAPH_WIDTH];
float[] graphSin = new float[GRAPH_WIDTH];
float[] graphCos = new float[GRAPH_WIDTH];
int index = 0;
 
int FRAME_RATE = 60;
int speed = 15;
boolean cycled = false;
 
 
void setup() {
  size(800, 600);
  smooth();
  frameRate(FRAME_RATE);
   
  //intialize sin and cos arrays
  for(int i = 0; i < GRAPH_WIDTH; i++) {
    sine[i] = 400;
    cosine[i] = 400;
  }
}
 
void draw() {
  background(255);
  moveHypotenuse();
  drawUnitCircle();
  drawGraph();
  index++;
  if(index == GRAPH_WIDTH) {
    cycled = true;
    index = 0;
  }
}
 
void moveHypotenuse() {
  float distance = dist(mouseX, mouseY, CIRCLE_X, CIRCLE_Y);
  cosine[index] = (mouseX - CIRCLE_X) / distance * CIRCLE_DIAMETER/2 + CIRCLE_X;
  sine[index] = (mouseY - CIRCLE_Y) / distance * CIRCLE_DIAMETER/2 + CIRCLE_Y;
}
 
void drawUnitCircle() {
  //draw circle
  strokeWeight(CIRCLE_THICKNESS);
  stroke(0);
  ellipse(CIRCLE_X, CIRCLE_Y, CIRCLE_DIAMETER, CIRCLE_DIAMETER);
  //draw hypotenuse
  line(CIRCLE_X, CIRCLE_Y, cosine[index], sine[index]);
  //draw cosine line
  stroke(COS_COLOUR);
  line(CIRCLE_X, CIRCLE_Y, cosine[index], CIRCLE_Y);
  //draw sine line
  stroke(SIN_COLOUR);
  line(cosine[index], CIRCLE_Y, cosine[index], sine[index]);
  //draw point
  strokeWeight(POINT_SIZE);
  stroke(0);
  point(cosine[index], sine[index]);
}
 
void drawGraph() {
  strokeWeight(GRAPH_THICKNESS);
  stroke(GRAPH_COLOUR);
  line(GRAPH_X, CIRCLE_Y-CIRCLE_DIAMETER/2, GRAPH_X+GRAPH_WIDTH, CIRCLE_Y-CIRCLE_DIAMETER/2);
  line(GRAPH_X, CIRCLE_Y, GRAPH_X+GRAPH_WIDTH, CIRCLE_Y);
  line(GRAPH_X, CIRCLE_Y+CIRCLE_DIAMETER/2, GRAPH_X+GRAPH_WIDTH, CIRCLE_Y+CIRCLE_DIAMETER/2);
   
  //set values for graph array
  for(int i = 0; i < GRAPH_WIDTH; i++) {
    graphCos[i] = cosine[(index + i + 1) % GRAPH_WIDTH];
    graphSin[i] = sine[(index + i + 1) % GRAPH_WIDTH];
  }
  //draw graph
  for(int i = 1; i < GRAPH_WIDTH; i++) {
    if(cycled) {
      stroke(COS_COLOUR);
      line(GRAPH_X+i+1, CIRCLE_Y-graphCos[i]+CIRCLE_X, GRAPH_X+i, CIRCLE_Y-graphCos[i-1]+CIRCLE_X);
      stroke(SIN_COLOUR);
      line(GRAPH_X+i+1, CIRCLE_Y+graphSin[i]-CIRCLE_X, GRAPH_X+i, CIRCLE_Y+graphSin[i-1]-CIRCLE_X);
    }
    else {     
      if(graphCos[i] != 400) {
      stroke(COS_COLOUR);
      line(GRAPH_X+i+1, CIRCLE_Y-graphCos[i]+CIRCLE_X, GRAPH_X+i, CIRCLE_Y-graphCos[i-1]+CIRCLE_X);
      stroke(SIN_COLOUR);
      line(GRAPH_X+i+1, CIRCLE_Y+graphSin[i]-CIRCLE_X, GRAPH_X+i, CIRCLE_Y+graphSin[i-1]-CIRCLE_X);
      }
    }
  }
}
