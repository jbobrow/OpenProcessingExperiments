
size(700, 400);
background(200);


smooth();

noStroke();
fill(0, 0, 200);

// E
 rect(50, 50, 100, 25); // top bar
 rect(50, 75, 25, 100); // vertical bar
 rect(50, 100, 75, 25); // mid bar
 rect(50, 150, 100, 25); // bottom bar
 
 // R
 rect(200, 50, 25, 125); // vertical bar
 rect(200, 50, 52, 25); // top bar
 rect(200, 110, 52, 25); // mid bar
 
 // curve paramaters
 strokeWeight(25); 
 stroke(0, 0, 200);
 strokeCap(SQUARE);
 noFill();
 
 arc(250, 92, 60, 60, radians(-90), radians(90)); // curve

/////////// reset fill
noStroke();
fill(0, 0, 200);

//leg
beginShape();
vertex(230,135);
vertex(258,175);
vertex(282,175);
vertex(255,135);
endShape(CLOSE);

///////////


// I
  rect(340, 50, 25, 125); // vertical bar
  
// K
  rect(425, 50, 25, 125); // vertical bar
  
  //top leg
  beginShape();
    vertex(445,100);
    vertex(495,50);
    vertex(525,50);
    vertex(450,125);
  endShape(CLOSE);
  
   //bottom leg
  beginShape();
    vertex(445,100);
    vertex(475,100);
    vertex(525,175);
    vertex(495,175);
  endShape(CLOSE);

//////////////////// Last Name 

//L

 rect(50, 200, 25, 100); // vertical bar
 rect(50, 300, 100, 25); // bottom bar
 
 //U
 rect(200, 200, 25, 93); // vertical bar
 
  // curve paramaters
 strokeWeight(25); 
 stroke(0, 0, 200);
 strokeCap(SQUARE);
 noFill();
 
 arc(242, 285, 60, 60, 0, radians(180)); // curve
 
 /////////// reset fill
  noStroke();
  fill(0, 0, 200);
  
  rect(260, 200, 25, 93); // vertical bar 2

// N

  rect(340, 200, 25, 125); // vertical bar 1
  
  // cross bar
    beginShape();
    vertex(340,210);
    vertex(365,200);
    vertex(450,313);
    vertex(425,325);
  endShape(CLOSE);
  
  rect(425, 200, 25, 125); // vertical bar 2
  
  
// D

  rect(500, 200, 25, 125); // vertical bar 1
  
   // curve paramaters
  strokeWeight(25); 
  stroke(0, 0, 200);
  strokeCap(SQUARE);
  noFill();
 
   arc(544, 262, 100, 100, radians(-90), radians(90)); // curve
   
   
  /////////// reset fill
  noStroke();
  fill(0, 0, 200);
  
  rect(500, 200, 45, 25); // bottom bar
  
  rect(500, 300, 45, 25); // bottom bar







 


