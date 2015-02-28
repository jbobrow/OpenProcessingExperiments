
//anne_schneider_9-17-1988
size(300,300);
float y=17;
fill(255,0,0);
ellipse(width/2,height/2,y*3,y*3);
fill(255,247,8);
ellipse(width/2+100,height/2,60,60);
fill(0,255,0);
rectMode(CENTER);
rect(300/y,150,80,80);
stroke(255,102,0);
strokeWeight(2);
line(2*width/3,height/2+3*y,2*width/3,height/2-3*y);
stroke(0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3,height/2-y*2, width/3+y*2,height/2+y*2,width/3-y*2,height/2+y*2);



