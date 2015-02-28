
// Max Milà 
size(500,500);
background(255);

//potes
stroke(173,255,0);
strokeWeight(width/33);
line(width/2,height/2,3*width/8,7*height/8);
line(3*width/8,7*height/8,3*width/8,height-1);

line(width/2,height/2,5*width/8,7*height/8);
line(5*width/8,7*height/8,5*width/8,height-1);


//cos
fill(173,255,0);
stroke(255,0);
ellipse(width/2,height/2,width/2,width/2);

ellipse(width/2,height/3,width/4,height/5);


//ull
fill(255);
stroke(0);
strokeWeight(width/250);
ellipse(width/2,height/2-height/9,width/4,height/4);

//iris (manté stroke)
fill(0,255,104);
strokeWeight(width/500);
ellipse(width/2,height/2-height/9,width/9,height/9);


//pupila (manté stroke)
fill(0);
ellipse(width/2,height/2-height/9,width/20,height/20);

//somriure (manté stroke)
strokeWeight(width/150);
noFill();
arc(width/2,height/2,width/3,height/3,PI/4,3*PI/4);

//barbeta (manté stroke i noFill)
strokeWeight(width/250);
arc(width/2,height*2/3,width/15,height/15,PI/4,3*PI/4);

//braç dret
stroke(173,255,0);
strokeWeight(width/33);
line(width/4,height/2,width/8,2*height/5);

line(width/8,2*height/5,width/10,height/4);


//carpeta
fill(0,99,255);
stroke(255,0);
strokeWeight(1);
rectMode(CENTER);
rect(9*width/10,4*height/5,width/6,height/8);


//braç esquerra 
stroke(173,255,0);
strokeWeight(width/33);
line(3*width/4,height/2,7*width/8,3*height/5);

line(7*width/8,3*height/5,9*width/10,3*height/4);




