
// Ethan Frier
// HW 9 - Drawing with an array
// March 5th, 2013
// copywrite 2013

float [ ] x = { random(10,40),
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
                random(10,40) };              
  
float [ ] dx = { random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10),  
                 random(2,10), 
                 random(2,10), 
                 random(2,10) };
  
float [ ] dy = { random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10), 
                 random(2,10),  
                 random(2,10), 
                 random(2,10), 
                 random(2,10) };               
  
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

void setup () {  
  
  size (400, 400);
  
}

void draw () {

  background (160, 240, 200);

  bounce();

  int i = 0;                             
  for ( i=0; i < x.length-1 ; i++ ) {
    noStroke();
    fill (col [i]);
    ellipse (x[i], y[i], z[i], z[i]);
  }
  
}

void bounce (){
  
  for (int i = 0; i < dx.length-1; i++){
    
    x[i] = x[i] + dx[i];
    y[i] = y[i] + dy[i];
    
    if (x[i] > width || y[i] > height || x[i] < 0 || y[i] < 0) {
      dx[i] = - dx[i];
      dy[i] = - dy[i];
    }
    
  }
  
}

