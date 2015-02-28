
  size(600,600);
  background(255,0,9);
  smooth();
 
  for(int i = 0; i < 1000; i+=10){
    noFill();
    stroke(map(i,0,600,0,255));
    ellipse(width/2,height/2,i,i);
  }

 
    
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,300,165,165);
    
  fill(255);
  ellipse(325,275,20,20);
    
  fill(255);
  ellipse(275,275,20,20);
    
  strokeWeight(10);
  stroke(255);
  line(275,325,325,325);
    
  
    
  saveFrame("smile.jpg");


