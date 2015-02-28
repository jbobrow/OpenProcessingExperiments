
void setup() {
  size(400,400);
//  noLoop();
}

void draw() {
  strokeWeight(25);
  line(75,0,75,400);
  strokeWeight(20);
  line(0,75,400,75);
  color gray = color (118,118,118);
  fill(gray);
//  noStroke();
  strokeWeight(0);
  rect(110,110,260,260); //LG grey rectangle
  color black = color(0,0,0);
  fill(black);
  rect(80,80,100,100); //black rectangle against lines
  strokeWeight(10);
  color white = color (255,255,255);
  fill(white);
  rect(130,130,120,120); //black rect under white rectangle
  strokeWeight(20);
  line(0,290,400,290);
  strokeWeight(20);
  line(350,0,350,400); //right vertical line
  strokeWeight(14);
  line(0,155,400,155); //sm horiz line in middle
  strokeWeight(5);
  line(325,0,325,400);
    
}              
                
