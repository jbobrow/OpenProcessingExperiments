
int eSize = 3;

size(510,510);
background(255);

for(int x = 0; x <= width; x ++){
  stroke(x,255,255,127);
  line(510,0,x,height);
  
  
  stroke(x,255,255,127);
  line(x,0,x,height);
  
  stroke(x,255,55,127);
  line(x,x,x,height);
  
stroke(113);  
fill(255,0,0);
ellipse(350, 150, 50, 50);  


noStroke();  
fill(0);
ellipse(250, 250, 50, 50);  


noStroke();  
fill(0,255,0);
ellipse(150, 350, 50, 50);  
  
noStroke();  
fill(255);
ellipse(150, 150, 50, 50);

  
stroke(122);  
fill(0,0,245);
ellipse(350, 350, 50, 50);
}



