

size(854, 480);
background(255);



beginShape();
  strokeWeight(0);
  fill(150);
  ellipse(width/2, 400, 600, 600);
endShape(CLOSE);

beginShape();
  fill(0);
  ellipse(width/2, 75, 100, 50);
  rect(360, 75, 125, 40);
   
endShape(CLOSE);



  
  
beginShape();
  fill(0);
  ellipse(488, 365, 90, 90);
  arc(551, 335, 240, 195, radians(0), radians(150));
  fill(150);
  strokeWeight(0);
  stroke(150);
  ellipse(600, 290, 179, 170);
endShape(CLOSE);


beginShape();
  fill(0);
  ellipse(366, 365, 90, 90);
  arc(303, 335, 240, 195, radians(30), radians(180));
  fill(150);
  strokeWeight(0);
  stroke(150);
  ellipse(254, 287, 179, 188);
endShape(CLOSE);



beginShape();
  smooth();
  fill(255);
  stroke(0);
  strokeWeight(5);
  ellipse(530, 200, 150, 150);;
endShape(CLOSE);


noFill();
strokeWeight(5);
stroke(0);
arc(300, 230, 125, 100, radians(180), radians(360));

fill(0);
stroke(0);
strokeWeight(5);
ellipse(300, 220, 20, 20);

fill(0);
stroke(0);
strokeWeight(5);
ellipse(427, 440, 20, 20);

noFill();
noStroke();
line(602, 189, 630, 204);
line(640, 185, 640, 185);
stroke(100);
bezier(602, 189, 630, 204, 640, 185, 640, 485);



