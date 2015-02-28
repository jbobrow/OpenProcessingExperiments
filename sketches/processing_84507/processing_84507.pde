
size(800, 600);
background(0);
fill(255);
ellipse(width/3, height/3, width/10, height/10); 
ellipse(width-(width/3), height/3, width/10, height/10);
triangle((width/2)-20, height/2, (width/2)+20, height/2, width/2, (height/2)-20);
strokeWeight(width*0.02);
stroke(255);
line(width/3, height*2/3, width-(width/3), height*2/3);
