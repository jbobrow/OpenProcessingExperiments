
size(600,700);
background(255,250,205);
//cape
noStroke();
fill(0,0,0);
ellipse(width/2.4,height,width/2,width/.92);
//face
noStroke();
fill(60,179,113);
ellipse(height/2.8,width/2,width/3,height/3.1);
//nose
stroke(0,100,0);
triangle(width/2.4,width/2.06,height/3.04,width/1.8,width/2.2,width/1.8);
//eyes
//left
stroke(0,0,0);
fill(255,255,255);
ellipse(height/3.3,width/2.2,width/12,width/20);
noStroke();
fill(125,158,192);
ellipse(height/3.3,width/2.2,width/60,height/70);
//right
stroke(0,0,0);
fill(255,255,255);
ellipse(width/2.1,width/2.2,width/12,width/20);
noStroke();
fill(125,158,192);
ellipse(width/2.1,width/2.2,width/60,width/60);
//mouth
stroke(128,0,0);
fill(255,48,48);
ellipse(width/2.4,height/1.89,height/9.2,width/15);
noStroke();
fill(60,179,113);
rectMode(CORNERS);
rect(width/3.16,height/1.89,width/1.94,height/2);
stroke(128,0,0);
line(height/3.3,height/1.89,width/2.08,height/1.89);
//hat
noStroke();
fill(0,0,0);
ellipse(width/2.4,width/3,width/2,height/7);
triangle(height/4.12,width/3,width/2.4,width/60,height/2.2,width/3);







