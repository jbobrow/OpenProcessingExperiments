
void setup() {
  size(600, 600);
  background(0);  
  //  rectMode(CENTER);
}

//gloabal vars for our dragable rect
int x=50;
int y=50;
int w=100;
int h=100;

// this is the ammoutn the rect will fall when released
// each frame
float m=1;

//this is a flag so we can tell in our draw function if the
// regt is being dragged or not and render it accordingly
int drag=0;


void draw() {
  //if we are not draggin the rect
  if (drag == 0) {
    
    //if the y pos is smaller than the height of the window less
    //the height of the boc 
    if (y<height-h) {
      // make the y pos increace (apperance of falling)
      // and make the ammount we move it each time greate
      // appreance of acceleration
      y+=m+=.5;
    }
  }
  
  
  rect(x, y, w, h);
}

//this is the mouse dragged event handler
//code in here only happen when the mouse is dragged
void mouseDragged() {
  
  //set our flag so teh draw function kowns we are draggin teh rect
  drag=1;
  //init m back to 1
  m=1;
  
  //if mouse pos is inside out rect
  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
      //add to the current x and y the distance the
      //mouse has moved current - previous
    x+=mouseX-pmouseX;
    y+=mouseY-pmouseY;
  }
}

void mouseReleased() {
  //update our dragged flagg released is called once
  //when we let go of the mosue button
  drag=0;
}


