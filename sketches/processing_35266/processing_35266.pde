
size(300,300);
background(200);
smooth();

float birthday;
//June 25, 1991
birthday = 25;

ellipseMode(RADIUS);
  fill(255,0,0);
  ellipse(width/2, height/2, birthday*3, birthday*3);

ellipseMode(DIAMETER);
  fill(255,255,0);
  ellipse(width/2+100, height/2, 60,60);

rectMode(CENTER);
  fill(0,255,0);
  rect(width/birthday, height/2, 80,80);
  
stroke(255,125,0);
  strokeWeight(2);
  line(width*2/3, height/2 + birthday*3, width*2/3, height/2 - birthday*3);
  
strokeWeight(1);
  fill(0,0,255);
  triangle(width/3, height/2 - birthday*2, width/3 + birthday*2, height/2 + birthday*2, width/3 - birthday*2, height/2 + birthday*2);



