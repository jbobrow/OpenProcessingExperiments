
//Author: Liliam Rodas
//Purpose: Homework to generate my idea of Fall, falling, fallen. 
// The art work is based in class and use of local applications in order to generate patterns.
//Functioning: Emerging objects trought existing ones. Beside the emergent patterns created due
             //the drawMe circles, the mix of  the emergent elements generates a "secundary emergence"
//Reference: previous excercises provided in class and processing.



//ORIGINAL PROGRAMM

int _num = 10;
Circle [] cArray = {
};
void setup() {
  size(300, 500);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background (250,238,204, 50);
  for (int i=0; i< cArray.length; i++) {
    Circle thisCirc = cArray [i];
    thisCirc.updateMe ();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    thisCirc.drawMe ();
    cArray = (Circle []) append (cArray, thisCirc);
  }
}


// CLASS DEFINITION

class Circle {
  float x, y;
  float radius;
  float length;
  //float width;
  //color linecol, fillcol;
  float alph;
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = 0;
    radius = random(100) + 10;
    fill (255);
    alph = random(255);
    xmove = random (7) -6;
    ymove = random (10) -5;
  }
  void drawMe() {
    noStroke();
    //fill(fillcol, alph);
    ellipse(x-5, y- random (4), radius, radius);
    //fill (fillcol);
    ellipse(x, y, radius-20, radius-20);
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > width) {
      x=0;
    }
   
    if (y > (height+radius)) {
      y=0-radius;
    }
    
    boolean touching = true;
    for (int i=0; i<cArray.length; i++) {
      Circle otherCirc = cArray[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.radius, otherCirc.y);
        float overlap = dis - otherCirc.radius;
        if (overlap < 10) {
          float midx, midy;
          midx = (x - otherCirc.length);
          midy = (y - otherCirc.radius);
          stroke (66,75,88);
          //stroke(random(255), random(255), random(255));
          fill (217,220,224, 75);
          overlap *= -1;
          ellipse(midx, midy, overlap, overlap);
          
         
          fill (124,99,10,100);
           overlap *= -1;
          ellipse(midx*2, midy*2, overlap-2, overlap-2);
          
          
          noStroke();
          fill (124,36,83,30);
           ellipse(midx*2, midy*2, overlap*2, overlap*2);
              
          
       
        }
      }
    }
   //drawMe();
  }
}


