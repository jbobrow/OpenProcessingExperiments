
float x;
float y;
float xspeed = 5;
float yspeed = 5;
float size = 5;

color c1 = color(212, 38, 5, 63); 
color c2 = color(0, 0, 255, 63);
color c3 = color(0, 200, 55, 63);



void setup() 
{
  size(1200,1000, P3D);

  background(10);
  noStroke();
  
}

void draw() 

{
  
  //float randomHeight = height(
  
   float randomAngle = random(PI/4);
  
  if (second() % 1 == 0){
   x = x + xspeed;
  
  if (x > width + size) {
    height -= -5000;
    loop();
  }
  
  if (x > width + size) {
    x = -size;
  }
  
   //rotate (randomAngle);
  }
  translate(width/2, height/2);
  for (float i = 0; i < 2000; i++) {
    rotate(randomAngle);
    ellipse(3, i, 3, 7);
  }
  
  //rotate (PI/2);
  //float randomAngle = random(PI/4) 45 degrees.
 
  
  //float m = millis ();
  
  // if (m<6000){
  //  loop();
  //}else{
  //  noLoop();
 // }
  strokeWeight(2);
 
  if (second() % 1 == 0){
   fill(random(0, 255), random(0, 255), random(0, 255), (63));
  }
  
  //triangle(30, 75, 58, 20, 86, 75);
  
 
  
   
  
  
  
  //if (second() % 1 == 0){
  // x = x * xspeed;
  
  //if (x < width + size) {
  //  x = -size;
  //}
  
   //rotate (randomAngle);
   
  //pushMatrix();
  //translate(x, height/2-size/2);
  //fill(c3);
  //bezier(600, 20, 10, 10, 90, 90, 15, 80);
  //popMatrix();
  
  //ellipse(40, 20, 40, 63);
  //quad(38, 31, 86, 20, 69, 63, 30, 76);
  //triangle(30, 75, 58, 20, 86, 75);
}


