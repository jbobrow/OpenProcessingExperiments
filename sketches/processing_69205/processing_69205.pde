
  size(400,300);
  strokeWeight(3);
  smooth();
  
  beginShape();
  fill(#2785C1);
  stroke(0);
  rect(0,0,400,152,10,30);
  endShape();
  
  beginShape();
  fill(#624E1B);
  stroke(0);
  rect(0,155,400,150,10,30);
  endShape();
  
    
  beginShape();
  fill(#202020);
  bezier(0,170,170,100,170,150,170,140);  
  endShape();
  
  beginShape();
  fill(#202020);
  bezier(170,140,220,180,170,150,220,180);
  endShape();
  
  beginShape();
  fill(#817D11);
  vertex(182,150);
  vertex(400,155);
  endShape();
  
  beginShape();
  fill(250);
  bezier(0,100,100,50,150,50,250,100);  
  endShape();
  
  beginShape();
  fill(250);
  bezier(250,100,350,0,350,0,400,100);  
  endShape();
  
  beginShape();
  fill(#F51400);
  arc(250,100,150,150,PI+.4,2*PI-.78);
   endShape();
   
   
  
  beginShape();
  line(200,190,160,250);
  endShape();
   endShape();


