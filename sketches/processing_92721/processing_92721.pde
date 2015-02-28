
void setup() {
  size(500, 500);
  smooth();
  strokeWeight(3);
}

void draw() {
  //fill in the background 
  background(125, 230, 250);
  // draw triangles for ears
  strokeJoin(ROUND);
  fill(252, 202, 160);
  triangle(86, 100, 105, 200, 350, 150);
  strokeJoin(ROUND);
  fill(252,202,160);
  triangle(414, 100, 395, 200, 150, 150);
 
 // details of ears by drawing lines 
  strokeCap(ROUND);
  line(394,120,375,220);
  strokeCap(ROUND);
  line(394, 120, 180, 150);
  strokeCap(ROUND);
  line(106, 120,125, 220);
  strokeCap(ROUND);
  line(106, 120, 330, 150);  
  
 //pig face
  fill(253, 229, 182);
  ellipse(250, 250, 300, 300);
  
  //nose 
  fill(253, 235, 170);
  ellipse(250, 280, 100, 80);
  
  //eyes
  fill(254, 254, 254);
  ellipse(190, 220, 50, 55);
  fill(254, 254, 254);
  ellipse(310, 220, 50, 55);
  fill(50);
  ellipse(190, 230, 30, 35);
  fill(50);
  ellipse(310, 230, 30, 35);
  
 //nose hole 
  fill(243, 190, 122);
  ellipse(235, 280, 20, mouseX/30);
  fill(243, 190, 122);
  ellipse(270, 280, 20, mouseX/30);
    
  //mouth
  fill(247, 11, 16);
  arc(250, 325, 130, mouseY, 0, radians(180));
 
 // 
  fill(30);
  quad(300, 160, 330, 170, 350, 180, 360, 190);
  
  fill(30);
  quad(200, 160, 170, 170, 150, 180, 140, 190);
}
