
void setup() {
  size (300,400);
  background(128);
  smooth();


  ellipse(150,240,140,160); //body


  ellipse(150,290,92,65);
  arc(150,290,90,110,radians(168),radians(372));//belly

  ellipse(150,150, 200,130); //head

  noStroke();
  ellipse(100,100,80,70); //behind left eye
  ellipse(200,100,80,70); //behind right eye

  stroke(1);
  arc(100,100, 80,70,radians(150),radians(335)); //left eye socket
  arc(200,100, 80,70,radians(205),radians(390)); //right eye socket

  ellipse(100,100,55,50);//eye
  ellipse(200,100,55,50);


  ellipse(100,100,40,35);//iris
  ellipse(200,100,40,35);


  ellipse(107,91,13,13);//pupil
  ellipse(193,91,13,13);

  ellipse(145,140,5,5);//nose
  ellipse(155,140,5,5);

  noFill();
  //fill(232,68,68);
  arc(150,160, 100,50, 0, PI); //mouth

  //line(123,245,125,260);
}



