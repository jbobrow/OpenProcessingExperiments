
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
  fill(mouseX/4, random(255), random(200));
  rect(mouseX, mouseY, x,  y);
  rect(mouseX + 100, mouseY + 100,  x,  y);
  rect(mouseX + 100, mouseY,  x,  y);
  rect(mouseX, mouseY + 100,  x,  y);
}

void shift(){              //shifting between square and circle
  if (keyPressed == true) {
    fill(255, random(222), random(248), random(40));
    ellipse(mouseX, mouseY,  x,  y + 10);
    ellipse(mouseX + 100, mouseY + 100,  x + 10,  y);
    ellipse(mouseX + 100, mouseY,  x,  y - 10);
    ellipse(mouseX, mouseY + 100,  x - 10,  y);
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
    


