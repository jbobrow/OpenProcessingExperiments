
int eSize=6;

size(400, 400);
colorMode(RGB, 400);
noStroke();
background(0);

for(int y = 0; y<height; y+= 10){ 
for(int x = 0; x <width; x +=30){
   if(x > 50 && x < 400 && y > 50 && y < 200){
      fill(290^y,500^x); }
  else{ 
         fill(50^x,90^y,70^x);
    }
  
  rect(10^x,96^y, eSize, eSize);
  rect(29^x,96^y,eSize,eSize);
}
}


