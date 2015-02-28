
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
    stroke(0,0,0);
    fill(139, 69, 19);
    rect(mouseX,mouseY,150,240,14);
    fill(0,0,0);
    ellipse(mouseX+25,mouseY+25,34,34);
    ellipse(mouseX+125,mouseY+25,34,34);
    fill(255,0,0);
    rect(mouseX+25,mouseY+70,100,150,14);
    fill(255,255,255)
    triangle(mouseX+40,mouseY+90,mouseX+27,mouseY+70,mouseX+
  }
  
  //this colors the background and draws the grid
  public void drawBackground() {
    background(255,0,0);
    
  }
