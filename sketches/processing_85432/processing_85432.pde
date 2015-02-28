
size (400, 250);
background (85,85,0);
rectMode(CENTER);

//head
noStroke();
fill (255, 85, 0);
ellipse (width/2,height/2,150,150);

fill(0);
//left eye
ellipse (width/2-30, height/2-25, 25, 25); 

//right eye
ellipse (width/2+30, height/2-25, 25, 25); 

//mouth
//rect(width/2, height/2+20, 100,10);

stroke(0);
strokeWeight(10);
noFill();
bezier(width/2-40, height/2+20,  width/2-15, height/2+50, width/2+15, height/2+50, width/2+40, height/2+20);

