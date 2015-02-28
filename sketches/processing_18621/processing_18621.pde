
float angle = 0.0; // start variable for angle
float angle2 = 0.0; //start variable for angle 2

void setup(){ 
  size(250, 250); 
  smooth(); 
  noStroke();
}
void draw(){ 
  fill(0, 12); 
  rect(-1, -1, width+1, height+1);
  fill(0,150);
  stroke(angle,34,angle2);
  //rotation rate of the first set of circles (magenta)
  angle=angle +10;
  translate(100,100);
  rotate (-angle);
  ellipse(20,20,-20,-20);
  ellipse(40,40,-30,-30);
  ellipse(30,30,30,30);
  ellipse(50,50,-40,-40);
  //rotation rate of the second set of circles (yellow)
  angle2=angle +10;
  translate(80,80);
  rotate(angle2);
  stroke(angle2,angle,34,100);
  ellipse(-30,-30,60,60);
  ellipse(15,15,-20,-20);
  ellipse(-20,-20,40,40);
  ellipse(10,10,-30,-30);
  ellipse(-10,10,20,20);

}

