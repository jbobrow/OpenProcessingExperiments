
int eSize=3;

size(510,510);
background(255,215,0);
smooth();

for(int x=0; x<=width; x++){

  stroke(x,255,127,127);
line(0,x,x,height);
 
 stroke(x,255,127,127);
line(width,x,x,0);

noFill();
for(int i=100; i>35; i--){
  stroke(0,i*25,0,100);
  ellipse(width/2,height/2,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/3,height/3,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/1.5,height/1.5,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/1,height/1,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/6,height/6,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/180,height/180,i,i);
  
   stroke(0,i*25,0,100);
  ellipse(width/1.2,height/1.2,i,i);
  
    stroke(x,187,20,234);
line(0,0,x,height);

 
  

  
}
}


