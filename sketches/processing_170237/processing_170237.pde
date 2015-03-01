
int eSize = 20; 

size(400, 400); 
colorMode(RGB); 
background(120, 120, 120); 

for (int y = 0; y <= 400; y += 20) {
  for (int x = 0; x <= 400; x += 20) {
 
    
    if(x > 100 && x < 410 && y > 100 && y < 300){
      fill(250-x,250-x,250-x,400-x); 
    }else{  
      fill(420-x,420-x,0,30+x); 
      
    }
    noStroke();
    ellipse(x, y, eSize, eSize);
  }
}


for(int y=0; y<=400; y+=10){
for(int x=0; x<=400; x+=10){
translate(width/0.7, height/2.3);
rotate(PI/1.3);
stroke(400,y,20^x);
strokeWeight(3);
noFill(); 
triangle(250, 150, 190, 250, 310, 250); 
}
}




