
//Homework Assingment 2
//51-257 A
//Copyright 2012 Marcos Gonzalez-Bode megonzal@andrew.cmu.edu


void setup() {
  size(600,400);
  background(48,92,190);
  smooth();
}

// Float's are a data form that can have decimals.
// Int's are a data form that can only be integers or whole numbers.

void draw() {
  float x,y,wd,ht; 
  x = width/2;
  y = height/2;
  wd = 200;
  ht = 200;
  
  fill(66,173,222);
  strokeWeight(4);
  stroke(255,130,80);
  //OrangeCircle
  ellipseMode(CENTER);
  ellipse(x,y,wd,ht);
  stroke(255);
  arc(x+9,y+48,wd/2.1,ht/2.1,-2*PI/4,2.98*PI/6);//lowerB
  arc(x+9,y-48,wd/2.1,ht/2.1,-2*PI/4,2.98*PI/6);//higherB

  
  beginShape();
    stroke(0, 91, 153);
    strokeCap(ROUND);
    noFill();
      line(x,y/1.92,x,y*1.48);//middle line
      stroke(255);
      line(x*.978,y*.53,x*.978,y*1.48); //left_line
      line(x*.868,y*.83,x*.868,y*1.28);//left_short
      line(x*1.025,y*.53,x*1.025,y*1.48);// right
      
      
//MCurve
      stroke(255);
      strokeCap(ROUND);
      curveVertex(x*1,y*.53);  
      curveVertex(x*.978,y*.53);
      curveVertex(x*.9389,y*.64);
      curveVertex(x*.905,y*.78);
      curveVertex(x*.891,y*.90);
      curveVertex(x*.877,y*1.1);
      curveVertex(x*.867,y*1.28);
      curveVertex(x*.868,y*1.275);
          
//M2Curve
      stroke(255);
      curveVertex(x*.875,y*.86);
      curveVertex(x*.859,y*.857);
      curveVertex(x*.844,y*.894);
      curveVertex(x*.8425,y*.90);
      curveVertex(x*.8215,y*.98);
      curveVertex(x*.811,y*1.1);
      curveVertex(x*.801,y*1.29);
      curveVertex(x*.806,y*1.30);
      
  endShape();
  
//saveFrame("hw2.jpg");  
}  

