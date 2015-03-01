
int eSize = 10; 
size(400, 400);  
colorMode(HSB, 360, 100, 100);
background(0);      
noStroke();          

for(int x= 10; x <= 1000; x+=10){ 
  stroke(x,x,x,x); 
  noFill(); 
  ellipse(200,200,x,x); 
}
for(int x= 10; x <= 1000; x+=80){ 
  stroke(x,x,x,250); 
  noFill(); 
  ellipse(0,200,x,x); 
}
for(int x= 10; x <= 1000; x+=80){ 
   stroke(x,x,x,250); 
  noFill(); 
  ellipse(200,0,x,x); 
}
for(int x= 10; x <= 1000; x+=80){ 
   stroke(x,x,x,250); 
  noFill(); 
  ellipse(200,400,x,x); 
}
for(int x= 10; x <= 1000; x+=80){ 
   stroke(x,x,x,250); 
  noFill(); 
  ellipse(400,200,x,x); 
}


