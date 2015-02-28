
//Put Global Variables Here
    int box= 20;
    int number= 30;
    int canvasHeight= box*number;
    int canvasWidth= box*number;
  int creatureX=0;
  int creatureY= 0;
    
    //do setup here
  public void setup() {
    size(canvasWidth, canvasHeight);
    smooth();
    drawBackground();
    
  }
    
  //this is for our animation. It redraws things 18 times a second
  public void draw() {
    //drawBackground(); //take this out if you want to erase things
    creatureX= mouseX;
    creatureY= mouseY;
    drawCreature();
    //drawcreature(mouseX, mouseY);
    ellipseMode(CENTER);
         fill (0, 205, 205);
    ellipse (creatureX, creatureY, 150, 150);
    fill (190, 0, 185);
    ellipse (creatureX, creatureY, 80, 80);
   rectMode (CENTER);
   fill (0, 225, 0);
    ellipse (creatureX, creatureY, 30, 30);
    fill(237, 223, 184);
    rect (creatureX, creatureY+80, 150, 80); 
   

}
  
  //this functions is for your creature.
  //Use variables:creatureX and creatureY
  //Recommended to use: box as a variable
  private void drawCreature() {
    //put your creature files in here
    noStroke(); //removes strokes here
  fill (215, 130, 190);
    ellipse(mouseX, mouseY, 50, 50);
  }
  
  //this colors the background and draws the grid
  public void drawBackground() {
    background(255,0,0);
    drawGrid();
  }
  
  //this function is to draw the grid using the boxes
  public void drawGrid() {
    stroke(0);
    strokeWeight(2);
    for (int i=1; i<number; i++) {
      //Horizontal line
      line(0, i*box, canvasWidth, i*box);
      
      //Vertical Line
      line(i*box, 0, i*box, canvasHeight);
      
    }
    
  }
