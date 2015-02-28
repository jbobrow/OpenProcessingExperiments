
//Position
float xPos = 0;
//Direction
float xDir = 1;

//Position
float yPos = 0;
//Direction
float yDir = 1;


void setup() {
  size (400, 200);
  smooth();
  noCursor ();
}


void draw () {
  

  
  
  background(200,30,30);

  ellipse(xPos, height/2, 20, 20);
  strokeWeight(1000);
  smooth ();
  fill (255);
  
 if (mousePressed) {stroke (255); strokeWeight(50); smooth(); fill (255,80);} 
if (keyPressed) { stroke (0); strokeWeight(100); smooth();}
 
 ellipse (mouseX,mouseY,40,40);
  
  

  if (xPos > width) {
    xDir = -1;
  }

  if (xPos < 0) {
    xDir = 1;
  }


  //101 = 100 + (+1)
  //99 = 100 + (-1)
  xPos = xPos +xDir;

  println(xPos + "" + xDir);
  
  
   ellipse(width/2, yPos, 10, 10);

  if (yPos > height) {
    yDir = -1;
  }

  if (yPos < 0) {
    yDir = 1;
  }


  //101 = 100 + (+1)
  //99 = 100 + (-1)
  yPos = yPos +yDir;

  println(yPos + "" + yDir);
  
  
  
  
  
  
  
}

