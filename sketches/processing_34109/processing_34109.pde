
/*
 * The Sketcher
 * (c) Andy Wallace 
 * 2010
 * 
 * Inspired by Ze Frank's Scribbler
 * http://www.zefrank.com/scribbler/
 *
 * Draw a picture and hit go!
 */

float[] points=new float[0];  //hold all of the points

int p1;  //these will hold the two points to connect
int p2;

float maxSketchDist=100;

boolean sketching=false;  //are we drawing?
boolean goodSketch=false;  //stays false until the two points are close enough
boolean connectDrawing=true;

//set up
void setup() {
  size(600,600);
  smooth();  //turns on anti aliasing
  ClearScreen();
}


//draw
void draw() {
  if (mousePressed) {
    //did the player hit the start button?
    if (mouseX<50 && mouseY<150){
      if (mouseY<50) {
        sketching=true;
      }
      else if(mouseY>50 && mouseY<100) {
        sketching=false;
      }
      else if(mouseY>100 && mouseY<150) {
        ClearScreen();
      }
    }

    //start drawing
    else {
      //save the mouse value in the array
      points=append(points,mouseX);
      points=append(points,mouseY);

      //draw a line between the new point and the old one
      //make sure this isn't the firt point
      if (points.length>2 && connectDrawing) {
        //set the line characteristics back to default
        stroke(0);
        strokeWeight(1);
        //draw the line
        line(points[points.length-4], points[points.length-3],
        points[points.length-2], points[points.length-1]);
      }
      else {
        connectDrawing=true;
      }
    }
  }
  else {
    connectDrawing=false; //if the mouse ahs been lifted, don't connect the next point
  }

  //are we skecthing?
  if (sketching) {
    Sketch();
  }
}

//ClearScreen clears the drawing, empties the array and redraws the buttons
void ClearScreen() {
  //clear the screen
  background(200);
  //redraw the buttons
  fill(#9DFFB0);
  rect(0,0,50,50);
  fill(#FFA59D);
  rect(0,50,50,50);
  fill(#000000);
  rect(0,100,50,50);
  text("GO!",15,30);
  text("STOP!",6,80);
  fill(255);
  text("CLEAR",5,130);
  //clear the array
  points=new float[0];
  //turn sketching off if it's on
  sketching=false;
}
//Skecth controls what happens once the computer should start connecting points in the array
void Sketch() {
  if (points.length>3) {  //prevent the whole thing from crashing in case there aren't enough points.
    goodSketch=false;
    while (!goodSketch) {
      p1=int(random(1,points.length));
      if (p1%2!=0)
        p1--;  //if it isn't even, subtract 1 to make sure it is
      p2=int(random(1,points.length));
      if (p2%2!=0)
        p2--;  //if it isn't even, subtract 1 to make sure it is

      //check the distnce
      if (DistCheck(p1,p1+1,p2,p2+1)<maxSketchDist) {
        goodSketch=true;
        //stroke(abs(0-DistCheck(p1,p1+1,p2,p2+1)));  //make the line lighter if the points are further apart
        strokeWeight(2-map(DistCheck(p1,p1+1,p2,p2+1),0,maxSketchDist,0.5,2));
        println(map(DistCheck(p1,p1+1,p2,p2+1),0,maxSketchDist,0,5));
        //draw a line between the two points
        ConnectPoints(p1,p1+1,p2,p2+1);
        //add the middle point of the line to the array
        /* NOT WORKING YET
         points=append(points, points[p1]+(points[p1]-points[p2])/2);
         points=append(points, points[p1+1]+(points[p1+1]-points[p2+1])/2);
         */
      }
    }
  }
}

//DistCheck returns the distance between two points
float DistCheck(int x1,int y1,int x2,int y2) {
  float xDist= points[x1]-points[x2];
  float yDist= points[y1]-points[y2];
  return(sqrt(sq(xDist)+sq(yDist)));
}

//Connect Points draws a line between 2 points in the array
void ConnectPoints(int x1,int y1,int x2,int y2) {
  line(points[x1],points[y1],points[x2],points[y2]);
}


