
int eSize = 3;

size(510,510);
background(87);
smooth();

for(int x=0; x<=height; x ++){
  noStroke();
  fill(155,0,0,100);
  ellipse(255,160,300,300);

  noStroke();
  fill(155,155,0,100);
  ellipse(350,350,300,300);
  
  noStroke();
  fill(255,0,155,100);
  ellipse(160,350,300,300);
  
  stroke(255,0,0,130);
  line(0,0,x,height);
  
    
  stroke(255,69,0,100);
  line(73,0,x,height);
  
  stroke(255,255,0,100);
  line(146,0,x,height);

  stroke(0,128,0,100);
  line(219,0,x,height);
  
  stroke(0,0,255,130);
  line(292,0,x,height);
  
  stroke(25,25,112,100);
  line(365,0,x,height);
  
  stroke(128,0,128,100);
  line(438,0,x,height);

  //ellipse(x,100,50,50);
  
  //stroke(255,x,0,127);
  //line(255,height,x,0);

}
//naka 255



