
void setup() {
  size(500, 500);
  background(189,22,99);
  strokeWeight(3);
  // Here we use RectMode Center to create the control points later
  fill(11,123,22);
  stroke(0);
  bezier(0, 150, 60, 50, 200, 140, 270, height);
  bezier(270, 500, 0, 500, 0, 500, 0, 150);
  bezier(235, 350, 400, 50, 100, 200, 145, 350);
  
  fill(0);
  stroke(0);
  bezier(100, 190, 60, 210, 100, 300, 150, 180);
  
  noFill();
arc(100, 220, 60, 60, PI/2, PI);

noFill();
stroke(6);
bezier(150, 180, 290, 10, 340, 75, 500, 0);
bezier(150, 180, 250, 5, 360, 25, 320, 0);
bezier(150, 180, 290, 110, 340, 175, 500, 80);
bezier(150, 180, 390, 110, 340, 255, 500, 300);

fill(0,0,280);
rect(330, 320, 155, 255);

fill(255);
bezier(340, 320, 370, 100, 410, 150 , 480, 320);


  
  
  fill(0);
  ellipse(56, 180, 22, 22);
  ellipse(110, 160, 15, 15);
  ellipse(370, 220, 11, 11);
  ellipse(400, 220, 11, 11);
  ellipse(385, 250, 20, 40);
  

float f = 6.3;
int i = 20;
print("Jimmy The Ghost waited in a box for " + f + " hours, and made his friend vomit for " + i);
String s = "minutes";
println(s);
}

