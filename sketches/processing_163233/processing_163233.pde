
/*
Reference:
 Getting started with Processing. Make a function, p118 - p124
*/

int a=10;                //for real-life resizing of the rat size
float ratSpeed = 1000;   //move the rats away
boolean purple = false; 
boolean green = false;
PImage yumeng;


void setup() {
  size(900, 640);
  yumeng = loadImage("yumeng.jpg");
}


void draw() {
  background(250, 255, 212);
  smooth();
  image(yumeng, random(0, width-150), random(0, height-154));


  for (int i=0; i<200; i++) {    //to draw multiple rats with for-loops
    for (int j=1; j<50; j++) {   //j is for both setting color transition and positioning the green rats

      float p = i*24*a;          //x position of purple rats
      float q = (i+.5)*24*a;     //x position of green rats

      if (purple) {
        // print(" anaesthesia");
        p +=ratSpeed;
      }
      if (green) {
        // print(" ontology");
        q +=ratSpeed;
      }

      stroke(25*j, 25*j, 35*j);              //draw the purple rats
      drawRat1(p, 8*a*sqrt(3)*(i+j));    
      fill(25*j, 25*j, 35*j);
      drawRat2(p, 8*a*sqrt(3)*(i+j)); 

      stroke(25*j, 35*j, 35*j);              //draw the green rats
      drawRat1(q, 8*a*sqrt(3)*(i+.5+j));      
      fill(25*j, 35*j, 35*j);
      drawRat2(q, 8*a*sqrt(3)*(i+.5+j));
    }
  }
}


void keyPressed() {
  if (key == 'p') {             //press p to chase away the purple rats
    purple = true;
    //print("proposition");
  } else if (key == 'g') {      //press g to chase away the green rats
    green = true;
    //print("edamame");
  }
}


void keyReleased() {           //I originally set this to false, like what we did for moving that 
  if (key == 'p') {            //red circle with four keys in class. But somehow the rats won't stay 
    purple = true;             //at the new position if I do so. They always go back to the original
  } else if (key == 'g') {     //position. But still, the keyPressed only run once in this sketch.
    green = true;              //What might be the problem?
  }
}

void mousePressed() {          //shrink down the size of the rats
  a--;
}


//the following two functions draw two parts of a rat
//(there are many square root 3 because the tessellated rats were created out of hextagons)
//(they have to tessellate!!)

//all the components of a rat that need noFill and stroke
void drawRat1(float x, float y) {
  pushMatrix();
  translate (-100, -860);

  pushMatrix();
  translate(x, y);

  noFill();
  strokeWeight(3);
  strokeJoin(MITER);

  beginShape();
  bezier(8*a, 6*a+6*a*sqrt(3), 13*a, 10*a+9*a*sqrt(3), 15*a, 10*a+9*a*sqrt(3), 20*a, 6*a+6*a*sqrt(3));
  bezier(8*a, 6*a+6*a*sqrt(3), 9*a, 6.3*a+8*a*sqrt(3), 9*a, 6.4*a+9*a*sqrt(3), 8.2*a, 6*a+10*a*sqrt(3));
  bezier(20*a, 6*a+6*a*sqrt(3), 19*a, 6.3*a+8*a*sqrt(3), 19*a, 6.4*a+9*a*sqrt(3), 19.8*a, 6*a+10*a*sqrt(3));

  stroke(150);
  strokeWeight(3.5);
  strokeJoin(ROUND);
  rect(10*a, 12*a, 2.4*a, 2*a);
  rect(16*a, 12*a, 2.4*a, 2*a);
  strokeWeight(1.5);
  line(13*a, 18*a, 10*a, 17*a );
  line(13*a, 18.5*a, 10*a, 18.7*a );
  line(13*a, 19*a, 10*a, 19.8*a );
  line(15*a, 18*a, 18*a, 17*a );
  line(15*a, 18.5*a, 18*a, 18.7*a );
  line(15*a, 19*a, 18*a, 19.8*a );
  ellipse(11.2*a, 13*a, .5*a, .5*a);
  ellipse(17.2*a, 13*a, .5*a, .5*a);

  popMatrix();

  popMatrix();
}


//all the components of a rat that need fill and noStroke
void drawRat2(float x, float y) {
  pushMatrix();
  translate (-100, -860);

  pushMatrix();
  translate(x, y);

  noStroke();
  bezier(8*a, 6*a+10*a*sqrt(3), 7*a, 6.3*a+12*a*sqrt(3), 7*a, 6.4*a+13*a*sqrt(3), 8*a, 6*a+14*a*sqrt(3));
  bezier(20*a, 6*a+10*a*sqrt(3), 21*a, 6.3*a+12*a*sqrt(3), 21*a, 6.4*a+13*a*sqrt(3), 20*a, 6*a+14*a*sqrt(3));
  bezier(8*a, 6*a+14*a*sqrt(3), 13*a, 10*a+17*a*sqrt(3), 15*a, 10*a+17*a*sqrt(3), 20*a, 6*a+14*a*sqrt(3));
  rect(8*a, 5.8*a+10*a*sqrt(3), 12*a, 4.2*a*sqrt(3));

  beginShape();
  vertex(8*a, 6*a+6*a*sqrt(3));
  vertex(8.8*a, 6.5*a+8*a*sqrt(3));
  vertex(8*a, 6*a+10*a*sqrt(3));
  vertex(14*a, 6*a+10*a*sqrt(3));
  vertex(12*a, 5*a+10*a*sqrt(3));
  vertex(10*a, 2*a+10*a*sqrt(3));
  endShape();

  beginShape();
  vertex(20*a, 6*a+6*a*sqrt(3));
  vertex(19.2*a, 6.3*a+8*a*sqrt(3));
  vertex(20*a, 6*a+10*a*sqrt(3));
  vertex(14*a, 6*a+10*a*sqrt(3));
  vertex(16.2*a, 5*a+10*a*sqrt(3));
  vertex(18.2*a, 2*a+10*a*sqrt(3));
  endShape();

  fill(180);
  bezier(13*a, 10*a+14*a*sqrt(3), 13*a, 8.5*a+17*a*sqrt(3), 15*a, 8.5*a+17*a*sqrt(3), 15*a, 10*a+14*a*sqrt(3));
  line(12*a, 9*a+14*a*sqrt(3), 10*a, 11*a+14*a*sqrt(3));
  fill(140);
  ellipse(14*a, 12.1*a+14*a*sqrt(3), 1.4*a, 1.2*a);

  popMatrix();

  popMatrix();
}



