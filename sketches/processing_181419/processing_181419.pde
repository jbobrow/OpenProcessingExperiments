
size(300,300);
background(205,175,149);

int x=20;
stroke(0);
strokeWeight(10); line(60,60,x/3,15*x);
strokeWeight(12); line(60,60,2*x,15*x);
strokeWeight(12); line(60,60,4*x,15*x);
strokeWeight(12); line(60,60,7*x,15*x);
strokeWeight(12); line(60,60,12*x,15*x);
strokeWeight(12); line(60,60,22*x,15*x);
strokeWeight(12); line(60,60,140*x,15*x);
strokeWeight(12); line(60,60,50*x,-30*x);

int y=5;
fill(238,64,0); noStroke(); triangle(y,2*y,y,13*x,50,12*y);
fill(255); noStroke(); triangle(3*y,7*y,15,180,40,62);

fill(238,64,0); ellipseMode(CORNER); ellipse(35,10,35,35);
fill(255); ellipseMode(CENTER); ellipse(52,27,10,10);


