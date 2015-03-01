

size(400,400);
colorMode(RGB,400);
background(400);



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
   stroke(y,100,255,200);
    line(400,0,-y,300);
    line(400,0,-y,400);
    line(400,0,-y,500);
    line(400,0,-y,600);
    line(400,0,-y,700);
    line(400,0,-y,y);
    line(400,400,y,0);
    line(400,400,y,100);
    line(400,400,y,200);
    line(400,400,y,300);
    line(400,400,y,400);
    line(0,400,400,y);
    
   
 }

 

 


