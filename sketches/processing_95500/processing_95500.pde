
size(200, 200);
background(255);


 pushMatrix();
 translate(100,100);
noStroke();
for (int x=1; x<1000; x+=1){  
 rotate(PI/12);
fill(0,50);
ellipse(x, x, x, x); 

}
