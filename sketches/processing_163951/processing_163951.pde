
///happens once
void setup(){
  ///sets up size of canvas
  size(1100, 700);
  ///ends void setup
}
void draw(){
//when q is press group will happen
if (key == 'q'|| key == 'Q'){
  group();
}
//when w is pressed symmetry group will happen
if (key =='w' || key == 'W'){
  symmetry();
}
///when e is pressed promitiy will happen
if (key =='e' || key == 'E'){
  proximity();
}
}
///speperate group actions
void group (){
  background(14,4,14);
 ///set the fill(blue level) to change with the y of mouse
 noStroke();
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(100, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(300, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(500, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(700, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(900, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(1100, 100, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(100, 300, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(300, 300, 100, 100);
  ///set the fill(blue level) to change with the y of mouse
  fill(144, 13, mouseY+50);
  ///creates a rectangle
  rect(500, 300, 100, 100);
  ///sets fill of rectangle
  fill(144, 13, 50);
  ///creates a rectangle
  rect(700, 300, 100, 100);
  //sets fill of rectangle
  fill(144, 13, 50);
  ///creates a rectangle
  rect(500, 300, 100, 100);
  //sets fill of rectangle
  fill(144, 13, 50);
  ///creates a rectangle
  rect(900, 300, 100, 100);
  ///set the fill(green level) to change with the y of mouse
  fill(144, mouseY, 50);
  ///creates a rectangle
  rect(100, 500, 100, 100);
  ///set the fill(green level) to change with the y of mouse
  fill(144, mouseY, 50);
  ///creates a rectangle
  rect(300, 500, 100, 100);
  ///set the fill(green level) to change with the y of mouse
  fill(144, mouseY, 50);
  rect(700, 500, 100, 100);
  ///set the fill(green level) to change with the y of mouse
  fill(144, mouseY, 50);
  rect(500, 500, 100, 100);
  ///set the fill(green level) to change with the y of mouse
  fill(144, mouseY, 50);
  ///creates a rectangle
  rect(900, 500, 100, 100);
  ///ends void draw
}
void symmetry (){
  ///create a blackground color
  background(110,114,200);
  ///has the rect move with y but times 1.5 +250 y, so it moves faster than other rect
  rect(300, mouseY*1.5+250, 100, 200);
  ///black fill
   fill(0);
   ///makes a rectangle
  rect(500, 250, 100, 200);
  ///black fill
    fill(0);
    ///a rectangle that also moves with y location of the mouse
  rect(700, mouseY/1.5+250, 100, 200);
  ///creates a non moving ellipse
  ellipse(150, 350, 200, 200);
  ///creates a non moving ellipse
  ellipse(950, 350, 200, 200);
  ///ends drawing void
 
}
void proximity (){
  ///this has the amount of red in the background change with the y loction of mouse
  background(mouseY, 82, 155);
  ///a stroke of white
  stroke(255);
  ///a fill of white
  fill(255);
  ///this has the y location of the ellipse move along with the mouse, also creates an ellipse
  ellipse(400, mouseY, 150, 150);
  ///no stroke (probbaly don't need this)
  stroke(0);
  ///create a fill color the rectangle below
  fill( 50, 70, 99);
  ///creates a rectangle
  rect(0, 400, 1100, 300);
  ///creates a white stroke
  stroke(255);
  ///creates a white fill for ellipse
  fill(255);
  ///creates an ellipse that y location changes with x location of mouse
  ellipse(400, mouseX, 200, 120);
  ///encases what i've written in void draw
}




