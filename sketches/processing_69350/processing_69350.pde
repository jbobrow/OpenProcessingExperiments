

void setup()
{
  
  size(200, 300);
  background(18,182,255);
  smooth();

line(10,25,40,25);
line(40,20,40,50);
line(40,20,40,0);
line(40,25,70,25);
line(40,25,10,0);
line(40,25,70,0);
line(40,25,15,50);
line(40,25,65,50);
line(15,210,15,120);
fill(0);
ellipse(40,25,5,5);
fill(51,27,193);
ellipse(15,120,20,100);
fill(137,27,193);
rect(7,100,17,40);

  
  
  
  
  
  fill(255);
  stroke(0);
  beginShape();
  curveVertex(80, 40); // the first control point
  curveVertex(80, 40); // is also the start point of curve
  curveVertex(90, 35);
  curveVertex(95, 45);
  curveVertex(95, 50);
  curveVertex(87, 55); // the last point of curve
  curveVertex(83, 58);
  curveVertex(80,72);
  curveVertex(90,74);
  curveVertex(110,85);
  curveVertex(110,110);
  curveVertex (90,120);
  curveVertex (70,120);
  curveVertex (50,110);//head
  curveVertex (50,85);
  curveVertex (60,74);
  curveVertex (80,72);
  curveVertex (83,58);
  curveVertex (79,45);
  curveVertex (80,40);
  curveVertex(80,40); // is also the last control point
  endShape();
 fill(255); 
  beginShape();
curveVertex(90,120);
curveVertex(90,120);
curveVertex(93,130);
curveVertex(95,150);
curveVertex(93,170);//torso
curveVertex(70,170);
curveVertex(64,150);
curveVertex(66,130);
curveVertex(70,120);
curveVertex(70,120);
endShape();

beginShape();
curveVertex(50,90);
curveVertex(50,90);//left ear
curveVertex(45,82);
curveVertex(50,83);
curveVertex(50,83);
endShape();

beginShape();
curveVertex(110,85);
curveVertex(110,85);
curveVertex(115,82);//right ear
curveVertex(110,92);
curveVertex(110,92);
endShape();

beginShape();
curveVertex(90,170);
curveVertex(90,170);
curveVertex(95,172);
curveVertex(97,173);
curveVertex(99,174);
curveVertex(100,177);
curveVertex(100,178);//right leg
curveVertex(99,178);
curveVertex(97,181);
curveVertex(95,180);
curveVertex(93,180);
curveVertex(90,170);
curveVertex(90,170);
endShape();

beginShape();
curveVertex(70,170);
curveVertex(70,170);
curveVertex(65,172);//left leg
curveVertex(63,173);
curveVertex(61,174);
curveVertex(60,177);
curveVertex(61,178);
curveVertex(63,181);
curveVertex(65,180);
curveVertex(67,180);
curveVertex(70,170);
curveVertex(70,170);
endShape();

beginShape();
curveVertex(93,130);
curveVertex(93,130);
curveVertex(97,135);//right arm
curveVertex(99,145);
curveVertex(99,155);
curveVertex(97,155);
curveVertex(94,140);
curveVertex(93,140);
curveVertex(93,140);
endShape();

beginShape();
curveVertex(66,130);
curveVertex(66,130);
curveVertex(62,135);
curveVertex(60,145);
curveVertex(60,155);
curveVertex(62,155);
curveVertex(66,140);
curveVertex(67,140);
curveVertex(67,140);
endShape();

ellipseMode(RADIUS);  
fill(255);  
ellipse(65, 90, 5, 5);  // left eye
ellipseMode(CENTER);  
fill(250,5,5);  
ellipse(65, 90, 5, 5);


ellipseMode(RADIUS);  
fill(255);  
ellipse(95, 90, 5, 5);  // right eye
ellipseMode(CENTER);  
fill(250,5,5);  
ellipse(95, 90, 5, 5);

beginShape();
fill(193,188,27);
vertex(150, 20);
bezierVertex(200, 0, 200, 75, 150, 75);
bezierVertex(170, 80, 170, 25, 150, 20);
endShape();

fill(255);
triangle(80,90,85,95,80,100);



noStroke();
fill(144,4,4);
ellipse(82,230,150,100);

noStroke();
fill(0,90,26);
ellipse(160,260,150,150);

noStroke();
fill(142,87,31);
ellipse(50,260,150,150);


noStroke();
fill(180);
ellipse(80,145,20,35);
fill(0);
ellipse(80,110,5,5);

  noStroke();
  fill(255, 0, 0);
  
 


}
  
 
 

  
  








