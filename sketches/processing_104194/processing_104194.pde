
//Light Green = 102,211,108
//Medium Green = 79,183,85
//Green = 78,180,81
//Pink = 277,110,80
//Red = 231,77,38

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
 //JUST PIXELS HERE
  private void drawCreature() {
    //put your creature files in here
    noStroke(); //removes strokes here
    fill(79,183,85);
    rect(mouseX, mouseY, box,box);
    fill(231,77,38);
    rect(creatureX+1*box,creatureY, box,box);
    fill(277,110,80);
    rect(creatureX+2*box,creatureY,box,box);
    fill(277,110,80);
    rect(creatureX+3*box,creatureY,box,box);
    fill(231,77,38);
    rect(creatureX+4*box,creatureY,box,box);
    fill(231,77,38);
    rect(creatureX+5*box,creatureY, box,box);
    fill(231,77,38);
    rect(creatureX+8*box,creatureY,box,box);
    fill(78,180,81);
    rect(creatureX+9*box,creatureY,box,box);
    fill(78,180,81);
    rect(creatureX, creatureY+1*box,box,box);
    fill(102,211,108);
    rect(creatureX+1*box,creatureY+1*box,box,box);
    fill(231,77,38);
    rect(creatureX+2*box,creatureY+1*box,box,box);
    fill(231,77,38);
    rect(creatureX+3*box,creatureY+1*box,box,box);
    fill(277,110,80);
    rect(creatureX+4*box,creatureY+1*box,box,box);
    fill(231,77,38);
    rect(creatureX+7*box,creatureY+1*box,box,box);
    fill(231,77,38);
    rect(creatureX+5*box,creatureY+1*box,box,box);
    fill(231,77,28);
    rect(creatureX+8*box,creatureY+1*box,box,box);
    fill(79,183,85);
    rect(creatureX+9*box,creatureY+1*box,box,box);
    fill(78,180,81);
    rect(creatureX+9*box,creatureY+1*box,box,box);
   
    fill(78,180,81);
    rect(creatureX+1*box,creatureY+2*box,box,box);
    fill(102,211,108);
    rect(creatureX+2*box,creatureY+2*box,box,box);
    fill(231,77,38);
    rect(creatureX+3*box,creatureY+2*box,box,box);
    fill(231,77,38);
    rect(creatureX+4*box,creatureY+2*box,box,box);
    fill(231,77,38);
    rect(creatureX+5*box,creatureY+2*box,box,box);
    fill(231,77,38);
    rect(creatureX+6*box,creatureY+2*box,box,box);
    fill(78,180,81);
    rect(creatureX+7*box,creatureY+2*box,box,box);
    fill(79,183,85);
    rect(creatureX+8*box,creatureY+2*box,box,box);
    fill(79,183,85);
    rect(creatureX+2*box,creatureY+3*box,box,box);
    fill(102,211,108);
    rect(creatureX+3*box,creatureY+3*box,box,box);
    fill(102,211,108);
    rect(creatureX+4*box,creatureY+3*box,box,box);
    fill(78,180,81);
    rect(creatureX+5*box,creatureY+3*box,box,box);
    fill(79,183,85);
    rect(creatureX+6*box,creatureY+3*box,box,box);
    fill(78,180,81);
    rect(creatureX+6*box,creatureY+3*box,box,box);
    fill(78,180,81);
    rect(creatureX+7*box,creatureY+3*box,box,box);
    fill(78,180,81);
    rect(creatureX+3*box,creatureY+4*box,box,box);
    fill(79,183,85);
    rect(creatureX+4*box,creatureY+4*box,box,box);
    fill(78,180,81);
    rect(creatureX+5*box,creatureY+4*box,box,box);
    fill(79,183,85);
    rect(creatureX+6*box,creatureY+4*box,box,box);
    
    fill(72,49,12);
    arc(300,450,200,200,0,PI);
    
    
    fill(0);
    rect(250,200,90,30);

    
  }
  
  //this colors the background and draws the grid
  public void drawBackground() {
    background(255,255,255);
    
    fill(240,212,143);
    ellipse(300,150,200,200);
    rect(280,240,40, 80);
    fill(0);
    ellipse(270,100,30,30);
    ellipse(350,100,30,30);
    fill(30,50,240);
    ellipse(270,100,20,20);
    ellipse(350,100,20,20);
    fill(255,255,255);
    ellipse(270,100,10,10);
    ellipse(350,100,10,10);
    fill(72,63,41);
    rect(0,500,5000,5000);
    
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
