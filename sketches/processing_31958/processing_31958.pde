

  size(500,500);

background(37,32,51);
smooth();
stroke(255);
for (int x=0; x <= 500; x+=10){
  int y = x*2;
 fill(178,92,255,40);
ellipse(0,0,y,y);  
ellipse(500,500,y,y); 
ellipse(0,500,y,y);
ellipse(500,0,y,y);
}

