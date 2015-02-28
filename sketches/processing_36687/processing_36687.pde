
//Homework 3.2_Conditional Composition
//Created by Adrianne Blossom
//September 11, 2011

//This is a design created by using looping lines and random circles to create a pattern.
//The basis of my coding comes from the lab 3 examples.

void setup() {
  size(200, 200);
  smooth();
  background(201, 169, 134);
}

float count =0; //Starting point of where lines are drawn from.
float num = 30; //Total number of lines that can be drawn.
float circles=20; //Total number of randomly drawn circles.
float radius;


void draw() {

  if (circles > 0) {
    noStroke();
    fill(124, 26, 78);
    radius=random(2, 25); //Range of circle diameter sizes.
    ellipse(random(width-50), random(height-50), radius, radius); 
    //The way I implemented control into the random patterning of circles is by keeping it in the upper left corner of the composition. 
  }
  circles--; //Keeps circles from becoming a continuous loop.

  if (count < num) {
    if (count % 1==0) {
      stroke(124, 26, 78, 50);
      line(count*width/num, 0, count*width/num, height/2);
      //Light purple vertical lines.
    }
    if (count %7==0) {
      stroke(37, 227, 171);
      line(count*width/num, 0, count*width/num, height);
      //Green vertical lines.
    }
    if (count % 3==0) {
      stroke(227, 135, 37);
      line(count*width/num, 0, count*width/num, height);
      //Orange vertical lines.
    }


    if (count < num) {
      if (count %7==0) {
        stroke(37, 227, 171);
        line(0, count*height/num, width/2, count*height/num);
        //Green horizontal lines.
      }
      if (count %11==0) {
        stroke(227, 135, 37);
        line(0, count*height/num, width/2, count*height/num);
        //Orange horizontal lines.
      }
      if (count %1==0) {
        stroke(227, 135, 37, 85);
        line(width/2, 100+count*height/num, width, 100+count*height/num);
        //Light orange horizontal lines in 4th quadrant.
      }
      if (count % 1==0) {
        stroke(124, 26, 78,50);
        line(100, height/2+100, width, count*height/num);
        //Light purple diagonal lines.
      }

      count++; //Controls the lines being drawn.
    }
  }
}


