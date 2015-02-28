
size(400,400);
background(0,150,170);
  
beginShape();
fill(0,200,0);
stroke(0,200,0);
vertex(200,50);
vertex(150,100);
vertex(180,100);
vertex(120,170);
vertex(170,170);
vertex(90,270);
vertex(200,270);

vertex(300,270);
vertex(230,170);
vertex(280,170);
vertex(220,100);
vertex(250,100);

endShape();

//stump
stroke(137, 100, 90);
fill(150, 100, 90);
 rect(175, 270, 50, 60); 
 
 //star
 strokeWeight(1);
  stroke(255, 236, 23);
  fill(255, 236, 23);
  triangle(200, 80, 175, 30, 225, 30);
  triangle(175, 60, 225, 60, 200, 15);
  
  //ornaments
fill(200, 255, 255);
  ellipse(200,200,10,10);
  ellipse(170,150,10,10);
  ellipse(190,240,10,10);
fill(200,0,0);
  ellipse(210,130,10,10);
  ellipse(220,240,10,10);
  ellipse(200,170,10,10);
fill(0,150,0);
  ellipse(160,230,10,10);
  ellipse(180,90,10,10);
  ellipse(170,200,10,10);
fill(130,0,200);
  ellipse(220,90,10,10);
  ellipse(240,150,10,10);
  ellipse(230,200,10,10);
fill(220,20,100);
  ellipse(255,250,10,10);
  ellipse(130,250,10,10);
  
  fill(255,255,255);
  stroke(255,255,255);
  rect(0,330,400,300);

  fill(200,0,0);
  stroke(200,0,0);
  rect(270,280,50,50);

  stroke(0,200,0);
  strokeWeight(7);
  line(295,280,295,330);
  line(270,305,320,305);
  
    stroke(255, 255, 255);
  strokeWeight(3);
 //snow
  for (int j=0;j<1000;j++) {
    stroke(255, random(55, 255));
    strokeWeight(4);
    point(random(-400, 400), random(-400, 400));
  }
  
   textSize(30);
  text("Merry Christmas!",50,370);
