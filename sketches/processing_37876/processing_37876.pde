
//Bryan Williams
//September 18, 2011
//Computational Methods
//Homework 4.3

size(400,400);
background(30);
smooth();

//this creates the lines that form the background grid
for (int x=50; x<width-25; x+=50) {
  stroke(60);
  strokeWeight(.5);
  line(x,0,x,width); //this creates the vertical lines across the composition
  line(0,x,height,x); //this creates the horizontal lines across the composition
}

for (int B = 10; B <= width; B+=50) {
  for (int W = 36; W <= width; W+=50) {
    
    //this forms the dots
    pushMatrix();
    noStroke();
    translate (14,14);
    fill(random(0),random(101),random(240)); //dot color 
    ellipse(B,W,random(20),random(20)); // Size of the dots
    popMatrix();
    
    //this creates the small rectangles 
    rectMode(CENTER); //This centers the rectangles
    pushMatrix();
    stroke(random(#EA6213),random(#EA6213));
    translate(14, -10);
    fill(255);
    rect(B,W,random(20),20);
    stroke(random(W), random(B), 20, 20);
    point(B, W); 
    popMatrix();
  }
}


