
float a = 800;
float ab = 1200;
float valuea = 25; //green circle initial location  
float valueaUpdated;//
float valueWidth=10;///see below
float valueWidthUpdated; //green animated circle width
float valueRightY = 700;//circle upper L
float valueRightX= 1200;
float valueRightXUpdated;
float valueRightYUpdated;



void setup () {
  size(1200, 700);
  background (214, 225, 200);
}


void draw() {

//fill (210, 215, 180, 10);///
 //rect (width, height, 1170, 670);

/// arc, need to place in upper r corner
noStroke();
fill(250, 180, 100, 5);
arc(1200, 0, mouseY, mouseX, QUARTER_PI, PI+PI);
 
 //light black circle in background-self animated
  noStroke();
  valueRightY= valueRightY-10;
  valueRightYUpdated= valueRightY-10;
  valueRightX= valueRightX-10;
  valueRightXUpdated= valueRightX-10;
  fill (0, 10);
  ellipse (valueRightYUpdated, valueRightY-10, valueRightXUpdated, valueRightX-10);
  valueRightY=valueRightYUpdated;

  ///line:  horizontal
  frameRate(30);
  strokeWeight (20);
  stroke (120, 95, 35, 5);
  line (0, mouseY, 1200, mouseY);

 //ellipse runs diag. w/ mouse movement
  frameRate(40);
  noStroke();
  fill (255, 255, 205, 10);
  ellipse (mouseX, mouseX, mouseY, mouseY); 

  //Arc bottom R
  frameRate(40);
  strokeWeight (0);  
 stroke (200, 134, 95, 25); 
 fill (200, 134, 95, 5);
 arc (a, a, pmouseX, pmouseY, PI, PI+PI); 

///green walking circle///
valueaUpdated= valuea+10;
valueWidthUpdated= valueWidth+10;
noStroke();
fill(204, 204, 51, 10);
ellipse (valueaUpdated, valuea+10, valueWidthUpdated, valueWidth+12);
valuea=valueaUpdated;
valueWidth=valueWidthUpdated;

  ///show where mouse is///
  println (mouseX);
  println (mouseY);
}
void mouseDragged() {


  ///delete background from this.  I make yellow bottom R corner light blue when I press top R side 
  if (mouseX > 600) {
    fill (204, 205, 255, 5);
    //fill (25, 130, 20, 10);
    noStroke();
    triangle (0, 0, 800, 700, 0, 700);
    
  }


  ////this makes yellow on the Upper Right hand Side when Press Bottom L
  if (mouseX < 600) {
    fill(205, 103, 20, 5);
    // fill (125, 200, 130, 5);
    noStroke();
    triangle (1200, 0, 1200, 700, 0, 0);
  }
}

void keyPressed(){
  background (204, 204, 113);
  noStroke();
  fill (210, 240, 130, 50);
  triangle (800, 100, 500, 630, 120, 34);
  fill (255, 50);
  triangle(1200, 1200, 0, 155, 200, 850);

}
