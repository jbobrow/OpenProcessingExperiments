

size(200,200);
  
//background
fill(#00B1FF);



 
//face
stroke(2);
strokeWeight(2.5);
fill(#FFDA00);
ellipse(100,80,170,160);
  
//eye
 strokeWeight(1);
fill(#000000);
ellipse(67,55,35,35);
  
strokeWeight(1);
fill(#FFFFFF);
ellipse(68,47,10,10);
 
 //eyee
strokeWeight(1);
fill(#000000);
ellipse(133,55,35,35);
  
strokeWeight(1);
fill(#FFFFFF);
ellipse(133,47,10,10);
 
//eyebrow
strokeWeight(5);
line(78,25,40,40);
 
//eyebroww
strokeWeight(5);
line(160,40,110,25);
 
//mouth
strokeWeight(2.5);
fill(250,70,100);
beginShape();
vertex(80,120);
vertex(100,150);
vertex(120,120);
endShape(CLOSE);
