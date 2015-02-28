
/* Assignment #2
 * Name: Justin Wei
 * E-mail: jwei@haverford.edu
 * Course: CS 110 - Section #2
 * Submitted: 2/7/12
 
 * I used primitives (a mix of rectangles and quadrilaterals) to create the background 
 image of a road leading into the horizon. I created a sun with an ellipse, and used
 an illiteration to create a glowing effect around it. I used 2 separate functions to
 create drawings of superman and a chicken, which vary in size based on the position
 of the pointer when the mouse is clicked. I thought it would be funny to have a chicken
 crossing the road. I added in superman due to my love of superheroes!*/

//horizon's y-coordinate
float horizony;

void setup() {
  size(750, 750);
  background(158, 118, 66);
  horizony=height/2;

  //sky in the background
  noStroke();
  rectMode(CORNER);
  fill(43, 185, 255);
  rect(0, 0, width, horizony);

  //sun
  if (mouseX < width/2) {
    fill(251, 255, 105);
    ellipseMode(CENTER);
    ellipse(width/5, horizony/4, width/15, width/15); 

    //glow/radiance around the sun
    float i=1;
    while (true) {
      fill(251, 255, 105, 16-i);
      ellipse(width/5, horizony/4, i*width/30, i*width/30);
      i = i+0.3;
      if (i>11) break;
    }
  }

  //roadway
  noStroke();
  fill(50);
  quad(2.1*width/4, horizony, width, height, 0, height, 1.9*width/4, horizony);

  //yellow lines marking road's borders
  fill(218, 201, 50);
  smooth();
  quad(2.1*width/4+width/750, horizony, width, height, width-width/60, height, 2.1*width/4, horizony); 
  quad(1.9*width/4, horizony, width/60, height, 0, height, 1.9*width/4-width/750, horizony);

  //lane divider in the middle of the road
  smooth();
  fill(255);
  quad(width/2+width/1500, horizony, width/2+width/1000, horizony+height/150, width/2-width/1000, horizony+height/150, width/2-width/1500, horizony);
  quad(width/2+width/938, horizony+height/75, width/2+width/750, horizony+height/42, width/2-width/750, horizony+height/42, width/2-width/938, horizony+height/75);
  quad(width/2+width/682, horizony+height/30, width/2+width/500, horizony+height/21, width/2-width/500, horizony+height/21, width/2-width/682, horizony+height/30);
  quad(width/2+width/469, horizony+height/17, width/2+width/375, horizony+height/13, width/2-width/375, horizony+height/13, width/2-width/469, horizony+height/17);
  quad(width/2+width/341, horizony+height/11, width/2+width/288, horizony+height/8.5, width/2-width/288, horizony+height/8.5, width/2-width/341, horizony+height/11);
  quad(width/2+width/268, horizony+height/7, width/2+width/221, horizony+height/5.6, width/2-width/221, horizony+height/5.6, width/2-width/268, horizony+height/7);
  quad(width/2+width/208, horizony+height/4.7, width/2+width/170, horizony+height/3.7, width/2-width/170, horizony+height/3.7, width/2-width/208, horizony+height/4.7);
  quad(width/2+width/163, horizony+height/3.1, width/2+width/136, horizony+height/2.5, width/2-width/136, horizony+height/2.5, width/2-width/163, horizony+height/3.1);
  quad(width/2+width/129, horizony+height/2.2, width/2+width/114, height, width/2-width/114, height, width/2-width/129, horizony+height/2.2);
}

void draw() {
}



//function that draws chickens
void drawchicken (float x, float y) {
  float  dfh = mouseY-horizony; //dfh is the distance from the horizon line
  
  //chicken's body
  fill(255);
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(dfh/100);
  smooth();
  ellipse(mouseX, mouseY, dfh/6, dfh/4);

//chicken feet
  fill(226, 206, 21);
  strokeWeight(dfh/120);
  ellipse(mouseX+dfh/40, mouseY+dfh/9, dfh/25, dfh/25);
  ellipse(mouseX-dfh/40, mouseY+dfh/9, dfh/25, dfh/25);
  
//chicken eyes
  fill(0);
  strokeWeight(dfh/250);
  ellipse(mouseX+dfh/75, mouseY-dfh/20, dfh/250, dfh/70);
  ellipse(mouseX-dfh/75, mouseY-dfh/20, dfh/250, dfh/70);

//beak
  fill(226, 206, 21);
  strokeWeight(dfh/250);
  triangle(mouseX+dfh/80,mouseY-dfh/90, mouseX-dfh/80,mouseY-dfh/90, mouseX,mouseY+dfh/40);

//chicken crown
  fill(255, 0, 0);
  arc(mouseX-dfh/65,mouseY-dfh/8, dfh/45,dfh/30, PI,2*PI);
  arc(mouseX+dfh/65,mouseY-dfh/8, dfh/45,dfh/30, PI,2*PI);
  arc(mouseX,mouseY-dfh/8, dfh/38,dfh/24, PI,2*PI);
  
//chicken wings
  fill(255);
  strokeWeight(dfh/100);
  arc(mouseX+dfh/14.5,mouseY, dfh/35,dfh/9, -0.8,3.1);
  arc(mouseX-dfh/14.5,mouseY, dfh/35,dfh/9, 0.05,3.9);
  
}

//function that draws superman
void drawsuperman (float sx, float sy) {
  float  dfh = horizony-mouseY; //dfh is the distance from the horizon line
  
  //superman's cape
  fill(0, 0, 255);
  noStroke();
  strokeWeight(dfh/200);
  triangle(mouseX,mouseY, mouseX+dfh/15,mouseY+dfh/6, mouseX-dfh/15,mouseY+dfh/6);
  
  //superman's head
  fill(255, 204, 153);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY, dfh/20,dfh/20);
  
  //superman's body
  fill(0, 0, 255);
  stroke(255,0,0);
  strokeWeight(dfh/100);
  triangle(mouseX-dfh/18,mouseY+dfh/32, mouseX+dfh/18,mouseY+dfh/32, mouseX,mouseY+dfh/7);
  
  //superman's limbs
  fill(0, 0, 255);
  strokeCap(SQUARE);
  stroke(0, 0, 255);
  strokeWeight(dfh/100);
  line(mouseX-dfh/18,mouseY+dfh/32, mouseX-dfh/13,mouseY-dfh/18);
  line(mouseX+dfh/18,mouseY+dfh/32, mouseX+dfh/13,mouseY-dfh/18);
  line(mouseX,mouseY+dfh/7, mouseX-dfh/38,mouseY+dfh/3.5);
  line(mouseX,mouseY+dfh/7, mouseX+dfh/38,mouseY+dfh/3.5);
}


void mousePressed() {
  if (mouseY<horizony) {
    //allows you to create supermen when you click the mouse
    drawsuperman (mouseX, mouseY); 
  }
   
  else { 
    //allows you to create chickens when you click the mouse
    drawchicken (mouseX, mouseY);
  }
    
}


