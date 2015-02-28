

size(200,200);
 
background(100,200,200);

 
fill(100,200);

//face
fill(200,3,100);
strokeWeight(1);
rect(20+50,20+50,10+50,10+50);
fill(50,20,10);

//eye
fill(10,100,10);
strokeWeight(3);
int[] x={40,160};
ellipse(x[0],100,50,50);
ellipse(x[1],100,50,50);
ellipse(x[0],100,50,30);
ellipse(x[1],100,50,30);

//mouth
strokeWeight(3);
line(60,130,100,160);
line(140,130,100,160);

