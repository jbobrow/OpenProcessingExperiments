
//birthday June 25
size(300,300);
smooth();
float x_placement=6.25;

//red circle
fill(255,0,0);
ellipse(width/2,height/2,x_placement*1.5,x_placement*1.5);

//yellow circle
fill(250,255,0);
ellipse((width/2)+100,height/2,60,60);

//green square
fill(88,255,0);
rectMode(CENTER);
rect(width/x_placement,height/2,80,80);

//orange vertical line
stroke(255,184,3);
strokeWeight(2);
line((width*2)/3,((height/2)+(3*x_placement)),(width*2)/3,((height/2)-(3*x_placement)));

//blue rectangle
fill(3,8,255);
stroke(0);
triangle((width/3)-(2*x_placement),(height/2)+(2*x_placement),(width/3)+(2*x_placement),(height/2)+(2*x_placement),(width/3),(height/2)-(2*x_placement));

