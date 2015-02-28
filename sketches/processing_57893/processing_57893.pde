


void setup () {
  size(720,480);
}


void draw () {
  int x = mouseX;
  int y = mouseY;

  background(255);
  smooth();
  stroke(0);
  strokeWeight(3);
  ellipseMode(RADIUS);

  
  // Head
fill(0); //set fill to black
ellipse(x, y,50, 50); //large head
fill(255); //set fill to white

 
//eyes
  if (mousePressed == true) {
  } else {
    //mouse is up
    //draw the open eye
    fill(140, mouseY, mouseX);
    ellipse(x+12, y-45, 15, 15);    // right
    fill(mouseY, mouseX, 90);
    ellipse(x-48, y, 15, 15);    // left

fill(255); //set fill to white
ellipse(x-48, y, 5, 5); //small left eye
ellipse(x+12, y-45, 5, 5); //small right eye

 
    }


fill(255); //set fill to white
quad(x-18, y, x+12, y-20, x+27, y-10, x+2, y+20); //mouth
 
//BODY
fill(0); //set fill to black
ellipse(x+42, y+50, 30, 30); //BODY 1

fill(240, mouseY , mouseX);
ellipse(x+57, y+40, 10, 10); //BODY 1 SMALL

fill(0); //set fill to black
ellipse(x+12, y+90, 30, 30); //BODY 2

fill(240, mouseY, mouseX);
ellipse(x-3, y+100, 10, 10); //BODY 2 SMALL

fill(0); //set fill to black
rect(x+32, y+70, 15, 130); //LONG BODY
fill(0); //set fill to black
rect(x+17, y+125, 45, 10); //SMALL BODY 1
fill(0); //set fill to black
rect(x+17, y+140, 45, 10); //SMALL BODY 2
fill(0); //set fill to black
rect(x+17, y+165, 45, 10); //SMALL BODY 3
fill(0); //set fill to black
ellipse(x+22, y+205, 20, 20); //LEG 1
fill(0); //set fill to black
ellipse(x+57, y+205, 20, 20); //BODY 1

}


