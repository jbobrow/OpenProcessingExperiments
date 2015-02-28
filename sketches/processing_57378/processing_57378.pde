
void setup () {                   //once
  println ("setup");
  size(300, 300);
  smooth();
}

void draw () {                    //repetetive 
  background(125);               //prints the speed that you move your mouse at
  ellipse(mouseX, mouseY,100,100); //allows for the circle to vary with the speed; changes with the speed
  rect(mouseX-50,mouseY+50,100,100);
  ellipse(mouseX+20, mouseY-20,30,30);  
  ellipse(mouseX+20,mouseY-20,10,10);
}

