
size(200,200);

stroke(0);
strokeWeight(5);

fill(255,0,0);
triangle(0,0,width,0,width/2,height/2);

fill(0,128,0);
triangle(0,height,width,height,width/2,height/2);

fill(255,255,0);
triangle(0,0,0,height,width/2,height/2);

fill(0,0,255);
triangle(width,0,width,height,width/2,height/2);

noStroke();
fill(255,255,255,215);
ellipse(width/2,height/2,width/2,height/2);
