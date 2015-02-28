
void setup (){
  size(1000,1000);                                    //setting canvas size
  noFill();                                           //turning off the filling of color in shapes drawn
  smooth();                                           //making curved edges smoother than they would usually be
}

void draw(){
}
  void mousePressed(){                                //when you press the mouse it runs this function
  strokeWeight(random(20));                           //random thickness of lines between 0 and 20 pixels thick
  ellipse(random(width),random(height),mouseX,mouseY);//draws ellipse's with the width and height based on where the mouse is on the canvas
  fill(random(255),random(255),random(255));          //random color fill between 0 and 255 on red, greeen, and blue
}

void keyPressed(){                                    //when you press any keyboard key this function runs
  save("screenshot.png");                             //saves a canvas shot when you press a keyboard key
}


