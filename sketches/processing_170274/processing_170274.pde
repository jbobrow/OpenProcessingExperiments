
int eSize = 10;
 
size(400, 400);
colorMode(RGB,350);
background(100);
//noStroke();

for (int y = 0; y <=400; y += 10) {
for (int x = 0; x <=400; x += 10) {    
  
  stroke(x, y, 400, 200);
  fill(x, y, 400, 100);
    ellipse(x, y, eSize, eSize);
    
    fill(0);
    rect(200, y, eSize, eSize);
    rect(50, y, eSize, eSize);
    rect(340, y, eSize, eSize);
   }
}



for(int x=0; x<=width; x+=20){
 
  if(x == 100 || x == 300){
    fill(255); 
  }
  else{  
    fill(0);  
  }
   rect(x, 200, eSize, eSize);
    rect(x, 50, eSize, eSize);
      rect(x, 340, eSize, eSize);
  println("x=" + x);
}


