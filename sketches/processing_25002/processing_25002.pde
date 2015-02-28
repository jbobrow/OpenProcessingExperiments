
void setup() {
  size (300,400);
  background(128);
  smooth();

  fill(75,196,76);
  ellipse(150,240,140,160); //body

  fill(228,250,177);
  ellipse(150,290,92,65);
  arc(150,290,90,110,radians(168),radians(372));//belly

  fill(75,196,76);
  ellipse(150,150, 200,130); //head

  noStroke();
  ellipse(100,100,80,70); //behind left eye
  ellipse(200,100,80,70); //behind right eye

  stroke(1);
  arc(100,100, 80,70,radians(150),radians(335)); //left eye socket
  arc(200,100, 80,70,radians(205),radians(390)); //right eye socket

  fill(208,240,34);
  ellipse(100,100,55,50);//eye
  ellipse(200,100,55,50);

  fill(0);
  ellipse(100,100,40,35);//iris
  ellipse(200,100,40,35);

  fill(255);
  ellipse(107,91,13,13);//pupil
  ellipse(193,91,13,13);

  fill(87,142,88);
  ellipse(145,140,5,5);//nose
  ellipse(155,140,5,5);

  noFill();
  //fill(232,68,68);
  arc(150,160, 100,50, 0, PI); //mouth

  //line(123,245,125,260);
}




