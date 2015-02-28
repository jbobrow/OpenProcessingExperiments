
void setup() {
  size(500,350);
  background(30,200,45);
  smooth();
  stroke(200,40,4);
  strokeWeight(100);
  line(0,0,width-1,height-1);
  stroke(0);  
  strokeWeight(5);
  fill(23,132,214);
  ellipse(250, 170, 270, 260);
  fill(255);
  ellipse(250,190,220,220);
  fill(255);
  bezier(150, 180, 170, 270, 330, 270, 350, 180);
  line(250, 140, 250, 245);
  line(135, 140, 210, 160);
  line(365, 140, 290, 160);
  line(135, 170, 210, 180);
  line(365, 170, 290, 180);
  line(135, 210, 210, 200);
  line(365, 210, 290, 200);
  
  fill(255);
  ellipse(215, 100, 65, 80);
  ellipse(285, 100, 65, 80);
 
  fill(198, 69, 64);
  ellipse(250, 140, 35, 35);
  fill(255, 255, 255);
  noStroke();
  ellipse(245, 135, 10, 10);
  fill(0);
  ellipse(230, 115, 20, 20);
  ellipse(270,115,20,20);
}
