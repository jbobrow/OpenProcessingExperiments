
// Based on loops
// by David Bouchard 
// http://www.openprocessing.org/visuals/?visualID=23893

// Adapted by Rupert Russell
//http://www.openprocessing.org/visuals/?visualID=27193

// we can create really interesting patterns using repetition and
// stacked transformations...
 
// try different shapes (triangle, ellipse, etc..)
// try animating the scaling and rotation, instead of using the mouse

// float c = 0; 
float s = 1;
boolean shrink = false;
int type_of_shape = 0;

float a,b,c,d,e,f,g,h;
 
void setup() {
  size(400, 300); 
  rectMode(CENTER);
  smooth();
  noFill();
 // frameRate(4);
}
 
void draw() {
  background(255);
  // move the origin so that it is right in the center of the
  // sketch
  translate(width/2, height/2);
   
  // loop 100 times
  // remember that scale() and rotate() add up!
  // this is how we create this effect.
  for (int i=0; i < 100; i++) {
   
    if (s > 1.06){
     shrink = true; 
     
    }
    if (s < 1){
     shrink = false; 
     // type_of_shape ++ ;
    }
    if (shrink){
    s = s - 0.000001;
    }
    else {
      s = s + 0.00001;
    }
    
    rotate(s /2);
    scale(s);
     
    // notice how we draw each box the same way, but they
    // are drawn differently because the canvas is being
    // scaled and rotated first
    
   
    switch(type_of_shape) {
      case 1:
        noFill();
        arc(50, 55, 60, 60, PI/2, PI);

        break;
      case 2:
        ellipseMode(CENTER);
        ellipse(10, 10, 5, 5);
        break;
      case 3:
        ellipseMode(CENTER);
        line(10, 10, 5, 5);
        
        // 
        a = random(100);
        b = random(100);
        c = random(100);
        d = random(100);
        e = random(100);
        f = random(100);
        g = random(100);
        h = random(100);
        
        break;
      case 4:
        ellipseMode(CENTER);
        bezier(a, b, c, d, e, f, g, h);
        break;            
        
       default:
          type_of_shape = 1;
       break;
    }
  
  }
}

  void mouseClicked() {
         type_of_shape ++ ;
     }                                                                              
