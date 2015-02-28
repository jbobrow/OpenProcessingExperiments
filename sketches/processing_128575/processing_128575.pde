
// Copyright Jacklynn Pham 2014

size(600,600);
strokeWeight(10);
background(#1B3083);
float x = (150);
float y = (300);
float wd = (600);
float ht = (600);

fill(#4FDAF5);
stroke(#D816F2);

beginShape();
  curveVertex(300,0); //reference
  curveVertex(x,x);
  curveVertex(300,300);// middle
  curveVertex(500,500);
  curveVertex(x,500);
  curveVertex(500,300);
  curveVertex(300,10);//top middle
  curveVertex(x,x);
  curveVertex(400,100); //reference
endShape(CLOSE);


//beginShape();
//  vertex(100,100);
//  vertex(150,150);
//  vertex(200,200);
//  vertex(250,50);
//  vertex(100,200);
//  vertex(100,100);
//endShape(CLOSE);

//beginShape();
//  curveVertex(50,50); //reference
//  curveVertex(100,100);
//  curveVertex(150,150);
//  curveVertex(200,200);
//  curveVertex(250,50);
//  curveVertex(100,200);
//  curveVertex(100,100);
//  curveVertex(100,100); //reference
//endShape(CLOSE);


