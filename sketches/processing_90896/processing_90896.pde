
int x = 25;
int y = 25;
void setup(){                 //set up
  size(500, 500);
  noCursor();
  noStroke();
  background(225);
}

void draw(){
  shift();
  grow();
  
}

void square(){
  colorMode(HSB, 200);
  fill(115, random(124), random(179), random(15));    //colorshift
  rect(mouseX, mouseY, x,  y);
  rect(mouseX + 100, mouseY + 100,  x,  y);
  rect(mouseX + 100, mouseY,  x,  y);
  rect(mouseX, mouseY + 100,  x,  y);
}

void shift(){              //shifting between square and circle
  if (keyPressed == true) {
    ellipse(mouseX, mouseY,  x,  y);
    ellipse(mouseX + 100, mouseY + 100,  x,  y);
    ellipse(mouseX + 100, mouseY,  x,  y);
    ellipse(mouseX, mouseY + 100,  x,  y);
  } else {
    square();
   }
}

void grow(){
  if (mousePressed == true) {
      x ++;
      y ++;
  } else {
    shift ();
  }
}
    


