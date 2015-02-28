
//Creature

//variable declarations
//int x = width/2 + 50;
//int y = height/2 - 17;
int x;
int y;
float headCentreX;
float headCentreY;
float wingCentreX;
float wingCentreY;
float easing = 0.4;
float angle = 0.0;


//runs once
void setup() {
  size(500, 500);
  smooth();
  println("Setup complete!");
}



//runs continuously
void draw() {
  background(130, 200, 100);
    
  //bg
  stroke(30, 120, 20, 100);
  for (int i = 0; i < width; i += 2) {
    line(i, height, width, height-i);  
  }

  stroke(0, 150, 100, 180);
  for (int i = width; i > 0; i--) {
    line(i, 0, i*4, height);
  }
  
  
  //variable definitions
  float targetX = mouseX;
  x += (targetX - x)*easing;
  y = mouseY;
  headCentreX = pmouseX-30;
  headCentreY = pmouseY-30;
  wingCentreX = x - 10;
  wingCentreY = y - 10;

  
  if (mousePressed) {
    
    //println(mouseX + " and " + mouseY);
    
    //increment angle of rotation
    if (angle < QUARTER_PI) { //until reach PI/4
      angle += 0.3;
    }
    
    //head nod on mouse press
    headCentreY = y - 20;
    
    //leg contraction on mouse press
    y = y - 50;

    //legs
    stroke(0);
    line(x-5, y+50, x-5, y+144);
    line(x+5, y+50, x+5, y+144);
    
    //feet
    fill(0, 200);
    triangle(x+5 -10, y+145, 
             x-15 -10, y+145, 
             x -10, y+135);
    triangle(x+5, y+145, 
             x-15, y+145, 
             x, y+135);
             
    y = mouseY;
  
  //else mouse unpressed
  }else{
    
    angle = 0.0;
    
    stroke(0);
    line(x-5, y, x-5, y+144);
    line(x+5, y, x+5, y+144);
    
    //feet
    fill(0, 200);
    triangle(x+5 -10, y+145, 
             x-15 -10, y+145, 
             x -10, y+135);
    triangle(x+5, y+145, 
             x-15, y+145, 
             x, y+135);
  }

  //back wing
  noStroke();
  fill(26, 40, 183, 180);
    
  pushMatrix(); //save copy of coord system
  translate(wingCentreX, wingCentreY); //change the location of origin
  rotate(angle); //rotate wing about origin
  quad(-20, 0, 
     90 -40, -10,
     85 -40, -45,
     50 -40, -65);

  //tail
  rotate(-2*angle);
  triangle(60, 60,
         100, 80,
         105, 65);
  triangle(50, 50,
         70, 80,
         85, 50);
  triangle(40, 40,
         50, 70,
         70, 45);       
  popMatrix(); //restore original coord sys

  //body
  fill(30);
  ellipse(x, y, 100, 100);

  //front wing
  noStroke();
  fill(26, 40, 183, 180);
  
  pushMatrix(); //save copy of coord system
  translate(wingCentreX, wingCentreY); //change the location of origin
  rotate(angle);
  quad(20, 0, 
     90, -10,
     85, -45,
     50, -65);
  popMatrix(); //restore original coord sys
     
  //head
  fill(0, 200);
  ellipse(headCentreX, headCentreY, 70, 70);

  //eyes
  stroke(90, 0, 0);
  fill(180, 0, 0, 180);
  ellipse(headCentreX-32, headCentreY, 10, 15); 
  ellipse(headCentreX+32, headCentreY, 10, 15); 

  //mouth
  stroke(255);
  noFill();
  arc(headCentreX, headCentreY+50, 20, 50, PI/2, TWO_PI-PI/2);
  
}

