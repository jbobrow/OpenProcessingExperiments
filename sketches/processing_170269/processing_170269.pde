
int eSize = 10;  
 
size(400, 400);  
background(255);  
smooth(); 

for(int y=0; y<=width; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 100 && x < 300 && y > 100 && y < 300){  
      fill(255);  
    }
    else{   
      fill(0);  
    }
    ellipse(x, y, eSize, eSize);
  }
}

for(int y=0; y<=400; y+=50){
 for(int x=0; x<=400; x+=50){
   ellipse(x, y, eSize, eSize);
  
   fill(x, y, y);
   ellipse(x, y, eSize, eSize);
  
 }
}

for(int y = 0; y <= 400; y +=10) { 
  
  stroke(0, 0, 0); 
  
  line(y, 400, 0, y); 
  line(y, 0, 400, y); 
 
  
  
} 


