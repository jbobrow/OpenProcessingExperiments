
//General Spacial and Color Rules
  size(202, 119);
  background(38, 124, 183); 
  smooth();
  

//Yellow Box
  fill(249, 211, 43);
  noStroke();
  rect(0,70,60,60);


//Light Green Box
  fill(105, 153, 79);
  noStroke();
  rect(0, 0,90, 69);

//Dark Green/Teal armchair
  beginShape();
  stroke(1);
  strokeWeight(4);
  
 //Semi-straight line up to halfway
  curveVertex(60, 140); //  start  point
  curveVertex(60, 140); //  also the start point
  curveVertex(60, 60);
  curveVertex(65, 30);
  curveVertex(75, 10);
  curveVertex(95, 0);
  endShape();

//Begin Main Arc
  fill(0, 70, 74);
  arc(125, 50, 130, 120, PI, 50); // 180 degrees

//Black Circle
  fill(5,8,17);
  ellipse(100,40,76,80);
  
//White Spiral
  stroke(255);
  noFill();
  beginShape();
  vertex(100, 40); // first point
  bezierVertex(60, 40, 150, 110, 120, 0);
  bezierVertex(20, -30, 75, 130, 120, 80);
  endShape();
  
//Orange Line
  stroke(244, 170, 47);
  noFill();
  line(0, 90, 20, 90);
    line(20, 110, 20, 90);
        line(20, 110, 40, 110);
             line(40, 110, 40, 90);
                 line(40, 90, 55, 92);



  
  
  
  
  
  //LEGACY CODE AFTER HERE. JUST LEFT IT SO SHOW THE DIFFERENCE IN CODE LENGTH AND ACURACY BETWEEN METHODS
  /*
 
  beginShape();
  
  //Semi-straight line up to halfway
  curveVertex(60, 140); // the first control point
  curveVertex(60, 140); // is also the start point of curve
  curveVertex(60, 60);
  curveVertex(65, 30);
  curveVertex(75, 10);
  curveVertex(95, 0);

  //Begin armchair curve
  curveVertex(168, 0);
 

  curveVertex(185, 50);
  curveVertex(180, 55);
  curveVertex(175, 60);
  curveVertex(180, 60);
  curveVertex(178, 70);
  curveVertex(175, 75);
  curveVertex(170, 77);
  curveVertex(168, 78);
 
  curveVertex(165, 79);
  curveVertex(163, 80);
  
  curveVertex(160, 82);
  curveVertex(160, 85);
  
  curveVertex(158, 88);
  curveVertex(155, 90);
  curveVertex(150, 95);
  curveVertex(145, 97);
  curveVertex(140, 99);
  curveVertex(135, 100);
  curveVertex(130, 105);
  curveVertex(125, 105);
  curveVertex(120, 106);
  curveVertex(115, 107);
  curveVertex(110, 100);
  curveVertex(105, 100);
  curveVertex(100, 100);
  curveVertex(95, 100);
  curveVertex(89, 100);
  curveVertex(85, 98);
  curveVertex(83, 95);
  curveVertex(75, 95);

  curveVertex(60, 80); // the last point of curve
  curveVertex(60, 80); // is also the last control point
  endShape();
  
  */
  
  /*


  noFill();
  stroke(10);
  beginShape();
  curveVertex(40, 40); // the first control point
  curveVertex(40, 40); // is also the start point of curve
  curveVertex(40, 90);
  curveVertex(100, 100);
  curveVertex(60, 120);
  curveVertex(50, 150); // the last point of curve
  curveVertex(50, 150); // is also the last control point
  endShape();
  
  
  

noFill();
stroke(0);
beginShape();
vertex(67, 130); // first point
bezierVertex(7, 0, 30, 0, 67, 90);
bezierVertex(80, 0, 0, 0, 80, 0);
endShape();


147 281 238 184
*/



