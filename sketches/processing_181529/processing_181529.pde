
size(300,200);
background(98,190,196);

noStroke();

fill(220,40,98,220);
rect(0,(2*height)/3, width, height/9);
fill(80,240,120,120);
rect((3*width)/4,0,width/9,height);
fill(80,240,120,255);
strokeWeight(2);
triangle(width/25,height/3,(width/2),height/20,width-(width/8), height/3);
strokeWeight(2);
fill(196,98,98);
triangle(width/25,height/3,(width/2),height/2+height/30,width-(width/8), height/3);
fill(220,40,98,190);
ellipse((width/2),height/6+height/30,20,20);
