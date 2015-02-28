
void setup () {
size(800,800);
}

 void draw () {
   
background(60,80,120); // Sets the black background

float x = mouseX;
float y = mouseY;
stroke(180); // Sets line value to white
strokeWeight(20); // Sets line width to 5 pixels
smooth(); // Makes the lines draw with smooth edges

fill(80,20,130);
rect (80,50,120,180);


  fill(74,83,1);
  ellipse(x-75, y, x+20, y-100);
  fill(140,13,130);
  triangle(x+40, y+320, x-70, y-50,x+45,y+34);
  strokeWeight(40); // Sets line width to 5 pixels
  fill(80,20,12);
  ellipse(x+80, y, x+120, y-300);
}

