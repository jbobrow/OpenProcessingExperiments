
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
    noStroke(); //removes strokes here
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, 5.5*box, 1.5*box);
 

noStroke();
fill(0 ,255, 0);
arc(mouseX, mouseY-.5*box, 3.5*box, 1.5*box, -PI, 0); 



 if (mousePressed) {
   stroke(0,255,255);
   fill(0,255,255);
 }else {
   stroke(0,255,255,78);
   fill(0,255,255,78);
 }
 line(mouseX-1.5*box, mouseY+.5*box, mouseX-2.5*box, mouseY+10.5*box);
 line(mouseX+1.5*box, mouseY+.5*box, mouseX+2.5*box, mouseY+10.5*box);
noStroke();

ellipse(mouseX, mouseY+11.5*box, 9*box, 2*box);
 }


  //this colors the background and draws the grid
  public void drawBackground() {
    background(0,0,0);
    drawGrid();
  }
  
  //this function is to draw the grid using the boxes
  public void drawGrid() {
    stroke(255,255,255);
    strokeWeight(2);
    for (int i=1; i<number; i++) {
      //Horizontal line
      line(0, i*box, canvasWidth, i*box);
      
      //Vertical Line
      line(i*box, 0, i*box, canvasHeight);
      
    }
    
  }
