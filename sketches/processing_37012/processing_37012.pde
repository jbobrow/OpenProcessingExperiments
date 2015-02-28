
print(height+":"+width);
size(800,300);
background(110,40,90);
stroke(200,40,100);


rect(width/4,0,200,300);

fill(0);
rect(width/2,0,200,300);

fill(100,60,200);
rect(0,145, 800,10);

strokeWeight(18);
line(0,0,800,300);
line(0,300,800,0);

triangle(width/2, height/4, width/4, 3*height/4, 3*width/4, 3*height/4);

noStroke();
fill(99);
ellipse(width/2,height/2,95,95);



