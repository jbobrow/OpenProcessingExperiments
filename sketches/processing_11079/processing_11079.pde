

//number of cells to display
//range 0-1000
final int numCells = 100;

//speed to move across the space
//range 0.0-1.0 but very small values are reccomended.
final float goSpeed = 0.0045;

//range to randomly choose cell radius from
//set both values equal to make all cells the same size
final float cellMinSize = 30.0;
final float cellMaxSize = 60.0;

//amount of random variation in the placement of the cells from a perfect rectilinear grid.
final float placementVariance = 30.0;

Cell[] mimi;

void setup(){
  size(500,500);
  smooth();
  mimi = new Cell[numCells];
  int temp = (int)floor(sqrt((float)numCells));
  float avgSize = (cellMinSize + cellMaxSize)/2;
  //the complexity below is for placing cells in an even gridlike distribution without compromizing size invariance or producing gaps that would be visible after translation.
  //do not modify it.
  for(int i=0; i<numCells; i++){
    mimi[i] = new Cell( map( i%temp, 0 , temp, -avgSize*1.333, width+avgSize*1.333 ) + random(-placementVariance,placementVariance),
                        map( floor(i/temp), 0, temp, -avgSize, height+avgSize ) + random(-placementVariance,placementVariance),
                        random(cellMinSize,cellMaxSize));
  }
}

//keep draw simple!
void draw(){
  //calculate how far to move on screen objects based on mouse distance from center
  float mdx = (width/2 - mouseX)*goSpeed;
  float mdy = (height/2 - mouseY)*goSpeed;
  
  //paint background gray
  background(100);
  //cells transparent white with a solid black stroke
  stroke(0);
  fill(255,100);
  //for each cell translate by (dx,dy)
  //the cells' trans method will automatically move the cell to the other side if it goes off the edge,
  //thus making the space seem infinite when its really just toroidial.
  for(int i=0; i<numCells; i++){
   mimi[i].trans(mdx,mdy);
   mimi[i].draw();
  }
}

class Cell{
  //the goal points, organized the same way as the reference points
  private float[] pts, goalpts;
  //the cell starts as a perfect circle with a givin radius
  private float radius;
  //centerpoint of cell. do not public mutate. use trans(dx,dy) to move cell.
  private float centerX, centerY;
  
  public Cell(float centX, float centY, float rad){
    radius = abs(rad);
    centerX = centX;
    centerY = centY;
    
    /**
     * these are the goal points.
     * evens are Xs, odds are Ys.
     * (0,1) is top left, (2,3) is top right
     * (4,5) is bottom left, (6,7) is bottom right
     * all values are relative to centerpoint
     */
    goalpts = new float[8];
    goalpts[1] = radius * (-1);
    goalpts[3] = radius * (-1);
    goalpts[5] = radius;
    goalpts[7] = radius;
    goalpts[0] = radius * (-1.333);
    goalpts[4] = radius * (-1.333);
    goalpts[2] = radius * (1.333);
    goalpts[6] = radius * (1.333);
    
    //copy all goalpoints into reference points. goal points will later diverge
    pts = new float[8];
    for(int i=0; i<8; i++){
      pts[i] = goalpts[i];
    }
  }
  
  public void phys(){
    /**
     * computes internal random movements of cell.
     * the goal points and randomly changed, then the reference points smoothly approach the goal points
     * thus cell appears to slowly and randomly wobble.
     */
    //randomly change goal points
    float drift = radius*0.04;
    for(int i=0; i<8; i++){
      goalpts[i] = goalpts[i] + random( -drift,drift );
    }
    
    //constrain goal points to accetable values
    goalpts[0] = constrain(goalpts[0], radius*(-1.733),  radius*(-0.933));
    goalpts[4] = constrain(goalpts[4], radius*(-1.733),  radius*(-0.933));
    goalpts[2] = constrain(goalpts[2], radius*(0.933),     radius*(1.733));
    goalpts[6] = constrain(goalpts[6], radius*(0.933),     radius*(1.733));
    goalpts[1] = constrain(goalpts[1], radius*(-1.3),      radius*(-0.7));
    goalpts[3] = constrain(goalpts[3], radius*(-1.3),      radius*(-0.7));
    goalpts[5] = constrain(goalpts[5], radius*(0.7),     radius*(1.3));
    goalpts[7] = constrain(goalpts[7], radius*(0.7),     radius*(1.3));
    
    //make reference points smoothly approach goal points
    for(int i=0; i<8; i++){
      pts[i] += (goalpts[i] - pts[i])/20.0;
    }
  }
  
  public void draw(){
    //do physics update
    phys();
    
    //interpolate top centerpoint (still relative to center)
    float xt = map( 0.5, 0.0,1.0, pts[0],pts[2] );
    float yt = map( xt, pts[0],pts[2], pts[1],pts[3]);
    //interpolate bottom centerpoint
    float xb = map( 0.5, 0.0,1.0, pts[4],pts[6] );
    float yb = map( xb, pts[4],pts[6], pts[5],pts[7]);

    //draw two bezier curves, one for each half
    bezier( centerX+xt,     centerY+yt,
            centerX+pts[2], centerY+pts[3],
            centerX+pts[6], centerY+pts[7],
            centerX+xb,     centerY+yb );
    bezier( centerX+xb,     centerY+yb,
            centerX+pts[4], centerY+pts[5],
            centerX+pts[0], centerY+pts[1],
            centerX+xt,     centerY+yt );
    
    //uncomment these if you want to see the reference lines
    //line(centerX+pts[0],centerY+pts[1],centerX+pts[2],centerY+pts[3]);
    //line(centerX+pts[4],centerY+pts[5],centerX+pts[6],centerY+pts[7]);
  }
  
  public void trans(float dx, float dy){
    //translate everything by dx,dy
    float oldx = centerX;
    float oldy = centerY;
    centerX += dx;
    centerY += dy;
    
    //if moved off the screen replace on opposite side
    if ((centerX+radius*1.333) < 0.0){
      centerX = width+radius*1.333;
    } else if ((centerX-radius*1.333) > width){
      centerX = 0.0-radius*1.333;
    }
    if ((centerY+radius) < 0.0){
      centerY = height+radius;
    } else if ((centerY-radius) > height){
      centerY = 0.0-radius;
    }
  }
}

