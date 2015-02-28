

void setup() { 
  size (1000, 500); 
  background(0); 
} 
float t = 0.; 
int x = 0; 
float a_radius = 100; 
float a_angle = 0; 
float a_x = cos(a_angle*PI/180)*a_radius; 
float a_y = sin(a_angle*PI/180)*a_radius ;



void draw() { 
  a_angle = a_angle + 15;  
 
float a_x = cos(a_angle*PI/180)*a_radius; 
float a_y = sin(a_angle*PI/180)*a_radius; 
  strokeWeight(random(50)); 
    stroke(random(255),random(100,200),0); 
      point(x % width+a_x, map(noise(t)+a_y, 0., 1., 0., height)); 

    t = t+0.01; 
    x++; 
    
 
} 



