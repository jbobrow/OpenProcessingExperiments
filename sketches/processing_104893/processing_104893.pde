
//barbara compagnoni modified painting
void setup() {
  size (360, 385); //only runs once, sets up frame size
  
}

//color shortcut
color r = color (255, 0, 0); //defines color red
color y = color (255, 255, 0); //defines color yellow
color b = color (0, 0, 255); //defines color blue
color w = color (255, 255, 255); //defines color white
color blk = color (0, 0, 0); //defines color black

int counter = 0;//set counter to 0

void draw() {
  
  background (mouseX, mouseY, 100); // background changes with the mouse

  //red squares
  fill (r);
  noStroke();
  rect (338, 295, 100, 100);
  rect (40, 40, 200, 200);

  //yellow squares
  fill(y);
  rect (0, 295, 40, 100);
  rect (240, 0, 100, 140);
  
  //blue squares
  fill (b);
  rect (240, 295, 100, 75);

  //white squares
  fill(w);
  rect (70, 0, 170, 40);
  rect (240, 140, 100, 100);
  
  //black squares
  fill (blk);
  rect (40, 240, 100, 100);
  rect (140, 340, 100, 30);

  //vertical lines from left to right
  stroke(blk);
  strokeCap (SQUARE);//square ends
  strokeWeight (5);
  line (5, counter, 390, counter);
  line (70, 40, 70, 5);
  line (240, 240, 240, 5);
  line (5, 240, 340, 240);
  line (5, 295, 390, 295);
  line (240, 140, 340, 140);

  //horizontal lines from top to bottom
  line (40, 40, 40, 370); 
  line (140, 240, 140, 380);
  line (240, 40, 240, 370); 
  line (290, 140, 290, 240); 
  line (340, 15, 340, 380); 
  
  fill (counter); //elllipse fill changes with the counter
  ellipse (mouseX, mouseY, 30, 30); //ellipse will follow mouse
  
  counter++;
  
  if (counter > height) {  // When 'counter' is greater then the max height...
    counter = 0;   //...counter resets
  }
println (counter);


}










