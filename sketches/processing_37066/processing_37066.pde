
//grid of rectangles w/ Hue, Saturation & Brightness changes

void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER); //Draws rectangles from their center
}

void draw(){
  colorMode(HSB,mouseX); //Sets to Hue/Sat./Brig. and gives it a rangle of the mouse position in X
  
  for(int x=50;x<width;x+=100){ //Sets up grid in X with a 50px border & 100px separation
    for(int y=50;y<height;y+=100){ //Sets up grid in y with a 50px border & 100px separation
      fill(x,mouseX,mouseY);
      //the fill is set up with a hue dependent on integer x as defined above
      //and a saturation & brightness dependent on mouse x & mouse y
      rect(x,y,30,30); //integers above set the grid of rect, then the height and width are static
    }
  }
}

//reset sketch code borrowed & modified from Sean Gillespie
void mousePressed() {//when mouse is pressed the sketch redraws
  if (mousePressed == true) {//when mouse is pressed count is reset to draw over sketch
    setup();
  }
}

