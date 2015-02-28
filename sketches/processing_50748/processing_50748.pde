
size(500, 500);
background(121,116,106);

//purple line

noFill();
strokeWeight(10);
stroke(160, 40, 230);
  
  beginShape();
vertex(500, 120); // first point
bezierVertex(450, 140, 350, 160, 290, 180);
bezierVertex(230, 100, 125, 40, 0, 400);
endShape();



noStroke();
//start of green semi-circles
fill(50,130,110);  
  arc(80, 20, 250, 250, PI / 2, 3 * PI / 2); 
  
fill(70,150,130);
  arc(100, 40, 200, 200, -PI, 0); 
  
fill(120,190,170);  
  arc(140, 80, 180, 180, PI / 2, 3 * PI / 2); 
  
fill(130,210,190);
  arc(160, 100, 160, 160, -PI, 0); 
  
fill(150,230,210);  
  arc(180, 120, 140, 140, PI / 2, 3 * PI / 2); 
  
fill(170,250,230);
  arc(200, 140, 120, 120, -PI, 0); 
  
fill(190,270,250);  
  arc(220, 160, 100, 100, PI / 2, 3 * PI / 2);  

fill(210,290,270);
  arc(240, 180, 100, 100, -PI, 0); 

fill(230,290,270);  
  arc(260, 200, 90, 90, PI / 2, 3 * PI / 2);  
  
  //green to yellow
  
fill(340,340,200);
  arc(280, 220, 100, 100, -PI, 0); 
  
fill(320,320,180);  
  arc(300, 240, 120, 120, PI / 2, 3 * PI / 2); 

fill(300,300,160);
  arc(320, 260, 140, 140, -PI, 0); 
  
fill(280,280,140);  
  arc(340, 280, 160, 160, PI / 2, 3 * PI / 2); 
  
fill(260,260,120);
  arc(360, 300, 180, 180, -PI, 0); 
  
fill(240,240,100);  
  arc(380, 320, 200, 200, PI / 2, 3 * PI / 2); 
  
fill(220,220,80);
  arc(400, 340, 220, 220, -PI, 0); 
  
fill(200,200,60);  
  arc(420, 360, 240, 240, PI / 2, 3 * PI / 2); 
  
fill(180,180,40);
  arc(440, 380, 260, 260, -PI, 0); 
  
fill(160,160,20);  
  arc(460, 400, 280, 280, PI / 2, 3 * PI / 2);
  
fill(140,140,0);
  arc(480, 420, 300, 300, -PI, 0); 
  
fill(120,120,0);  
  arc(500, 440, 300, 300, PI / 2, 3 * PI / 2);
  
  //end of yellow semi-circles 
  
// Pink Line
noFill();
strokeWeight(10);
stroke(255, 50, 190);
  
  beginShape();
vertex(80, 500); // first point
bezierVertex(320, 260, 280, 220, 290, 180);
bezierVertex(300, 100, 350, 40, 400, 0);
endShape();

              
