

size(400, 400);
background(255);
smooth();
noStroke();
 
for(int y = 0; y <=400; y += 20) {
  for(int x = 0; x <=400; x += 20) {
    noStroke();
    int eSize = 30;
   fill(x,y,y,200);
   rect(x,y,eSize,eSize); 
   }
} 
for(int y = 0; y <=400; y ++) {
    smooth();
   stroke(y,255,255,127);
    line(0,0,y,400);
    line(0,0,y,300);
    line(0,0,y,200);
    line(0,0,y,150);
    
}    
 
int eSize = 10;
 
for(int y=0; y<=height; y+=10){
  for(int x=0; x<=width; x+=10){

    if(x>20 && x<400 && y>20 && y<400){
      fill(#9F74EA,70);
    }else{
      fill(#FFEE8B,150);   
    }

   rect(x,y,eSize,eSize);
    println(x);
  }
}


