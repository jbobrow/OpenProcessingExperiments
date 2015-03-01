
int eSize = 15;
 
size(400, 400);
colorMode(RGB,400);
background(400);
//noStroke();

for (int y = 0; y <=400; y += 10) {
for (int x = 0; x <=400; x += 10) {    
  
  stroke(x, y, 400, 200);
  fill(x, y, 400, 100);
    ellipse(x, y, eSize, eSize);
    
    fill(0);
    rect(x, 200, eSize, eSize);
    rect(200, y, eSize, eSize);
    rect(50, y, eSize, eSize);
    rect(x, 50, eSize, eSize);
    rect(340, y, eSize, eSize);
    rect(x, 340, eSize, eSize);
   }
}


