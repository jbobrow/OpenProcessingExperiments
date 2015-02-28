
size(510, 510);       
background(0);      
stroke(0);             
 
  
for(int y = 0; y<=height; y +=2){ 
   stroke(y, 255, 200, 255);
   rect(y,y,60,60);
   rect(y,y*2,60,60);
   rect(y,y*3,60,60);
   rect(y,y*4,60,60);
   rect(y,y*5,60,60);
   rect(y,y*6,60,60);
   rect(y*2,y,60,60);
   rect(y*3,y,60,60);
   rect(y*4,y,60,60);
   rect(y*5,y,60,60);
   rect(y*6,y,60,60);
}

for(int x=0; x<=width; x+=3) {
  stroke(x,255,200,255);
  line(x*2,x*2,x,height);
}
for(int y=0; y<=height; y+=3) {
  stroke(y,255,200,255);
  line(y*2,y*2,width,y);
}


