
size(600,600);
background(255,255,255);
for (int i = 30; i < 600; i += 50) {
  stroke(i/2,225,255); 
 strokeWeight(3); 
  if (i < 600) {  
    stroke(i/2,225,225);   
  }
  line(30, i, 570, i);
  
if (i < 200)
{
  noStroke();
  fill(153,204,255,120);
  ellipse(i,i,i,i);
  
   noStroke();
  fill(255,153,255,120);
  ellipse(i+300,i+300,i,i);
  
  noStroke();
  fill(255,255,153,120);
  ellipse(i,i+300,i,i);
  
   noStroke();
  fill(255,153,153,120);
  ellipse(i+300,i,i,i);  
}
}
for (int d = 30; d < 600; d += 30) {
  noStroke();
  fill(255,204,153,10);
  ellipse(300,300,d/3,d/3);
  
    stroke(d/2,225,255); 
 strokeWeight(3); 
   line(d,30, d, 570);
   
   }
   strokeWeight(20);
   stroke(0,0,255);
arc(300, 300, 300, 300, HALF_PI, PI);

stroke(255,0,0);
arc(400, 200, 300, 300, HALF_PI, PI);

   stroke(255,255,0);
arc(500, 100, 300, 300, HALF_PI, PI);


