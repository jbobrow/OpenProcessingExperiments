
void setup() {       //instructions that are run ONLY when program starts
  background(0);     //sets initial background color (black)
  size(600, 500);    //sets size for program (x, y)
  //frameRate(30);   //sets framerate for program
  noStroke();        //turns off all outlines(we turn it on again later)
}

void draw() {        //the loop!
  background(250);   //overrides setup background with new near-white background every frame (try commenting it out!)
  
  fill(150, 0, 200, 100); //sets a color
  rectMode(CORNER); //set rectangle drawing mode to corner
  rect(450, 200, 100+cos(.1*frameCount)*30, 100+sin(.1*frameCount)*30);  // draw first rectangle (with motion! uses some trig)

  fill(200, 150, 0, 100);  //sets new color (remember, R, G, B, Alpha)
  stroke(0);   //sets stroke(outline) color to black
  //noFill();  //kills fill color (makes shapes empty/transparent)
  rectMode(CENTER); //sets rectangle mode to center
  rect(450 + sin(frameCount * 0.1) * 20, 200+cos(frameCount * 0.1) * 20, 100, 100); //draws second rectangle (now motion is on coordinates and not size) 

  // EYEBALLS
  stroke(0, 0, 255, 50); 
  strokeWeight(5);
  noSmooth();
  fill(255);
  ellipse(200, 300, 400, 200);
  fill(mouseX, mouseY, 230); 
  ellipse(200, 300, 200, 200);
  fill(0); 
  noStroke(); 
  ellipse(200, 300, 40, 40);


  stroke(0);
  strokeWeight(1);
  strokeCap(SQUARE); 
  line(0, 0, 100, 100); 
  line(100, 100, 150, 190);
  line(20, 0, 120, 100);
  line(30, 0, 130, 100);

  noStroke(); 
  fill(255, 0, 0, 100);
  quad(158, 55, 199, 14, 392, 66, 351, 107); 
  stroke(0); 
  triangle(347, 54, 293, 9, 392, 66);
}



