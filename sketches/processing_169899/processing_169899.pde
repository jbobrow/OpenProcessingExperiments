
int x=0;
int y =0;
float r=0;
float radius = 90.0;
float z = 1;


void setup() {
  size(600, 600);
  

  frameRate(15);
  smooth();
  noStroke();
  noiseSeed(1);
}




void draw() {
  background(50);


  
  translate(width/2, height/2);
  rotate(r);

  for (int deg = 0; deg < 180*2; deg += 10) {


    float ra= 5;
    float angle = radians(deg);
    float x =1 + (sin(angle) * radius/2);
    float y =1 + (cos(angle) * radius/2);

    triangle(z, z, 10, 10,x,y);
    fill(random(255), random(65), 104);
  }
    radius = radius+15;
    z -= 1;
  


    if (radius > 400) { 
      scale(2);
      triangle(width/2, height/2, random(10), random(20),random(30),random(40));
      radius -= 150;
      z =2.0;
    }
  
    
 r += PI/8;
 
 
 
 
 
 
}
