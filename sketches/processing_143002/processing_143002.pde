
float angle = 0.0;
float angleDirection = 1;
float speed = 0.005;

void setup(){
  size(1000, 1000);
  background(255);
}

void draw(){
 // stroke(134, 66, 1);
 // strokeWeight(25);
 // line(500, 1000, 500, 750);
  translate(500, 500);
  rotate(angle);
  strokeWeight(20);
  stroke(87, 11, 139, 30);
  line(0, 0, 150, -150);
 // line(0, 0, -150, -150);
  translate(150, -150);
  rotate(angle*2.0);
  strokeWeight(15);
  stroke(4, 181, 185, 30);
  line(0, 0, 100, -100);
  line(0, 0, 100, -15);
  line(0, 0, 15, -100);
  translate(100, -100);
  rotate(angle*2.5);
  strokeWeight(15);
  stroke(149, 12, 203, 30);
  line(0, 0, 75, -75);
  line(0, 0, 75, -15);
  line(0, 0, 15, -75);
  translate(75, -75);
  strokeWeight(15);
  stroke(185, 4, 16, 30);
  line(0, 0, 75, -75);
  line(0, 0, 75, -15);
  line(0, 0, 15, -75);
  angle += speed * angleDirection;
//  if ((angle>QUARTER_PI) || (angle < 0)){
//    angleDirection *= -1;
}
//}
