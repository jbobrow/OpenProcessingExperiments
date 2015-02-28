
//Put Global Variables Here
    int box= 20;
    int number= 30;
    int canvasHeight= box*number;
    int canvasWidth= box*number;
  //int creatureX=0;
  //int creatureY= 0;
    
    //do setup here
  public void setup() {
    size(1420, 820);
    smooth();
    
  }
    
  //this is for our animation. It redraws things 18 times a second
  public void draw() {
    drawBackground(); //take this out if you want to erase things
    //creatureX= mouseX;
    //creatureY= mouseY;
    drawCreature(mouseX+10*box, mouseY);
    drawCreature(mouseX-10*box, mouseY);
  }
  

  
  //this functions is for your creature.
  //Use variables:creatureX and creatureY
  //Recommended to use: box as a variable
  private void drawCreature(int creatureX, int creatureY) {
    //put your creature files in here
    noStroke(); //removes strokes here
    fill(200, 200, 200);
    ellipse(creatureX, creatureY+1.5*box, 90, 90);
    fill(0,0,0);
    rectMode(CENTER);
    rect(creatureX, creatureY-1.5*box, 80, 3.5*box);
    arc (creatureX, creatureY+0.5*box, 30*box, 30, PI, 2*PI);
    arc (creatureX, creatureY+2*box, 4.8*box, 5*box, PI, 2*PI);
    fill(255, 0, 0);
    ellipse(creatureX+.8*box, creatureY+1*box, 1*box, 1*box);
    ellipse(creatureX-.8*box, creatureY+1*box, 1*box, 1*box);
    fill(255, 255, 0);
    ellipse(creatureX+.8*box, creatureY+1*box, .6*box, .6*box);
    ellipse(creatureX-.8*box, creatureY+1*box, .6*box, .6*box);
    fill(0,0,0);
    ellipse(creatureX+.8*box, creatureY+1*box, .3*box, .3*box);
    ellipse(creatureX-.8*box, creatureY+1*box, .3*box, .3*box);
    arc (creatureX, creatureY+2.5*box, 3*box, 1*box, 0, PI);
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
