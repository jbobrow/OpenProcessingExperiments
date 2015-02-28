
int eSize = 3;

size(510, 510);
background(255);




for (int x =0; x <= width; x ++) {
  stroke(x,150,150,50);
      line(180,0, x, height);
      
      stroke(100,x,150,100);
      line(150,width,x,height);
      line(x,0,width,height); 
 
  stroke(x,150,150,50);
      line(0,0, x, height);
           
  }

for(int i=0; i<200; i+=5) {    
  stroke(150, i, eSize, eSize);}
  
  rectMode(CENTER);     
fill(0,140,140);
rect(200, 100, 50, 50); 

  rectMode(CENTER);     
fill(0,140,140);
rect(300, 100, 50, 50); 

stroke(0);
fill(150,0,0);
strokeWeight(1); 
line(200, 150, 300, 150); 

smooth();           
 
fill(0);   
 
for(int y = 0; y <= height; y +=10){     
  for(int x = 0; x <= width; x += 10){    
    ellipse(x, y, eSize, eSize);
  }
}




