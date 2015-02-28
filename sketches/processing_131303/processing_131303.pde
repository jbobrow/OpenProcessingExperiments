
// draw a static face
// www.taylorhokasnson.com
 
  size(300, 300);
  background(161,44,219);
   
  noStroke();
  rectMode(CENTER); 
   
  // this is important - changes zero location for all future coordinates
  translate(150,150);
   
  // head
  fill(195,153,68); 
  ellipse(-75, 0, 70, 40); 
  ellipse(75, 0, 70, 40);
  fill(0,0,0); 
  fill(22,78,175); //face
  rect(0, 0, 150, 200, 40);
  ellipse(0, -100, 50, 25);  
  ellipse(-75, 0, 50, 20); 
  ellipse(75, 0, 50, 20);
  
   
  // hair
  fill(0,0,0);
  rect(0, -75, 150, 90, 40, 40, 150, 150);
   
  // eyes
  fill(86, 255, 142); 
  ellipse(-37.5, 0, 30, 30);
  ellipse(37.5, 0, 30, 30);
  fill(0); 
  ellipse(-37.5, 0, 15, 15);
  ellipse(37.5, 0, 15, 15);
  rect(-37.5, -10, 40, 20);
  rect(37.5, -10, 40, 20);
   
  // nose
  fill(255, 137, 0); 
  triangle(0, 0, -15, 50, 15, 50); 
   
   // mouth
  fill(255,137,0); 
  rect(0, 60, 100, 5);    



