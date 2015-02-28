
size(196, 173);
background(255);
 
// Red
beginShape();

  fill(183, 0, 14);
  noStroke();
  
  vertex(0, 0);
  vertex(80, 0);
  bezierVertex (80, 0, 75, 20, 85, 30);
  vertex(85, 30);
  vertex(80, 60);
  bezierVertex (80, 60, 65, 80, 50, 65);
  vertex(50, 65);
  bezierVertex (50, 65, 40, 60, 25, 80);
  vertex(25, 80);
  bezierVertex (25, 80, 20, 90, 0, 85);
  vertex(0, 90);
  
endShape(CLOSE);

// Black- top
beginShape();

  fill(0);
  noStroke();
  
  vertex(142, 0);
  vertex(195, 0);
  vertex(175, 40);
  vertex(175, 35);
  vertex(150, 30);
  
endShape(CLOSE);

// Orange- top
beginShape();

  fill(235, 140, 46);
  noStroke();
  
  vertex(80, 0);
  vertex(142, 0);
  bezierVertex(142, 0, 160, 0, 155, 10);
  vertex(155, 10);
  vertex(150, 15);
  vertex(160, 35);
  bezierVertex(160, 35, 144, 48, 120, 40);
  vertex(120, 40);
  bezierVertex(120, 40, 110, 48, 90, 43);
  vertex(90, 43);
  vertex(80, 20);
  bezierVertex(80, 20, 70, 10, 80, 0);
  
endShape(CLOSE);

// Green- top
beginShape();

  fill(30, 99, 42);
  noStroke();
  
  ellipse (120, 5, 25, 20);
  
endShape(CLOSE);

// Blue- top
beginShape();

  fill(81, 132, 195);
  noStroke();
  
  vertex(150, 0);
  vertex(195, 0);
  vertex(190, 8);
  vertex(160, 6);
    bezierVertex(160, 6, 160, 5, 150, 0);
  
endShape(CLOSE);

  
  
// Black- bottom
  fill(0);
  noStroke();
  ellipse (90, 130, 100, 100);

// Blue circle- L

  fill(81, 132, 195);
  noStroke();
  ellipse (95, 50, 8, 4);
  
// Yellow
beginShape();

  fill(241, 208, 63);
  noStroke();
  
  vertex(0, 85);
  bezierVertex(0, 85, 10, 75, 25, 80);
  vertex (25, 80);
  bezierVertex(25, 80, 35, 65, 55, 60);
  vertex(55, 60);
  bezierVertex(55, 60, 100, 60, 130, 80);
  vertex(130, 80);
  bezierVertex(130, 80, 85, 100, 75, 120);
  vertex(75, 120);
  bezierVertex(75, 120, 80, 153, 100, 173);
  vertex(100, 173);
  vertex(0, 173);
  
endShape(CLOSE); 

// Orange- bottom
beginShape();

  fill(235, 140, 46);
  noStroke();
  
  vertex(180, 30);
    bezierVertex(180, 30, 190, 33, 190, 45);
  vertex(190, 45);
  bezierVertex(190, 45, 160, 70, 160, 90);
  vertex(160, 90);
  bezierVertex(160, 90, 170, 100, 170, 110);
  vertex(170, 110);
  vertex(175, 120);
  vertex(185, 115);
  vertex(190, 130);
  vertex(196, 123);
  vertex(196, 173);
  vertex(100, 173);
  vertex(95, 165);
  vertex(100, 155);
  vertex(100, 140);
  vertex(105, 125);
  vertex(105, 105);
  bezierVertex(105, 105, 105, 90, 145, 70);
  vertex(145, 70);
  bezierVertex(145, 70, 165, 60, 180, 30);
  
endShape(CLOSE);

// Red circle

  fill(183, 0, 14);
  noStroke();
  ellipse (172, 43, 4, 4);
  
// Blue circle- R
  noStroke();
  ellipse (174, 40, 2, 2);
  
// Green- bottom

beginShape();

  fill(30, 99, 42);
  noStroke();

    vertex(115, 55);
    bezierVertex(115, 55, 130, 50, 125, 50);
    vertex(125, 50);
    vertex(135, 45);
    bezierVertex(135, 45, 140, 45, 140, 50);
    vertex(140, 50);
    vertex(155, 50);
    vertex(155, 55);
    vertex(160, 55);
    bezierVertex(160, 55, 150, 70, 130, 80);
    vertex(130, 80);
    vertex(120, 75);
    vertex(110, 70);
    bezierVertex(110, 70, 120, 65, 120, 60);
    vertex(120, 60);

endShape(CLOSE);
    

  

