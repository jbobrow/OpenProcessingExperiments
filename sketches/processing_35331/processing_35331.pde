
size(300,300);
smooth();
float iv;
iv = 5;
fill(255,0,0);
ellipseMode(CENTER);
ellipse(width/2,height/2,3*iv,3*iv);
fill(255,255,0);
ellipse(width/2+100,height/2,60,60);
rectMode(CENTER);
fill(0,255,0);
rect(width/iv,height/2,80,80);
strokeWeight(2);
stroke(255,124,0);
line(2*width/3,height/2+3*iv,2*width/3,height/2-3*iv);
stroke(0,0,0);
strokeWeight(1);
fill(0,0,255);
triangle(width/3-2*iv,height/2+2*iv,width/3,height/2-2*iv,width/3+2*iv,height/2+2*iv);

