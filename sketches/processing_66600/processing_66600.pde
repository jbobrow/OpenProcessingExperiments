
/**
 * Rotating Moire Canvas
 *
 * An interactive canvas for drawing Moire patterns. Click to place
 * vertices of a shape. This shape is duplicated N times around the
 * frame, and a mirror image is also produced. These figures rotate
 * around the origin in opposite directions, producing the pattern.
 *
 * CONTROLS:
 * 'p' or spacebar to pause and unpause.
 * 'c' to set the figure back to it's initial position
 * 'r' to reset
 * 'g' to toggle different grid modes (off, quadrants, N sectors)
 *  Left and Right to decrease or increase the number of sectors
 *  Up and Down to control speed (not yet implemented)
 *  'b', 'n', and 'm' change the background, fill, and stroke between
 *      black and white, respectively.
 */

//Global Variables
int totalFrames; //Higher means slower rotation
int f; //Current frame number
boolean paused; //Pause rotation
int[] colors; //Colors: index 0 for background, 1 for fill, 2 for stroke
int grid; //0 for no grid, 1 for quadrants, 2 for sectors
int sectors; //Number of images before mirrored (N)
ArrayList points; //store vertices


void setup(){
  //Initialize Global Variables
  points = new ArrayList();
  f=0;
  totalFrames = 100;  
  grid = 1;
  sectors = 4;
  paused = false;
  colors = new int[3];
  colors[0] = 255;
  colors[1] = 0;
  colors[2] = 0;

  //Set up frame
  size(600,600);
  frameRate(15);
  updateColors();
  strokeWeight(1);
}

void draw(){
  //Wipe screen
  background(colors[0]);

  //Draw grid
  //Quadrants
  if(grid == 1){ 
    line(width/2, 0, width/2, height);
    line(0, height/2, width, height/2);
  }
  //Sectors
  else if(grid == 2){ 
    translate(width/2, height/2);
    rotate(PI*3/4);
    for(int i = 0; i<sectors; i++){
      line(0, 0, width/2, height/2);
      rotate(TWO_PI/sectors);
    }
    resetMatrix();
  }

  //Draw Images if there are vertices
  if(points.size()>0)
  {
    translate(width/2, height/2); //Center
    rotate((f % totalFrames) * TWO_PI/totalFrames); //Current rotation
    //For each sector...
    for(int j = 0; j<sectors; j++){
      //Turn points into vertices
      beginShape();
      for(int i = 0; i<points.size(); i++){
        int[] p = (int[])(points.get(i));
        vertex(p[0], p[1]);
      }
      endShape();
      rotate(TWO_PI/sectors); //Get ready for next sector
    }
  
    resetMatrix();
    translate(width/2, height/2);
    rotate(-f * TWO_PI/totalFrames); //Mirror image rotates other direction
    
    for(int j = 0; j<sectors; j++){
      beginShape();
      for(int i = 0; i<points.size(); i++){
        int[] p = (int[])(points.get(i));
        vertex(p[1], p[0]); //Flips shape!
      }
      endShape();
      rotate(TWO_PI/sectors);
    }
  } 
  if(!paused){
    f = (f+1)%totalFrames; //Increment frame
  }
}

//Mouseclicks to add points
void mousePressed(){
    int[] newP = {mouseX-width/2, mouseY-height/2};
    points.add(newP);
  }
  
//Keyboard to change settings
void keyReleased(){
  if(key == CODED){
    if(keyCode == RIGHT){
      sectors++;
    }
    else if(keyCode == LEFT){
      sectors--;
    }
    else if(keyCode == UP)
    {
      if(totalFrames-10>0)
        f = ceil(f*(totalFrames-10)/totalFrames);
      totalFrames = max(1, totalFrames-10);
    }
    else if(keyCode == DOWN)
    {
      f = ceil(f*(totalFrames+10)/totalFrames);
      totalFrames = max(1, totalFrames+10);

    }
  }
  else if(key == 'p' || key == ' '){
    paused = !paused;
  }
  else if(key == 'c'){
    f = 0;
  }
  else if(key == 'r'){
    points = new ArrayList();
  }
  else if(key == 'g'){
    grid = (grid+1)%3;
  }
  else if(key == 'b'){
    if(colors[0] == 0)
      colors[0] = 255;
    else 
      colors[0] = 0;
      
    background(colors[0]);
  }
  else if(key == 'n'){
    if(colors[1] == 0)
      colors[1] = 255;
    else 
      colors[1] = 0;
      
    fill(colors[1]);
  }
  else if(key == 'm'){
    if(colors[2] == 0)
      colors[2] = 255;
    else 
      colors[2] = 0;
      
    stroke(colors[2]);
  }
}

void updateColors()
{
  background(colors[0]); //White background
  fill(colors[1]); //Black fill
  stroke(colors[2]); //Black lines
}

