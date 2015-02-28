
/* Credit Winnie Chang: http://www.openprocessing.org/sketch/23757 */

int changecolour = 0;

void setup(){
  size(800,533);
  PImage bg;
  bg = loadImage("cake.jpg");
  background(bg);
  
  //setting the cursor
  PImage icing;
  icing = loadImage("icing.png");
  cursor(icing);
 
}


void draw(){
  frameRate(100);
  smooth();
  fill(changecolour);
  noStroke();
  if (mousePressed == true){
  ellipse(mouseX-85, mouseY+85,15,15);
}

  if(keyPressed){
  if (key == 'r' || key == 'R'){
    changecolour = #FA2D2D;//red
  }
  
  if (key == 'o' || key == 'O'){
  changecolour = #FF6905;//orange
  }
  
  if (key == 'y' || key == 'Y'){
    changecolour = #FFF752;//yellow
  }
  
  if (key == 'g' || key == 'G'){
    changecolour = #8ECEA8;//green
  }
  
  if (key == 'b' || key == 'B'){
    changecolour = #73C6FC;//blue
  }
  
  if (key == 'k' || key == 'K'){
    changecolour = 0;//black
  }
  
  if (key == 'w' || key == 'W'){
    changecolour = 255;//white
  }
  
  //reset the background
   if (keyPressed) {
   if(key == BACKSPACE || key == DELETE) {
    PImage bg;
    bg = loadImage("cake.jpg");
    background(bg);
    fill(0);
    }
    }
    }
}







