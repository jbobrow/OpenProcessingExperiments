
  background(#4339E0); //makes the background color blue
}

void draw() {
 


{
   if (mousePressed) { // if the mouse is pressed the green triangle will show up
  stroke(0);
  fill(#36F502);  // makes the squares green.
  rectMode(CENTER);
    rect(mouseX,mouseY,20,20); // makes the squares a certain size
     } else {
  ellipse(20,20,20,20) ; // shows a circle at the beginning of the sketch untill you press the mouse
     }
}
}
void keyPressed() {
  background(255);

}

