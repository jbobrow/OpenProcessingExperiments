
int eSize = 3;
 
size(510, 510);
colorMode(RGB, 510);
background(300, 200, 105.127);
noStroke();
 

 

for (int x = 0; x <=width; x +=10) {
  stroke(x, 225, 255);
  line(x, 0, x, height);
  line(0, 0, x, height);
  line(x, x, 0, height);
}
 
for (int x = 0; x <=width; x +=10) {
  stroke(x, 255, x,127);
  line(160,0 , x, height);
  line(450, 0, x, height);
  line(0, 450, x, 0);
  line(300, 510, x, 0);
}


smooth();
for (int y = 0; y <= height; y += 15) {
  for (int x = 0; x <= width; x += 15){
    
    if (x > 290 && x < 470 && y > 290 && y <470
    || x > 30 && x < 170 && y > 30 && y <170){
      fill(100);
    }else{
      fill(300);
    }
  
    
    ellipse(x,y,eSize,eSize);
    println(x);
  }
}


