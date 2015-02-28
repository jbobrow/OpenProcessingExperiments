
size(400,100);
background(73,123,182);

noStroke();
fill(167,33,30);
triangle(0,50,0,100,140,100);

fill(227,124,57);
ellipse(95,95,40,10); //orange left 




fill(255,255,255);

beginShape();
  vertex(320, 0); //starting vertex
   
  bezierVertex(350, 50, 250, 90, 280, 100);

  vertex(280, 100);
  vertex(360, 100);
  bezierVertex(360, 90, 340, 0, 350, 0);
  vertex(350, 0);

endShape();


fill(239,220,89);
ellipse(340,20,20,40); // yellow above

fill(0,0,0);
ellipse(200,0,40,10); // yellow above

fill(0,0,0);
beginShape(); // black triangle right
  vertex(360, 100); //starting vertex  
  bezierVertex(360, 80, 360, 50, 400, 0);
  vertex(400, 0);
  vertex(400, 400);
  
endShape();


fill(176,32,32);
beginShape();
  vertex(380, 100); //starting vertex 
  bezierVertex(370, 80, 360, 90, 400, 0);
  vertex(400, 0);
  vertex(400, 400);
  
endShape();

