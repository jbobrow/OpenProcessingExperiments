


void setup()
{
  size(300,600);
  
  
  background(255);
  
}
void draw()
{
  //green area//
  
  int space=25;
  noStroke();
  fill(22,203,10);
  rect(0,0,100,25);
  rect(0,1*space,150,25);
  rect(2*space,2*space,125,25);
  rect(4*space,3*space,125,25);
  rect(6*space,4*space,100,25);
  rect(7*space,5*space,100,25);
  rect(8*space,6*space,100,25);
  rect(9*space,7*space,25,50);
  rect(10*space,7*space,50,275);
  rect(9*space,15*space,25,50);
  rect(8*space,17*space,50,25);
  rect(7*space,18*space,100,25);
  rect(6*space,19*space,100,25);
  rect(4*space,20*space,100,25);
  rect(2*space,21*space,125,25);
  rect(0,22*space,150,25);
  rect(0,23*space,100,25);
  
 //pink area//
  
  fill(250,71,92);
  rect(0,50,25,500);
  rect(25,50,25,500);
  rect(2*space,75,25,450);
  rect(3*space,75,25,450);
  rect(4*space,100,25,400);
  rect(5*space,100,25,400);
  rect(6*space,125,25,350);
  rect(7*space,150,25,300);
  rect(8*space,175,25,250);
  rect(9*space,225,25,150);
  
  //seeds//
  fill(0);
  triangle(75,175+25/2,100,175,100,200);
  ellipse(105,175+25/2,25,25);
  triangle(75,175+25/2,50,175,50,200);
  ellipse(45,175+25/2,25,25);
  triangle(75,175+25/2,63,150+25/2,75+25/2,150+25/2);
  ellipse(75,160,25,25);
  triangle(75,175+25/2,50+25/2,200+25/2,75+25/2,200+25/2);
  ellipse(75,215,25,25);
  
  triangle(75,200+25/2+200,100,200+200,100,225+200);
  ellipse(105,200+25/2+200,25,25);
  triangle(75,200+25/2+200,50,200+200,50,225+200);
  ellipse(45,200+25/2+200,25,25);
  triangle(75,200+25/2+200,63,175+25/2+200,75+25/2,175+25/2+200);
  ellipse(75,185+200,25,25);
  triangle(75,200+25/2+200,50+25/2,225+25/2+200,75+25/2,225+25/2+200);
  ellipse(75,240+200,25,25);
  
   triangle(175,175+25/2+225/2,200,175+225/2,200,200+225/2);
  ellipse(205,175+25/2+225/2,25,25);
  triangle(175,175+25/2+225/2,150,175+225/2,150,200+225/2);
  ellipse(145,175+25/2+225/2,25,25);
  triangle(175,175+25/2+225/2,163,150+25/2+225/2,175+25/2,150+25/2+225/2);
  ellipse(175,160+225/2,25,25);
  triangle(175,175+25/2+225/2,150+25/2,200+25/2+225/2,175+25/2,200+25/2+225/2);
  ellipse(175,215+225/2,25,25);
  
  //grid//
  strokeWeight(1);
  
  stroke(200);
  line(0*space,0,0*space,800);
  line(1*space,0,1*space,800);
  line(2*space,0,2*space,800);
  line(3*space,0,3*space,800);
  line(4*space,0,4*space,800);
  line(5*space,0,5*space,800);
  line(6*space,0,6*space,800);
  line(7*space,0,7*space,800);
  line(8*space,0,8*space,800);
  line(9*space,0,9*space,800);
  line(10*space,0,10*space,800);
  line(11*space,0,11*space,800);
 line(12*space,0,12*space,800);
 
 line(0,0*space,400,0*space);
 line(0,1*space,400,1*space);
 line(0,2*space,400,2*space);
 line(0,3*space,400,3*space);
 line(0,4*space,400,4*space);
 line(0,5*space,400,5*space);
 line(0,6*space,400,6*space);
 line(0,7*space,400,7*space);
 line(0,8*space,400,8*space);
 line(0,9*space,400,9*space);
 line(0,10*space,400,10*space);
 line(0,11*space,400,11*space);
 line(0,12*space,400,12*space);
 line(0,13*space,400,13*space);
 line(0,14*space,400,14*space);
 line(0,15*space,400,15*space);
 line(0,16*space,400,16*space);
 line(0,17*space,400,17*space);
 line(0,18*space,400,18*space);
 line(0,19*space,400,19*space);
 line(0,20*space,400,20*space);
 line(0,21*space,400,21*space);
 line(0,22*space,400,22*space);
 line(0,23*space,400,23*space);
 line(0,24*space,400,24*space);

}

