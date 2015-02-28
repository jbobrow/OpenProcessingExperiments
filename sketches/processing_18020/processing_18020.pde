
size(250,250);
background(255);
smooth();




for (int y=0; y<=250; y+=9){
  for (int x=0; x<=250; x+=9){
    strokeWeight (2);
    point(x,y);
  
  }
}

noStroke();
fill(165,255,121,180);
ellipse (125,125,250,250);

fill(255,242,121,180);
for(int y=25; y<=250; y+=50){
  ellipse(y,125,50,50);
fill(121,209,255);
for(int x=50; 50<=250; x+=75){
  ellipse(x,200,50,50);
 }
}

fill(255,186,121,180);
ellipse(50,200,100,100);
ellipse(125,200,100,100);
ellipse(200,200,100,100);

