
int eSize = 2;  
 
size(400, 400);
colorMode(RGB);
background(0); 
smooth();  
noStroke();
 

for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 100 && x < 300 && y > 100 && y < 300){
      fill(150,x,100); 
    }
    else{    
      fill(255,y,150);  
    }
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
  }
}

stroke(30,100,150);    
strokeWeight(3);     
line(0, 200, 80, 200); 
line(80, 200, 100, 160); 
line(100, 160, 120, 260); 
line(120, 260, 140, 100); 
line(140, 100, 160, 300); 
line(160, 300, 180, 60);
line(180, 60, 200, 240); 
line(200, 240, 220, 180); 
line(220, 180, 240, 260); 
line(240, 260, 260, 200); 
line(260, 200, 400, 200); 

stroke(30,100,250);    
strokeWeight(2);     
line(0, 200, 80, 200); 
line(80, 200, 100, 160); 
line(100, 160, 120, 260); 
line(120, 260, 140, 100); 
line(140, 100, 160, 300); 
line(160, 300, 180, 60);
line(180, 60, 200, 240); 
line(200, 240, 220, 180); 
line(220, 180, 240, 260); 
line(240, 260, 260, 200); 
line(260, 200, 400, 200); 



