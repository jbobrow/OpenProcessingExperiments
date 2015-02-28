
// Ethan Frier
// HW 9 - Drawing with an array
// March 5th, 2013
// copywrite 2013

float [ ] x = new float [10];
float [ ] y = new float [10];
float [ ] z = new float [10];

color [ ] col = new color [10];


void setup () {
  
  size (400, 400);
  
  float [ ] x = { random(10,40),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400) };
                
  float [ ] y = { random(10,40),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400),
                  random(400) };
  
  float [ ] z = { random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),
                  random(10,40),                 
                  random(10,40),
                  random(10,40) };              
  
  color[ ] col = { color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ), 
                   color(random(255), random(255), random(255) ) };
 
  background (random(255), random(255), random(255));
  
  int i = 0;
                                
  for ( i=0; i < x.length-1 ; i++ ) {
    noStroke();
    fill (col [i]);
    ellipse (x[i], y[i], z[i], z[i]);
  }
}


