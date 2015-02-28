
//Problem Set 3
//Question 3(remix)
//Matt Iannacci

int y=0;
 
void setup(){
  size(500,500);
  frameRate(300);
  background(0);
  smooth(); 
}
  
void draw() {
    noStroke();
    fill(y-220,50,50);
    translate(250,250);
 
  float angle = TWO_PI / 5; 
  float thickness = mouseY;
  float radius = mouseX;
  for (int x=0; x < 5; x++) {
  rotate(angle);
  triangle(thickness,3,4,radius,thickness/2,0);

   y+=5;
   if(y>height-5)
   y=0;
  }
}


