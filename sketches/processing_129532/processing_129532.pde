
// SCIMA-200-05 | Math Programming and Art
// Homwwork 20130923
// William Felker
//
//


import processing.opengl.*;



void setup(){

  size(800, 800, OPENGL);

  smooth();

  fill(0,0,200,180);

}



void draw(){

  background(255);

  lights();

  pushMatrix();

  translate(width/3,height/3,0);

  rotateY(map(mouseX,0,width,-PI/2,PI/2));

  rotateX(map(mouseY,0,height,-PI/2,PI/2));

  drawShapes();

  popMatrix();

}



void drawShapes(){

  
// Base 
  
line(0,0,0,0,10,0);// FRONT-BOTTOM-left
line(0,0,0,300,0,0);// FRONT-TOP-Bottom
line(0,10,0,300,10,0);// FRONT-TOP-Bottom
line(300,0,0,300,10,0);// FRONT-BOTTOM-right

 
// Base top plane
line(0,0,0,0,0,-175);
line(0,10,0,0,10,-175);

line(300,0,0,300,0,-175);
line(300,10,0,300,10,-175);


line(0,0,-175,0,10,-175);// FRONT-BOTTOM-left
line(0,0,-175,300,0,-175);// FRONT-TOP-Bottom
line(0,10,-175,300,10,-175);// FRONT-TOP-Bottom
line(300,0,-175,300,10,-175);// FRONT-BOTTOM-right


//screen plane

line(0,10,-175,0,-175,-185); // left
line(0,-175,-185,300,-175,-185); // top
line(300,-175,-185,300,10,-175); // right

//internial screen ratio

line(10,-170,-185,290,-170,-185); // top
line(290,-170,-185,290,0,-175);// right
line(10,-170,-185,10,0,-175); // left

}    



