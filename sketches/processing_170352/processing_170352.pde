
int eSize = 160; 
size(400, 400); 
background(255); 
smooth(); 
fill(0);


for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){ 
     
  stroke(x,186,y); 
    strokeWeight(5);
    fill(x,y,231); 
     rect(x, y, eSize, eSize); 
  
} 
}
 
 
 for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
 
  stroke(x,110,y); 
strokeWeight(4); 

line(400,400,200,x);

}
 
 }
 
  for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
if(x == width/2){  
  stroke(x,110,y); 
strokeWeight(4); 

line(400,0,200,y);
}
}
 }
 
 
   for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
if(x == width/2){  
  stroke(x,110,y); 
strokeWeight(4); 

line(0,400,200,y);

}
 }
   }
    for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
if(x == width/2){  
  stroke(x,110,y); 
strokeWeight(4); 

line(0,0,200,y);

}
 }
    }
 
    for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
if(x == width/2){  
  stroke(x,110,y); 
strokeWeight(4); 

line(0,200,200,y);
}
}
 }
 
  
    for(int y = 0; y <= height; y += 40){ 
for(int x = 0; x <= width; x += 40){
  if(x == width/2){  
  stroke(x,110,y); 
strokeWeight(4); 

line(400,200,200,y);

}
 }
 
    }


