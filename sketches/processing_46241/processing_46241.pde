
float x = 50;
float y = 80;
float angle1 = 0.6;
float angle2 = 0.2;
float segLength = 60;


void setup() {
  size(640,360);
  smooth(); 
  strokeWeight(10.0);
  stroke(0, 100);
}

void draw() {
  
  pushMatrix();
  translate(mouseX, mouseY);
 
  line(70, 30, 50,30);
  line(45, 20, 50,30);
  line(61, 70, 50,30);
  line(20, 90, 50,30);
  line(120, 49, 50,30);
  stroke(255,45,72);
  line(100, 110, 50,30);
  stroke(20,80);

  popMatrix();
  line(45, 20, 50,30);
  line(61, 70, 50,30);
  line(20, 90, 50,30);
  line(120, 49, 50,30);
  line(150, 170, 50,30);
 

 

}



