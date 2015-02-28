
int eSize = 3;

size(400,565);
background(#ffdab9);


  
for(int x=0; x<=400; x+=5) { 


for(int y=0; y<=565; y+=5) {   


if(x >=250 && x <=250 && y <=565 || y >=270 && y <=190){  



 fill(150, 37, 28 );  


  stroke(10); 


rect(x, y, 50, 50); 

  stroke(46,79,40,78);
  line(x,0,x,0);
  
  stroke(24, 128, 125, 148);
  line(x,x,0,0);
  
  stroke(60, 28, 125, 127);
  line(0,x,x,height);
  
  stroke(89,3,58,127);
  line(width,0,x,0);
  
  stroke(25,8,58.160);
  line(width,0,x,height);
  
  stroke(35,26,58,120);
  line(height,x,0,width);
  
  
  stroke(55,6,58.130);
  line(width,0,x,height);
  
  stroke(35,22,58,980);
  line(height,x,0,width);

  stroke(24, 128, 125, 148);
  line(x,x,0,0);
  
  fill(255,0,0);
  ellipse(150, 150, 150, 150 );
 
  fill(0);
  ellipse(150, 150, 70, 70 );
  
  line(24,x,19,height);
  line(width,x,x,0);
}

}
 }




