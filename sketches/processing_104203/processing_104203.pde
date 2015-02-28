
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
    
  }
    
  //this is for our animation. It redraws things 18 times a second
  public void draw() {
    drawBackground(); //take this out if you want to erase things
    creatureX= mouseX;
    creatureY= mouseY;
    drawCreature();
  }
  
  //this functions is for your creature.
  //Use variables:creatureX and creatureY
  //Recommended to use: box as a variable
  private void drawCreature() {
    //put your creature files in here
     //removes strokes here
    fill(0, 255, 202);
    rect(mouseX, mouseY, 150, 150);
    fill(0, 0, 0);
    line(creatureX+50, creatureY+15, creatureX+50, creatureY+75);
    fill(0, 0, 0);
    line(creatureX+100, creatureY+15, creatureX+100, creatureY+75);
    fill(0, 0, 0);
    line( creatureX+10, creatureY+100, creatureX+140, creatureY+100);
    fill(245, 218, 111);
    triangle(creatureX+10, creatureY+100, creatureX+60, creatureY+100, creatureX+35, creatureY+140);
    fill(245, 218, 111);
    triangle(creatureX+90, creatureY+100, creatureX+140, creatureY+100, creatureX+115, creatureY+140);
    fill(39, 100, 31);
    ellipse(creatureX+99, creatureY+109, 26, 11);
    fill(245, 218, 111);
    triangle(creatureX+50, creatureY+100, creatureX+100, creatureY+100, creatureX+75, creatureY+140);
    fill(39, 100, 31);
    ellipse(300, 300, 300, 200);
    
  }
  
  //this colors the background and draws the grid
  public void drawBackground() {
    background(255, 255, 255);
    
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
