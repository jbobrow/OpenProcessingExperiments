
/* Dillon Kendrick, name of art- Green eye of vortex
 i was aiming to be abstract in the sketch. I wanted
to have my favorite colors and to use the repeating diagnal lines
the green circle in the middle was a nice focal point. Also, the 
triangle in the bottom left corner changes colors each time you refresh
the page, which is awesome. i wish my art had more curves, but i'm 
working on improving my processing skills/








smooth(1);
  size(800, 600);
  strokeWeight(3);
  for(int i=0; i<800; i+=10) {
  
  line(0,0,800,i);
  line(800,i,0,0);
  
  fill(0,255,0,170);
  ellipse(400,300,random(0,800),20);
  
  
  }
  
  stroke(0,255,255);
  for(int i=0; i<800; i+=15) {  
  
  line(i,600,800,0);
  line(800,0,i,600);
  
  }
  
  
  stroke(lerpColor(color(7,0,200), color(255,1,62), 1.0*i/width));  
  for(int i=0; i<800; i+=2) {  
  
  ellipse(random(0,800),
  random(0,300),
  random(5,20),
  random(5,20));
  
  }
  
  for(int i=0; i<800; i+=10) {
    triangle(20,500,300,500,100,600);  fill(random(0,255), random(0,255), random(0,255));  
  
  
  
  
  
  
  
  }
  
  
 
  
