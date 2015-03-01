
int eSize = 10;  

size(400, 400);   
colorMode(HSB, 360, 100, 100); 
background(0);       
noStroke();           

for(int x= 10; x <= 400; x+=10){  
  stroke(x,x,x,x);  
  noFill();  
  ellipse(200,200,x,x);  
}

for(int x= 10; x <= 400; x+=10){  
  stroke(x,x,x,x);  
  noFill();  
  ellipse(0,0,x,x);  
}

for(int x= 10; x <= 400; x+=10){  
  stroke(x,x,x,x);  
  noFill();  
  ellipse(400,0,x,x);  
}

for(int x= 10; x <= 400; x+=10){  
  stroke(x,x,x,x);  
  noFill();  
  ellipse(400,400,x,x);  
}

for(int x= 10; x <= 400; x+=10){  
  stroke(x,x,x,x);  
  noFill();  
  ellipse(0,400,x,x);  
}


for(int x= 10; x <= 1000; x+=1){  
  stroke(x,x,x,250);  
if((x > 0 && x <=200)  ||   x == 200){
    fill(0);
  ellipse(0,200,390,50);  
} 

}

for(int x= 10; x <= 1000; x+=1){  
   stroke(x,x,x,250);  
if((x > 0 && x <=200)  ||   x == 200){
    fill(0);
  ellipse(200,0,50,390);  
} 

}

for(int x= 10; x <= 1000; x+=1){  
   stroke(x,x,x,250);  
if((x > 0 && x <=200)  ||   x == 200){
    fill(0);
  ellipse(200,400,50,390);  
} 

}

for(int x= 10; x <= 1000; x+=1){  
   stroke(x,x,x,250);  
if((x > 0 && x <=200)  ||   x == 200){
    fill(0);
  ellipse(400,200,390,50);  
}

}
for(int x=0; x<=width; x+=10){ 
  if(x == 200){ 
    fill(RGB,x,x,250); 
  } 
  else{ 
    noFill();
  } 
  ellipse(x, height/2, eSize, eSize); 
  println("x=" + x); 
} 


