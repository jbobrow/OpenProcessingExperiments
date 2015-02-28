
void setup() { background(200,55,30); size (400,400);  smooth();  noCursor(); }

void draw() { 
  noStroke();  fill(200,55,30);
//rect(0,0,width, height);
  

  
if(mousePressed)  { 
 
  fill(0,30);
  stroke(255);
  noCursor ();
}

else { 
  fill(255,30);
  stroke(0);
}

 ellipse(mouseX, mouseY,80,80);
}
