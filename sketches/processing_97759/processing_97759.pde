
size(600,600);
background(0,0,0);
for (int i = 30; i < 90; i = i+5) {
  for (int j = 0; j < 90; j = j+5) {
    stroke(255,255,255,100);
    line(0, 0,i*9,j*9);
    
    stroke(255,255,255,100);
    line(0, 600,i*9,j*9);
    
     stroke(255,255,255,100);
    line(600,300,i*9,j*9);
  }
}
   
     for(int b=30; b<600; b= b+7) {
strokeWeight(5);
stroke(255,b,b,80);
fill(b*1.5+50,b,b,50);
rect(b*2-60,b*2-60,b/1.1,b/1.1);
   }
   
   stroke(255,255,255);
   strokeWeight(3);
   noFill();
  ellipse(50,300,50,50);
  
  line(50,250,50,350);
  
  line(50,300,600,300);
  
  line(600,300,450,450);
  
  ellipse(450,450,50,50);
 


