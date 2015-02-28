
size(300,300);
smooth();
 
float myday;
//October 2, 1991
myday = 2;
 
//yellow ellipse
ellipseMode(DIAMETER);
  fill(255,255,0);
  ellipse(width/2+100,height/2,60,60);
  
//Green Rectangle
rectMode(CENTER);
  fill(0,255,0);
  rect(width/myday,height/2,80,80);
  
//Red ellipse
ellipseMode(RADIUS);
  fill(255,0,0);
  ellipse(width/2, height/2, myday*3, myday*3);
  
//Orange Line
strokeWeight(2);
  stroke(255,125,0);
  line(width*2/3,height/2+myday*3,width*2/3,height/2-myday*3);
  
//Blue Triangle
strokeWeight(1);
  stroke(0,255);
  fill(0,0,255);
  triangle(width/3,height/2-myday*2,width/3-myday*2,height/2+myday*2,width/3+myday*2,height/2+myday*2);

