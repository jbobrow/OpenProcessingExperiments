
size(500,600);
background(255 ,255, 224);

//body
noStroke();
fill(0,0,0);
ellipse(width/2,height/2,width/2,height/3);


//arms
stroke(176, 224, 230);
strokeWeight(width/20);
line(3*width/5,2*height/5,4*width/5,height/5);
line(2*width/5,2*height/5,width/5,height/5);

//legs
stroke(176, 224, 230);
strokeWeight(width/20);
line(3*width/5,3*height/5,2*width/3,4*height/5);
line(2*width/5,3*height/5,1*width/3,4*height/5);

//body
noStroke();
fill(0,0,0);
ellipse(width/2,height/2,width/2,height/3);


//head
fill(176, 224, 230);

ellipse(width/2,2*height/8,width/3,height/3);


//eyes
fill(0,0,0);
ellipse(2*width/5,height/4,width/14,width/14);
fill(0,0,0);
ellipse(3*width/5,height/4,width/12,width/12);
fill(128, 128 ,0);
ellipse(2*width/5,height/4,width/23,width/23);
ellipse(3*width/5,height/4,width/15,width/15);


//mouth
fill(220 , 20,  60);
ellipse(width/2,3*height/10,width/10,width/10);
fill(139 ,  0 ,  0);
ellipse(width/2,3*height/10,width/12,width/12);
