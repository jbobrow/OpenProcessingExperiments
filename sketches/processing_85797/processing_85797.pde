
float x = 90.0;
float speed = 1.0;
float radius = 4.0;
float angle = 0.0;
 
void setup(){
  size(800,500);
  smooth();
  noStroke(); 

}

void draw() {
  fill(0, 10);
  stroke (255, 40);
  angle = angle - 0.01;
  
  translate(x, height/1.2); //set the y coordinate of the circle
  rotate(angle); 

    triangle(-50, -50, -50, -50, 30, 30); //outer white
    triangle(-50, -50, -50, -50, 90, 30); //inner white
    triangle(-50, -0, -20, -20, 110, 2);  //black
  

x = x + speed;
 if (x > width + radius) {
   x = - radius;
 }
}




