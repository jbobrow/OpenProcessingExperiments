
background(170, 17, 53); //red background

fill(30, 49, 211, 160);
  strokeWeight(8);
    ellipse(35, 0, 120, 120); //blue circle

fill( 171, 30, 211);
  strokeWeight(6);
    ellipse(40, 95, 70, 70); //pink circle

noFill();
  arc(50, 55, 60, 60, PI/2, PI); // arcQ3
    arc(50, 55, 60, 60, PI, TWO_PI-PI/2); //arcQ2
      arc(50, 55, 60, 60, TWO_PI-PI/2, TWO_PI); //arcQ1

size(100, 100, P3D);
  strokeWeight(3);
    line(30, 20, 0, 85, 20, 15); //line

stroke(124);
  line(85, 20, 15, 0, 75, 0); //line


stroke(170, 17, 53);
  point(20, 30); //top point
  point(30, 40); //mid point

stroke(225); 
  quad(70, 40, 60, 70, 40, 50, 50, 30); //quad

noFill();
  stroke(65, 80, 79);
    rect(60, 70, 40, 40); //square

fill(170, 17, 53);
  stroke(0);
    strokeWeight(2);
      triangle(50, 25, 0, 0, 50, 0); //trangle

stroke(255);
  noFill();
    ellipse(80, 80, 30, 30); //right bottom Circle

ellipse(90, 60, 30, 30); //right top Circle

ellipse(0, 100, 55, 55); //bottom left big Circle

ellipse(0, 100, 35, 35); //bottom left mid Circle

ellipse(0, 100, 15, 15); //bottom left small Circle

strokeWeight(1.5);
stroke(0);
ellipse(100, 60, 15, 15);

ellipse(100, 45, 15, 15);

ellipse(100, 30, 15, 15);


