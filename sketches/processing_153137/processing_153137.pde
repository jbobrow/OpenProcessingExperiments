
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/152603*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="totenkitten-filled.svg"; */

int num;
int strokeweight = 7;
float step, sz, offSet, theta, angle, startPosition;
//PShape img;

void setup() {
  size(300, 300);
  strokeWeight(strokeweight);
  step = strokeweight*2;
  num = ceil((sqrt(2)*max(width, height))/step);
  //img = loadShape("totenkitten-filled.svg");
  
  startPosition = -(PI/2);
}

void draw() {
  background(255);
  //shape(img, 0, 0, width, height); 
 
  translate(width/2, height/2);
  //colorMode(HSB, num);
  colorMode(RGB);
  
  noFill();
  for (int i=0; i<num; i++) {
    //stroke(i, num, num); //HSB
    sz = i*step;
    float offSet = (PI/3/num)*i;
      offSet+= (i%2)*PI/2;

    angle = (theta+offSet) % PI;
  stroke(255*(i%2),0,0);
  
    float arcEnd = map(sin(angle),-1,1, -TWO_PI, TWO_PI);
     if(angle <= (PI/2) ) {
       // (Centre of circle | Width and height in px | radians start and stop )
       arc(0, 0, sz, sz, 0+startPosition , arcEnd+startPosition );
     }
     else {
       arc(0, 0, sz, sz, TWO_PI-arcEnd+startPosition , TWO_PI+startPosition );
     }
  }
  // Static for center dot
  arc(0, 0, 1, 1, 0, TWO_PI);
  
  
  //animation speed
  theta += .02;
    
/*
    if(i%2==1){
      stroke(0, 0, 0);  
      strokeWeight(strokeweight-1);
      arc(0, 0, sz, sz, PI, arcEnd);
      arc(0, 0, sz, sz, 0, arcEnd-PI);
      
      //negative arcs
      stroke(0);
      //arc(0, 0, sz, sz, arcEnd, TWO_PI);
      //arc(0, 0, sz, sz, arcEnd-PI, PI);
        //arc(0, 0, sz, sz, -arcEnd, -PI); //For flipping the bottom half
    } else {
      stroke(0);
        strokeWeight(strokeweight+3);

       ellipse(0, 0, sz, sz); 
    }
  }
  colorMode(RGB);
  //resetMatrix();
  //theta += .0523;
  theta += .045;
*/  
}


