
int increment = 0;
boolean ascending = true;

void setup(){
  size(535,535);
  background(120,40,180);
 
}

void draw(){
  // here is a if.
  if (increment == 255) ascending = false;
  else if (increment == 0) ascending = true;
  
  if (ascending) increment++;
  else increment--;
  // The fillet of the rectangle is half the value of the increment
  int fillet = increment /2;
  
  
  if (mousePressed) {
    fill(150, fillet, increment);
  } else {
    fill(150,increment, fillet);
  }
  // fillet dosn't work in 1.5.1
  background(increment, 20, increment);
  rect(10, 10, 255, 255);
  rect(10, 270, 255, 255);
  rect(270, 10, 255, 255);
  rect(270, 270, 255, 255);
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseX,mouseX,50,50);
  ellipse(mouseY,mouseY,50,50);
  ellipse(mouseY,mouseX,50,50);
  println("Here's the value: " + increment);
}

