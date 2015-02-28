
PImage bluedrops; PImage shells; PImage redflower; PImage coraldrops; PImage pinkshell;
float aspect; boolean paused = false;
int x = 0; 
int y = 0;

void setup() {
  size(800,800);
  background(255);
  bluedrops  = loadImage("blue drops.png");
  shells = loadImage("shells.png");
  redflower = loadImage("red flower.png");
  coraldrops = loadImage("coral drops.png");
  pinkshell = loadImage("pink shell.png");
  frameRate(10);
}

void draw(){
  //fading middle square
//  fill(20, 100, 170, 3);
//  rect(100, 100, 600, 600);
  //DRAWING RANDOM BLUEDROPS  
  //! is the same as saying "not"
  if(!paused){
    aspect = random(0, 1);
    //flashing drops
    image(bluedrops, random(width), random(height), bluedrops.width*aspect, bluedrops.height*aspect);
    image(coraldrops, random(width), random(height), coraldrops.width*aspect, coraldrops.height*aspect);
    image(shells, mouseX, mouseY, shells.width/3, shells.height/3);
    }
    image(pinkshell, x, y, 100, 100);
    image(pinkshell, x+200, y, 100, 100);
    image(pinkshell, x-200, y, 100, 100);
    image(pinkshell, x+400, y, 100, 100);
    image(pinkshell, x-400, y, 100, 100);
    image(pinkshell, x+600, y, 100, 100);
    image(pinkshell, x-600, y, 100, 100);
  x=x+70;
  y=y+70;
  //ellipse draw
  {
  stroke(random(0,255), random(0,255), random(0,255));
  strokeWeight(3);
  fill(255, 3);
  ellipse(400, 400, mouseX, mouseY);
  }
}

//draw shells wherever the mouse is pressed void mousePressed(){

  
void keyPressed(){
  //if you press the c key, clear the sketch
  if (key == 'c' || key == 'C') {
    background(255);
    }
  //press 'o' to draw a random redflower once
  if (key == 'o' || key == 'O') {
    image(redflower, random(width), random(height), redflower.width/4, redflower.height/4);
    }
  //press the space bar to pause and unpause
  if(key == ' '){
    //if it is paused (i.e. paused == true) make paused be false
    //i.e. if it's paused, unpause it.
    if(paused) {paused = false;}
    //otherwise, pause it.
    else {paused = true; }
    }
    //screen shots
    {
    if(key=='1') saveFrame("01.png"); 
    if(key=='2') saveFrame("02.png");
    if(key=='3') saveFrame("03.png"); 
    if(key=='4') saveFrame("04.png");
    if(key=='5') saveFrame("05.png"); 
    if(key=='6') saveFrame("06.png"); 
    if(key=='7') saveFrame("07.png"); 
    }
}


