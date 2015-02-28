
size (400, 400);// only works for size >300, 300
background(204, 255, 255);


noStroke();
fill(51, 102, 204);
ellipse(width/2, height-(height/4), (width/2)-19, (height/2)-20);
fill(255, 255, 102);
ellipseMode(CENTER);
rectMode(CENTER);
ellipse(width/2, height/4, (width/2)-19, (height/2)-20);
rect(width/2, (height/2)-7, (width/2)-20, height/2);
fill(51, 102, 204);
//rect(width/2, (height/2)+120, (width/2)-80, (height/9)+(height/9));//problem with expanding
rect(width/2, (height/2)+40, (width/2)-20, height/40);

rectMode(CORNER);
rect((width/2)-(width/6), (height/2)+40, (width/2)-(width/6), (height/9)+(height/9));//problem with expanding

stroke(0);
strokeWeight(3);
line((width/2)-30, (height/2), (width/2)+30, height/2);

fill(153,153,153);
rectMode(CENTER);
noStroke();
rect(width/2, height/4,(width/2)-20, height/40);
stroke(153,153,153);
strokeWeight(8);
fill(255,255, 102);
ellipse(width/2, height/4, width/4, height/4);
