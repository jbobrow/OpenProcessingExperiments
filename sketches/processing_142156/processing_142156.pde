



float angle = 137.5;
float k = 1;
float Y;
float X;
float xnoise = 10;
float ynoise = 4;
 
void setup() {
  size(400,400);
  background(198,242,239);
  smooth();

   
}
 
void draw() {
  
  translate(width/2,height/2);
 for(int i = 0; i<6; i++) {
   k+=i;


   // float rad = radians(angle);
    X = k*i*1/10*(cos(noise(ynoise)*angle));
    Y = k*i*1/10*(sin(noise(xnoise)*angle));


 strokeWeight(.01);
 stroke(255);
  fill(245,171,240); 
    ellipse(X/150,Y/150,7*i,7*i);
   
    angle+=0.01;
  }
 
}





