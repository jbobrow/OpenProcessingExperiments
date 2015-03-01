
int eSize = 10;

size(400, 400);
colorMode(RGB, 400);
background(400);
smooth();
noStroke();

for (int y = 0; y <200; y += 10) { //upperleft
  for (int x = 0; x < 200; x += 8) {
    fill(400-(y+x), 100, 250, 350);
    ellipse(x, y, eSize, eSize);
 }
}
for (int y = 0; y <200; y += 10) { //upperrRight
  for (int x = 200; x < 400; x += 8) {
    fill(x-y, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
 }
}


for (int y = 200; y < 400; y += 10) {//downleft
  for (int x = 0; x < 200; x += 8) {
    fill(y-x, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
 }
}

for (int y = 200; y < 400; y += 10) {//downRight
  for (int x = 200; x < 400; x += 8) {
    fill((x+y)-400, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
 }
}


for(int y = 0; y <=400; y += 10) { 
 for (int x = 0; x <= 400; x += 10) {
   
   if(x >= 0 && x <= 100 && y >= 0 && y <= 100){//upperleft
      fill(230, 240, 255, 50);
    }
   else if(x >= 0 && x <= 100 && y >= 200 && y <= 300){//downleft
    fill(400,100, 250, 50);
    }  
    else if(x > 300 && x < 400 && y >= 300 && y < 400){//downRight
    fill(400,100, 250, 50);
    }      
   else if(x > 100 && x <= 200 && y >= 100 && y <= 200){
    fill(400,100, 250, 50);
    }
   else if(x > 200 && x <= 300 && y >= 0 && y <= 100 || 
    x > 200 && x <= 300 && y >= 0 && y <= 100 ||
    x > 200 && x <= 300 && y >= 200 && y <= 300 || 
    x > 300 && x < 400 && y >= 100 && y <= 200 || 
    x > 100 && x <= 200 && y >= 300 && y < 400){
    fill(400,100, 250, 50);
    }
    
    
    
     else{
      fill(400);
     }
    ellipse(x, y, eSize, eSize);
  }
 }



