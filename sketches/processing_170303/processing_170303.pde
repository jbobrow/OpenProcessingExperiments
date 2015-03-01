


int eSize = 7;

size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();


for(int y = 0; y <=400; y += 10) {
  for (int x = 0; x <= 400; x += 10) {
    
   if(x + y>=2*x){
     fill(400-x, x, 400-x, 400-x);
   }else{
     fill(400-x, 400-x, x, x);
   }
    rect(x - 3, y - 3, eSize, eSize);
  
  }
    
}

for(int y = 0; y <=400; y += 40) {
  for (int x = 0; x <= 400; x += 40) {
    fill(x, 400-x, x, x);
   
    stroke(x, x, 400-x, 100);
    strokeWeight(3);
    noFill();
    ellipse(200, 200, x, y);
  }
    
}


