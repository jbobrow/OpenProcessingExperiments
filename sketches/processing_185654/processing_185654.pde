

float r,g,b;  //floating variables ( decimal place number, precision )

void setup(){ //Run only Once, intial setup
  size(320,240);  //size(displayWidth, displayHeight); // adapt program to monitor size
  frameRate(30); // actual framerate of program
  }
  void draw(){ //refresh commands forever
  // background color
  fill(r,g,b);   //variables for color of shapes
 rectMode(CENTER);  //position of rectangle
 rect(width/2, height/2, 100,100);  //rectangle constraints
  ellipse(mouseX,mouseY, 20,20);  //ellipse constraints and movement
 if(keyPressed){ r = random(255);  // color (red)
g = random(255); // color (green)
b = random(255); // color (blue) //if (Boolean Expression(function, number =,<,> number, etc.){ Code to Execute (true)}else[ Code to Execute (false)}
 }
}
void mousePressed(){ // event function (key click, mouse click)
r = random(255);  // color (red)
g = random(255); // color (green)
b = random(255); // color (blue)
println(frameRate); // prints frame rate in console
println(keyCode); // print key pressed
} 
